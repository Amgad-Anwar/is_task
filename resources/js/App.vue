<template>
  <v-app>
    <v-main>
      <router-view />
    </v-main>
  </v-app>
</template>

<script setup>
// You can remove the store import here if not used
import 'vuetify/styles';
//import '@mdi/font/css/materialdesignicons.css';
</script>

<style scoped>
body {
  margin: 0;
  font-family: 'Roboto', sans-serif;
}
</style>
