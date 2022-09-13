<script setup>
  import { ref } from "vue";
  import router from "../router/router";

  const signInView = () => router.push({ name: "signIn" });

  async function signOut(event) {
    event.preventDefault();

    const signOutUrl = 'http://127.0.0.1:3000/auth/sign_out'
    const signOutOptions = {
      method: "DELETE",
      mode: "cors"
    };
    const response = await fetch(signOutUrl, signOutOptions);

    if (response.ok) {
      signInView()
    } else {
      console.log('something went wrong')
    }
  }
</script>

<template>
  <h1>Hello There</h1>
  <br>

  <button @click="signOut" >Sign Out</button>
</template>