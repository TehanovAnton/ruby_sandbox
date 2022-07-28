import { createApp } from "vue";
import App from "./App.vue";
import router from "./router/router";

import { createClient } from "villus";

const app = createApp(App);

const client = createClient({
  url: "http://localhost:3000/graphql",
});

app.use(router);
app.use(client);

app.mount("#app");
