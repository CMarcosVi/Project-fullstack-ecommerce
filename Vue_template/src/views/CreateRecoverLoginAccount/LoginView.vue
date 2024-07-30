<template>
  <main>
    <div v-if="name && cookieObjectName && cookieObjectPassword ">
      <UserArea :name="name" :email="cookieObjectName" />
    </div>
    <div v-else>
      <LoginArea />
    </div>
  </main>
</template>

<script setup lang='ts'>
  import { ref, onMounted } from 'vue';
  import axios from 'axios'; // Import axios
  import LoginArea from '../../components/LoginArea.vue';
  import UserArea from '../../components/UserArea.vue';

  function getCookie(name: string): string | null {
    const value = `; ${document.cookie}`;
    const parts = value.split(`; ${name}=`);
    if (parts.length === 2) {
      return parts.pop()?.split(';').shift() ?? null;
    }
    return null;
  }

  const storedCookieName = 'name';
  const storedCookiePassword = 'password';
  const cookieObjectName = ref<string | null>(getCookie(storedCookieName));
  const cookieObjectPassword = ref<string | null>(getCookie(storedCookiePassword));
  const name = ref<string | null>(null); // Inicialize como null
  const formData = ref<{ email: string | null, password: string | null }>({
    email: cookieObjectName.value,
    password: cookieObjectPassword.value,
  });

  const submitForm = async () => {
    try {
      if (formData.value.email && formData.value.password) {
        const response = await axios.post('http://localhost:3000/toCompareCookies', formData.value);
        name.value = response.data.name; 
        console.log(response.data.name);
      } else {
        console.warn('Form data is incomplete.');
      }
    } catch (err) {
      console.error('Error during form submission:', err);
    }
  };
  onMounted(() => {
    submitForm();
  });
</script>
