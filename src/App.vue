<template>
  <div id="app">
    <Home/>
  </div>
</template>

<script>
//import Home from './components/CusRole/sidebar_cus.vue'
import Home from './components/route.vue'


export default {
  name: 'App',
  components: {
    Home
  }
}
</script>

<style>
@import url('https://fonts.googleapis.com/css?family=Frank+Ruhl+Libre&display=swap');
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
