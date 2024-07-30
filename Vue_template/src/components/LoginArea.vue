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
  
<script setup lang="ts">
  import { ref } from 'vue';
  import axios from 'axios';
  
    interface formEnv{
      email: string,
      password: string
    }
  
    const formData = ref<formEnv>({
      email: '',
      password:'',
    });
  
    const createCookie = (name: string,value: string,timeDefault: number) => {
      let expires = "";
      if (timeDefault) {
        const date = new Date();
        date.setTime(date.getTime() + (timeDefault * 24 * 60 * 60 * 1000));
        expires = "; expires=" + date.toUTCString();
      }else{
        const date = new Date();
        date.setTime(date.getTime() + (timeDefault * 24 * 60 * 60 * 1000));
      }
      document.cookie = name + "=" + (value || "") + expires + "; path=/";
    }
    const submitForm = async () => {
      try {
        const response = await axios.post('http://localhost:3000/login', formData.value);
        console.log(response.data);
        createCookie(response.data.email,response.data.password,1);
      } catch (err) {
        console.error('erro');
        // Add error handling here, such as displaying an error message to the user
      }
    };
  
</script>
  