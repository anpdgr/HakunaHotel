import '@babel/polyfill'
import 'mutationobserver-shim'
import Vue from 'vue'
import './plugins/bootstrap-vue'
import App from './App.vue'
import router from './router'
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'

Vue.use(IconsPlugin)


Vue.config.productionTip = false


new Vue({
  BootstrapVue,
  router,
  render: h => h(App),
}).$mount('#app')