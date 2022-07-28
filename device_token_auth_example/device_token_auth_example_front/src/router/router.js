import { createRouter, createWebHistory } from "vue-router";
import UserSignUp from "../views/users/UserSignUp.vue";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/sign_up",
      name: "sign_up",
      component: UserSignUp,
    },
  ],
});

export default router;
