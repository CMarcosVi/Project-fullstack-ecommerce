<template>
  <main class="bodyFormCreate">
    <form class="formCreateAcc" @submit.prevent="submitForm">
      <h1 class="loginTitle">Create Account</h1>
      <div class="inputAreaText">
        <label for="name">Nick user</label>
        <input type="text" name="name" id="name" placeholder="UserName" v-model="formData.name">
      </div>
      <div class="inputAreaText">
        <label for="email">Email</label>
        <input type="email" name="email" id="email" placeholder="email@gmail.com" v-model="formData.email">
      </div>
      <div class="inputAreaText">
        <label for="password">Password</label>
        <input type="password" name="password" id="password" minlength="8" maxlength="32" placeholder="pA&h8.Aa" v-model="formData.password">
      </div>
      <button class="buttonSubmit" type="submit">Create Account</button>
      <div v-if="successMessage">
        <p class="successMessage">successfully registered user</p>
      </div>
      <div>
        <router-link class="btnChangeCL" to="/loginView">Log In</router-link>
        <router-link class="btnChangeCL" to="/">&lt;&lt;&lt;Home</router-link>
      </div>
    </form>
  </main>
</template>

<script lang="ts">
import { ref } from 'vue';
import axios from 'axios';
import { RouterLink } from 'vue-router';

interface FormData {
  name: string;
  email: string;
  password: string;
}

export default {
  components: {
    RouterLink
  },
  setup() {
    const formData = ref<FormData>({
      name: '',
      email: '',
      password: ''
    });
    const successMessage = ref<boolean>(false);

    const submitForm = async () => {
      try {
        const response = await axios.post('http://localhost:3000/accountCreate', formData.value);
        console.log(response.data);
        if (response.status === 200) {
          formData.value.name = '';
          formData.value.email = '';
          formData.value.password = '';
          successMessage.value = true;
        }
        // You can add further actions here, like showing a success message or redirecting the user
      } catch (err) {
        console.error(err);
        // Add error handling here, such as displaying an error message to the user
      }
    };

    return {
      formData,
      submitForm,
      successMessage
    };
  }
};
</script>

<style>
/* Estilos aqui */
</style>
