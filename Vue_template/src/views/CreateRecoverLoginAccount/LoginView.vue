<template>
  <main class="bodyFormCreate">
    <form class="formCreateAcc" @submit.prevent="submitForm">
      <h1 class="loginTitle">Login</h1>
      <div class="inputAreaText">
        <label for="email">Email</label>
        <input type="email" name="email" id="" placeholder="email@gmail.com" v-model="formData.email">
      </div>
      <div class="inputAreaText">
        <label for="password">Password</label>
        <input type="password" name="password" id="" minlength="8" maxlength="32" placeholder="pA&h8.Aa" v-model="formData.password">
      </div>
      <input class="buttonSubmit" type="submit">
      <div>
          <RouterLink class="btnChangeCL" to="/recoverPassword">Recover Password</RouterLink>
          <RouterLink class="btnChangeCL" to="/createAcc">Create Account</RouterLink>
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
      password:'',
    });

    const submitForm = async () => {
      try {
        const response = await axios.post('http://localhost:3000/login', formData.value);
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
