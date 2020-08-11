<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png" />
    <HelloWorld msg="Welcome to Your Vue.js App" />
    <button v-on:click="startLoading">Start Loading</button>
    <button v-on:click="showToast">Start Loading</button>
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from "@/components/HelloWorld.vue";

export default {
  name: "Home",
  components: {
    HelloWorld
  },
  methods: {
    startLoading() {
      this.$root.$loading.start();
    },
    showToast() {
      this.$root.showToast("test", "test");
    }
  }
};
</script>
