<template>
  <div class="container mt-5">
    <div class="text-center" > <h2>SignIn </h2> </div>

    <form @submit.prevent="handleLogin">
      <div class="mb-3">
        <label for="mobile" class="form-label">Mobile</label>
        <input
          type="text"
          class="form-control"
          id="mobile"
          v-model="credentials.mobile"
          required
        />
      </div>

      <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <input
          type="password"
          class="form-control"
          id="password"
          v-model="credentials.password"
          required
        />
      </div>

      <button type="submit" class="btn btn-primary">Login</button>
        <router-link to="/signup" class="text-decoration-none text-primary mx-5">Register now?</router-link>
    </form>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { useAuthStore } from '../stores/auth';
import { useRouter } from 'vue-router';

const credentials = ref({
  mobile: '',
  password: '',
});

const authStore = useAuthStore();
const router = useRouter();

const handleLogin = async () => {
  try {
    await authStore.login(credentials.value , router);
  } catch (error) {
    console.error(error);
  }
};
</script>
