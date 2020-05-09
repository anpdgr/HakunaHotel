import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  // Global var
  state: {
    booking:{
      check_in: null,
      check_out: null,
      num_guest: 0,
      room: [],
      codepromo: null
    },
    user:null
  },
  // Ref state
  getters:{
    // getCount(state){
    //   return state.count;
    // },
    getUser(state){
      return state.user;
    },
    getBookCkin(state){
      return state.booking.check_in;
    },
    getBookCkout(state){
      return state.booking.check_out;
    },
    getBookNumG(state){
      return state.booking.num_guest;
    },
    getBookRoom(state){
      return state.booking.room;
    },
    getBookCode(state){
      return state.booking.codepromo;
    },

  },
  // Function Global
  mutations: {
    // add(state){
    //   state.count++;
    // },
    // del(state){
    //   state.count--;
    // },
    setUser(state, user){
      state.user = user;
    },
    check_avi(state, ck_in_date, ck_out_date, num_g){
      state.booking = {
        check_in: ck_in_date,
        check_out: ck_out_date,
        num_guest: num_g
      }
      // console.log(ck_in_date);
      // console.log(ck_out_date);
      // console.log(num_g);

      // state.booking.check_in = ck_in_date;
      // state.booking.check_out = ck_out_date;
      // state.booking.num_guest = num_g;
    },
    ck_in(state, ck_in_date){
      state.booking.check_in = ck_in_date;
    },
    ck_out(state, ck_out_date){
      state.booking.check_out = ck_out_date;
    },
    numGuest(state, num_g){
      state.booking.num_guest = num_g;
    },
    
  },
  // Call function from component
  actions: {
    // Acadd(context){
    //   context.commit('add');
    // },
    // Acdel(context){
    //   context.commit('del');
    // },
    AcUser(context,user){
      context.commit('setUser',user);
    },
    // AcCkAvi(context, ck_in_date, ck_out_date, num_g){
    //   context.commit('check_avi', ck_in_date, ck_out_date, num_g);
    // },
    AcCkIn(context,ck_in_date){
      context.commit('ck_in',ck_in_date);
    },
    AcCkOut(context,ck_out_date){
      context.commit('ck_out',ck_out_date);
    },
    AcNumG(context,num_g){
      context.commit('numGuest',num_g);
    }
  },
  modules: {
  }
})
