<script setup>
  import { ref } from "vue";
  import router from "../../router/router";

  const credentials = ref({})

  const signUpView = () => router.push({ name: "signIn" });
  const homeView = () => router.push({ name: "home" });

  async function authenticate(event) {
    event.preventDefault();

    const signInUrl =  'http://localhost:3000/auth/sign_in'
    const signInOptions = {
      method: "POST",
      mode: "cors",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: new URLSearchParams(credentials.value).toString(),
    };

    const response = await fetch(signInUrl, signInOptions);
    debugger
    if (response.ok) {
      homeView()
    } else {
      console.log('something went wrong')
    }
  }
</script>

<template>
  <form @submit="authenticate">
    Email:<input type="text" v-model="credentials.email" />
    <br />

    Password:<input type="text" v-model="credentials.password" />
    <br />

    <button>Sign In</button>
  </form>

  <input type="button" @click="signUpView" value="Sign Up" />
</template>
