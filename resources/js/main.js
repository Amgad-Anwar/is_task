import { createApp } from 'vue';
import App from './App.vue';
import { createPinia } from 'pinia';
import router from './router';
import 'vue3-toastify/dist/index.css';

import { createVuetify } from 'vuetify';
import 'vuetify/styles';
import '@mdi/font/css/materialdesignicons.css';

const pinia = createPinia();
const vuetify = createVuetify();

createApp(App)
  .use(pinia)
  .use(router)
  .use(vuetify)
  .mount('#app');
