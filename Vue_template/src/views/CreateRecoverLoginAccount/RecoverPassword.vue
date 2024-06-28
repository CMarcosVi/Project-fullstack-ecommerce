<template>
  <main class="bodyFormCreate">
    <form class="formRecover" @submit.prevent="submitForm">
      <div class="inputAreaText">
        <label for="email">Email</label>
        <input type="email" name="email" id="" v-model="formData.email">
      </div>
        <input class="buttonSubmit" type="submit" placeholder="To send">
        <div>
            <RouterLink class="btnChangeCL" to="/loginView">Log In</RouterLink>
            <RouterLink class="btnChangeCL" to="/">&lt;&lt;&lt;Home</RouterLink>
        </div>
    </form>
  </main>
</template>

<script>
import { ref } from 'vue';
import axios from 'axios';

export default {
  setup() {
    const formData = ref({
      email: '',
    });

    const submitForm = async () => {
      try {
        const response = await axios.post('http://localhost:3000/recoverpassword', formData.value);
        console.log(response.data);
        // You can add further actions here, like showing a success message or redirecting the user
      } catch (err) {
        console.error(err);
        // Add error handling here, such as displaying an error message to the user
      }
    };

    return {
      formData,
      submitForm
    };
  }
}
</script>
