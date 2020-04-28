import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../components/HomeElem/Home.vue'
import Reg from '../components/Register.vue'
import LogIn from '../components/login.vue'

Vue.use(VueRouter)

const routes = [
    {
        path: '/',
        name: 'HelloWorld',
        component: Home
    },
    {
        path: '/register',
        name: 'regis',
        component: Reg
    },
    {
        path: '/login',
        name: 'log',
        component: LogIn
    }
]

const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
})

export default router