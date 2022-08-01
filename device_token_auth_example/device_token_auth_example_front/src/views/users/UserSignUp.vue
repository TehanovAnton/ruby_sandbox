<script setup>
import { ref } from "vue";
import router from "../../router/router";

const newUser = ref({
  name: "Anton",
  nickname: "Leichu",
  email: "tehanovanton@gmail.com",
  password: 12345678,
  password_confirmation: 12345678,
});

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

  const response = await fetch(sign_up_url, sign_up_options);
  if (response.ok) {
    router.psuh({ name: "signIn" });
  }
}

const signInVew = () => router.push({ name: "signIn" });
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

  <input type="button" @click="signInVew" value="Sign In" />
</template>
