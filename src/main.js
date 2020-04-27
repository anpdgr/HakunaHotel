import '@babel/polyfill'
import 'mutationobserver-shim'
import Vue from 'vue'
import './plugins/bootstrap-vue'
import App from './App.vue'
import router from './router'
//import vueCountryRegionSelect from 'vue-country-region-select'
//import Vuelidate from 'vuelidate'



//Vue.use(Vuelidate)
Vue.config.productionTip = false
//Vue.use(vueCountryRegionSelect)

new Vue({
  router,
  render: h => h(App),
}).$mount('#app')