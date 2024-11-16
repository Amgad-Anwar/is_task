<template>
  <div class="container mt-5">
    <div class="text-center">
      <h2>SignUp</h2>
    </div>

    <!-- Loader Overlay -->
    <div v-if="isLoading" class="loader-overlay">
      <img src="https://is.net.sa/wp-content/uploads/2024/08/logo.svg" alt="Loading..." class="loader-logo" />
    </div>

    <form @submit.prevent="handleSignup">
      <div class="mb-3">
        <label for="name_en" class="form-label">Name (EN)</label>
        <input
          type="text"
          class="form-control"
          id="name_en"
          v-model="userData.name_en"
          required
        />
      </div>

      <div class="mb-3">
        <label for="name_ar" class="form-label">Name (AR)</label>
        <input
          type="text"
          class="form-control"
          id="name_ar"
          v-model="userData.name_ar"
          required
        />
      </div>

      <div class="mb-3">
        <label for="dob_hijri" class="form-label">DOB (Hijri)</label>
        <input
          type="date"
          class="form-control"
          id="dob_hijri"
          v-model="userData.dob_hijri"
          required
        />
      </div>

      <div class="mb-3">
        <label for="mobile" class="form-label">Mobile</label>
        <input
          type="text"
          class="form-control"
          id="mobile"
          v-model="userData.mobile"
          required
        />
      </div>

      <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <input
          type="password"
          class="form-control"
          id="password"
          v-model="userData.password"
          required
        />
      </div>

      <div class="mb-3">
        <label for="password_confirmation" class="form-label">Confirm Password</label>
        <input
          type="password"
          class="form-control"
          id="password_confirmation"
          v-model="userData.password_confirmation"
          required
        />
      </div>

      <button type="submit" class="btn btn-primary" :disabled="isLoading">Signup</button>
      <router-link to="/login" class="text-decoration-none text-primary mx-5">Already have an account?</router-link>
    </form>
  </div>
</template>

<script setup>
import { ref } from 'vue';
import { useAuthStore } from '../stores/auth';
import { useRouter } from 'vue-router';

// States
const userData = ref({
  name_en: '',
  name_ar: '',
  dob_hijri: '',
  mobile: '',
  password: '',
  password_confirmation: '',
});

const isLoading = ref(false);
const authStore = useAuthStore();
const router = useRouter();

const handleSignup = async () => {
  isLoading.value = true;
  try {
    await authStore.signup(userData.value, router);
  } catch (error) {
    console.error(error);
  } finally {
    isLoading.value = false;
  }
};
</script>

<style scoped>

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
  width: 100px; 
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
