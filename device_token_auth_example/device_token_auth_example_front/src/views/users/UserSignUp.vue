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

  const signInView = () => router.push({ name: "signIn" });

  async function signUp(event) {
    event.preventDefault();

    const signUpUrl = "http://localhost:3000/auth";
    const signUpOptions = {
      method: "POST",
      mode: "cors",
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: new URLSearchParams(newUser.value).toString(),
    };

    const response = await fetch(signUpUrl, signUpOptions);
    if (response.ok) {
      signInView()
    }
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

  <input type="button" @click="signInVew" value="Sign In" />
</template>
