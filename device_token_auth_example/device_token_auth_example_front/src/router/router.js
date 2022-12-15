import { createRouter, createWebHistory } from "vue-router";

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: "/sign_up",
      name: "signUp",
      component: () => import("../views/users/UserSignUp.vue"),
    },
    {
      path: "/sign_in",
      name: "signIn",
      component: () => import("../views/users/UserSignIn.vue")
    },
    {
      path: "/home",
      name: "home",
      component: () => import("../views/Home.vue")
    }
  ],
});

export default router;
