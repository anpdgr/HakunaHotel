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
      room: null,
      num_room: 0,
      codepromo: null
    },
    book:false,
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
    getBookNumRoom(state){
      return state.booking.num_room;
    },
    getBookCode(state){
      return state.booking.codepromo;
    },
    getBook(state){
      return state.book;
    }
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
    ck_in(state, ck_in_date){
      state.booking.check_in = ck_in_date;
    },
    ck_out(state, ck_out_date){
      state.booking.check_out = ck_out_date;
    },
    numGuest(state, num_g){
      state.booking.num_guest = num_g;
    },
    selRoom(state, type){
      state.booking.room =type;
    },
    numRoom(state, num_r){
      state.booking.num_room = num_r;
    },
    codePro(state, code){
      state.booking.codepromo = code;
    },
    statusBook(state, status){
      state.book = status;
    }

  },
  // Call function from component
  actions: {
    AcUser(context, user){
      context.commit('setUser', user);
    },
    AcCkIn(context, ck_in_date){
      context.commit('ck_in', ck_in_date);
    },
    AcCkOut(context, ck_out_date){
      context.commit('ck_out', ck_out_date);
    },
    AcNumG(context, num_g){
      context.commit('numGuest', num_g);
    },
    AcType(context, type){
      context.commit('selRoom', type);
    },
    AcNRoom(context, num_r){
      context.commit('numRoom', num_r);
    },
    AcCode(context, code){
      context.commit('codePro', code);
    },
    AcBook(context, status){
      context.commit('statusBook', status);
    }
    
  },
  modules: {
  }
})
