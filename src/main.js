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
import store from './store'

//fir icon
import { BootstrapVue, BootstrapVueIcons } from 'bootstrap-vue'

Vue.use(BootstrapVue)
Vue.use(BootstrapVueIcons)

Vue.use(VueAxios, axios)


Vue.config.productionTip = false

//BootstrapVue,
new Vue({
  store,
  router,
  Chart,
  render: h => h(App),
}).$mount('#app')