import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  // Global var
  state: {
    count:1,
    user:null
  },
  // Ref state
  getters:{
    getCount(state){
      return state.count;
    },
    getUser(state){
      return state.user;
    }

  },
  // Function Global
  mutations: {
    add(state){
      state.count++;
    },
    del(state){
      state.count--;
    },
    setUser(state,user){
      state.user = user;
    }
  },
  // Call function from component
  actions: {
    Acadd(context){
      context.commit('add');
    },
    Acdel(context){
      context.commit('del');
    },
    AcUser(context,user){
      context.commit('setUser',user);
    }
  },
  modules: {
  }
})
