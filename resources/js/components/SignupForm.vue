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
      <!-- Name (EN) and (AR) fields -->
      <div class="mb-3">
        <label for="name_en" class="form-label">Name (EN)</label>
        <input
          type="text"
          class="form-control"
          id="name_en"
          v-model="userData.name_en"
          required
        />
        <span v-if="errors.name_en" class="text-danger">{{ errors.name_en }}</span>
      </div>

      <div class="mb-3">
        <label for="name_ar" class="form-label">Name (AR)</label>
        <input
          type="text"
          class="form-control"
          id="name_ar"
          v-model="userData.name_ar"
          required
          @input="validateArabicName"
        />
        <span v-if="errors.name_ar" class="text-danger">{{ errors.name_ar }}</span>
      </div>

      <!-- Hijri Date Picker -->


        <HijriDatePicker v-model="userData.dob_hijri"
         :dob_hijri="userData.dob_hijri"
         :setDate="setDate"
          @date-changed="onDateChange" />
        <span v-if="errors.dob_hijri" class="text-danger">{{ errors.dob_hijri }}</span>


      <div class="mb-3">
        <label for="mobile" class="form-label">Mobile</label>
        <input
          type="text"
          class="form-control"
          id="mobile"
          v-model="userData.mobile"
          required
          @input="validateMobileNumber"
        />
        <span v-if="errors.mobile" class="text-danger">{{ errors.mobile }}</span>
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
        <span v-if="errors.password" class="text-danger">{{ errors.password }}</span>
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
        <span v-if="errors.password_confirmation" class="text-danger">{{ errors.password_confirmation }}</span>
      </div>

      <button type="submit" class="btn btn-primary" :disabled="isLoading">Signup</button>
      <router-link to="/login" class="text-decoration-none text-primary mx-5">Already have an account?</router-link>
    </form>
  </div>
</template>

<script setup>
import { ref, watch } from 'vue';
import { useAuthStore } from '../stores/auth';
import { useRouter } from 'vue-router';
import HijriDatePicker from './hijra.vue';
import moment from 'moment-hijri';



const userData = ref({
  name_en: '',
  name_ar: '',
  dob_hijri: moment(),
  mobile: '',
  password: '',
  password_confirmation: '',
});

const setDate = (date) => {
    userData.value.dob_hijri = date
};

const isLoading = ref(false);
const errors = ref({});
const selectedDate = ref(null);

const authStore = useAuthStore();
const router = useRouter();

const handleSignup = async () => {
  if (!validateForm()) return;

  isLoading.value = true;
  try {
    await authStore.signup(userData.value, router);
  } catch (error) {
    console.error(error);
  } finally {
    isLoading.value = false;
  }
};

watch(() => userData.value.name_ar, (newValue) => {
  userData.value.name_ar = newValue.replace(/[^\u0600-\u06FF\s]/g, '');

  if (!userData.value.name_ar || !/^[\u0600-\u06FF\s]+$/.test(userData.value.name_ar)) {
    errors.value.name_ar = "Name in Arabic must only contain Arabic letters.";
  } else {
    errors.value.name_ar = null;
  }
});
watch(() => userData.value.name_en, (newValue) => {
  userData.value.name_en = newValue.replace(/[^a-zA-Z\s]/g, '');

  if (!userData.value.name_en || !/^[a-zA-Z\s]+$/.test(userData.value.name_en)) {
    errors.value.name_en = "Name in English must only contain English letters.";
  } else {
    errors.value.name_en = null;
  }
});


const validateForm = () => {
  errors.value = {};
    if (!userData.value.name_en.trim() || !/^[A-Za-z\s]+$/.test(userData.value.name_en)) {
      errors.value.name_en = "Name in English is required and should contain only English characters.";
    }
  if (!userData.value.name_ar.trim() || !/^[\u0600-\u06FF\s]+$/.test(userData.value.name_ar)) {
    errors.value.name_ar = "Name in Arabic must only contain Arabic letters.";
  }
  if (!userData.value.dob_hijri) errors.value.dob_hijri = "Hijri Date of Birth is required.";
    if (!userData.value.mobile || !/^(01[0-2,5][0-9]{8}|05[0-9]{8})$/.test(userData.value.mobile)) {
    errors.value.mobile = "Invalid Egyptian or Saudi mobile number format.";
    }

  if (!userData.value.password) errors.value.password = "Password is required.";
  if (userData.value.password !== userData.value.password_confirmation) {
    errors.value.password_confirmation = "Passwords do not match.";
  }

  return Object.keys(errors.value).length === 0;
};

// Handle Hijri date conversion
const onDateChange = (date) => {
  if (date) {
    userData.value.dob_hijri = moment(date).format('iYYYY/iMM/iDD');
  }
};

// Optional: You can add methods for other input validations like mobile number, etc.
</script>

<style scoped>
/* Styles for loader and form elements */
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

.text-danger {
  font-size: 0.85rem;
}
</style>
