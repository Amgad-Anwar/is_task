<template>
  <div class="container mt-5">
    <div class="text-center">
      <h2>SignIn</h2>
    </div>

    <!-- Loader Overlay -->
    <div v-if="isLoading" class="loader-overlay">
      <img src="https://is.net.sa/wp-content/uploads/2024/08/logo.svg" alt="Loading..." class="loader-logo" />
    </div>

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

      <button type="submit" class="btn btn-primary" :disabled="isLoading">Login</button>
      <router-link to="/signup" class="text-decoration-none text-primary mx-5">Register now?</router-link>
    </form>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { useAuthStore } from '../stores/auth';
import { useRouter } from 'vue-router';

// States
const credentials = ref({
  mobile: '',
  password: '',
});
const isLoading = ref(false); // Loader state

const authStore = useAuthStore();
const router = useRouter();

const handleLogin = async () => {
  isLoading.value = true; // Show loader
  try {
    await authStore.login(credentials.value, router);
  } catch (error) {
    console.error(error);
  } finally {
    isLoading.value = false; // Hide loader
  }
};
</script>

<style scoped>
/* Loader Styles */
.loader-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: rgba(255, 255, 255, 0.8);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000;
}

.loader-logo {
  width: 100px; /* Adjust size as needed */
  height: auto;
  animation: pulse 1.5s ease-in-out infinite;
}

@keyframes pulse {
  0%, 100% {
    transform: scale(1);
  }
  50% {
    transform: scale(1.2);
  }
}
</style>
