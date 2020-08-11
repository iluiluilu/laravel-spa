<template>
  <div id="app">
    <loading ref="loading" />
    <div id="nav">
      <router-link to="/">Home</router-link> |
      <router-link to="/about">About</router-link>
    </div>
    <router-view />
  </div>
</template>
<script>
import Loading from "./components/commons/Loading";
export default {
  el: "#app",
  components: {
    Loading
  },
  data: () => ({
    toast_counter: 0
  }),
  methods: {
    showToast(title, msg, variant = "success", append = false) {
      this.toast_counter++;
      this.$bvToast.toast(msg, {
        title: title,
        toaster: "b-toaster-top-center",
        solid: true,
        appendToast: append,
        variant: variant
      });
    }
  },
  mounted() {
    this.$loading = this.$refs.loading;
  }
};
</script>
<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

#nav {
  padding: 30px;

  a {
    font-weight: bold;
    color: #2c3e50;

    &.router-link-exact-active {
      color: #42b983;
    }
  }
}
</style>
