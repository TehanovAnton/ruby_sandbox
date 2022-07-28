<script setup>
import { ref } from "vue";

const newUser = ref({});

function signUp(event) {
  event.preventDefault();

  newUser.value = { call: "done" };
}
</script>

<template>
  {{ newUser }}
  <form @click="signUp">
    Name:<input type="text" v-model="newUser.name" />
    <br />

    Nick name:<input type="text" v-model="newUser.nickName" />
    <br />

    Email:<input type="text" v-model="newUser.email" />
    <br />

    Password:<input type="text" v-model="newUser.password" />
    <br />

    <button>Sign up</button>
  </form>
</template>
