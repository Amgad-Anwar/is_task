import 'bootstrap/dist/css/bootstrap.min.css';  // Import Bootstrap's CSS
import { createApp } from 'vue';
import App from './App.vue';
import { createPinia } from 'pinia';
import router from './router';
import 'vue3-toastify/dist/index.css';
import 'vuetify/styles';
import '@mdi/font/css/materialdesignicons.css';

const pinia = createPinia();

createApp(App)
  .use(pinia)
  .use(router)
  .mount('#app');  
