<template>
  <div id="pp">
    <Home/>
  </div>
</template>

<script>
//import Home from './components/CusRole/sidebar_cus.vue'
import Home from './components/route.vue'

//for test
//import Home from './components/StatusHotel/test.vue'


export default {
  name: 'app',
  components: {
    Home
  }
}
</script>

<style>
@import url('https://fonts.googleapis.com/css?family=Frank+Ruhl+Libre&display=swap');
#app {
  font-family: "Avenir, Helvetica, Arial, sans-serif";
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
.application {
  font-family: "Avenir, Helvetica, Arial, sans-serif";
}
</style>
