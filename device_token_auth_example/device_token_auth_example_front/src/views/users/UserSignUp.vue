<script setup>
import { ref } from "vue";

const newUser = ref({});

async function signUp(event) {
  event.preventDefault();

  const sign_up_url = "http://localhost:3000/auth";
  const sign_up_options = {
    method: "POST",
    mode: "cors",
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
    body: new URLSearchParams(newUser.value).toString(),
  };

  await fetch(sign_up_url, sign_up_options);
}
</script>

<template>
  <form @submit="signUp">
    Name:<input type="text" v-model="newUser.name" />
    <br />

    Nick name:<input type="text" v-model="newUser.nickname" />
    <br />

    Email:<input type="text" v-model="newUser.email" />
    <br />

    Password:<input type="text" v-model="newUser.password" />
    <br />

    Password confirmation:<input
      type="text"
      v-model="newUser.password_confirmation"
    />
    <br />

    <button>Sign up</button>
  </form>
</template>
