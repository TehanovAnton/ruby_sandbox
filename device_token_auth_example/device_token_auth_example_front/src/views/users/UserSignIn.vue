<script setup>
  import { ref } from "vue";

  const credentials = ref({})
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

    const response = await (await fetch(signInUrl, signInOptions));
    if (response.ok) {
      debugger
      console.log('Great')
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
</template>
