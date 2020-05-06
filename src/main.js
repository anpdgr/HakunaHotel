import '@babel/polyfill'
import 'mutationobserver-shim'
import Vue from 'vue'
import './plugins/bootstrap-vue'
import App from './App.vue'
import router from './router'
import axios from 'axios'
import VueAxios from 'vue-axios'
import Chart from 'chart.js'
import "@/plugins/echarts";

Vue.use(VueAxios, axios)
//import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'




Vue.config.productionTip = false

//BootstrapVue,
new Vue({
  
  router,
  Chart,
  render: h => h(App),
}).$mount('#app')