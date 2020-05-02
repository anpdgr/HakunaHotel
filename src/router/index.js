import Vue from 'vue'
import VueRouter from 'vue-router'

import Home from '../components/HomeElem/Home.vue'
import Reg from '../components/Register.vue'
import LogIn from '../components/login.vue'

import Bookstatus from '../components/StatusHotel/Bookstatus.vue'
import Roomstatus from '../components/StatusHotel/Roomstatus.vue'

import sHome from '../components/StaffRole/StaffHome.vue'
import sEdit from '../components/StaffRole/Edit_staff.vue'
import sAddCode from '../components/StaffRole/AddCode.vue'
import CheckIn from '../components/StatusHotel/CheckIn.vue'

import mView from '../components/Manager/ViewStaff.vue'
import mHome from '../components/Manager/HomeMng.vue'
import mEdit from '../components/Manager/Edit_staff(mn).vue'

import MyProfile from '../components/CusRole/myprofile.vue'
import cEdit from '../components/CusRole/Edit_cus.vue'
import booking from '../components/CusRole/BookForm.vue'
import bookHis from '../components/CusRole/BookHis.vue'
import payment from '../components/CusRole/Payment.vue'

Vue.use(VueRouter)

const routes = [
    {
        path: '/',
        name: 'HelloWorld',
        component: Home,
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
    },

//staff and manager page
    {
        path: '/bookstatus',         //Status Hotel :book
        name: 'Bookstatus',
        component: Bookstatus,
    },
    {
        path: '/roomstatus',         //Status Hotel :room
        name: 'Roomstatus',
        component: Roomstatus,
    },
    {
        path: '/checkin',       //check-in form
        name: 'CheckIn',
        component: CheckIn,
    },
    {
        path: '/addcode',       //Add promo code
        name: 'SAddCode',
        component: sAddCode,
    },
    
//manager page
    {
        path: '/mhome',         //เหมือน sHome แค่เพิ่ม menu mView
        name: 'MHome',
        component: mHome,
    },
    {
        path: '/mviews',        //Manager view staff info
        name: 'MViews',
        component: mView,
    },
    {
        path: '/medit',         //Manager edit his profile
        name: 'MEdit',
        component: mEdit,
    },

//staff page
    {
        path: '/shome',
        name: 'SHome',
        component: sHome,
    },
    {
        path: '/sedit',         //Staff edit his profile
        name: 'SEdit',
        component: sEdit,
    },

//customer page
    {
        path: '/myprofile',         //show customer profile
        name: 'MyProfile',
        component: MyProfile,
    },
    {
        path: '/cedit',         //customer edit his profile
        name: 'CEdit',
        component: cEdit,
    },
    {
        path: '/booking',         //booking form
        name: 'Booking',
        component: booking,
    },
    {
        path: '/mybook',         //customer view his book his
        name: 'BookHis',
        component: bookHis,
    },
    {
        path: '/payment',         //customer's payment
        name: 'Payment',
        component: payment,
    },
]

const router = new VueRouter({
    mode: 'history',
    base: process.env.BASE_URL,
    routes
})

export default router
