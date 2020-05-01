import '@babel/polyfill'
import 'mutationobserver-shim'
import Vue from 'vue'
import './plugins/bootstrap-vue'
import App from './App.vue'
import router from './router'
//import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'




Vue.config.productionTip = false

//BootstrapVue,
new Vue({
  
  router,
  render: h => h(App),
}).$mount('#app')