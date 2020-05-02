<template>
    <div>
    <b-card no-body>
      <b-tabs card>
        <!-- Render Tabs, supply a unique `key` to each tab -->
        <b-tab v-for="i in tabs" :key="'dyn-tab-' + i" :title="'Guest ' + (i+1)">
            <b-form>
                <b-form-group label="Name title:" >
                    <b-form-select
                        id="ip-title"
                        v-model="g.title"
                        :options="title"
                        placeholder="-- select one --"
                        required
                    ></b-form-select>
                </b-form-group>
                <b-form-group label="First Name:">
                    <b-form-input
                        id="ip-fname"
                        v-model="g.fname"
                        required
                        placeholder="enter first name"
                    ></b-form-input>
                </b-form-group>
                <b-form-group label="Last Name:">
                    <b-form-input
                        id="ip-lname"
                        v-model="g.lname"
                        required
                        placeholder="enter last name"
                    ></b-form-input>
                </b-form-group>
                <b-form-group label="Phone number:">
                    <b-form-input
                        id="ip-tel"
                        v-model="g.tel"
                        type="tel"
                        required
                        placeholder="enter phone number"
                    ></b-form-input>
                </b-form-group>
                                                    
                <b-form-group label="Country:" >
                    <b-form-input
                        id="ip-country"
                        v-model="g.country"
                        required
                    ></b-form-input>
                </b-form-group>                                   
            </b-form>                                    
    </b-tab>

        <!-- New Tab Button (Using tabs-end slot) -->
        <template v-slot:tabs-end>
          <b-nav-item role="presentation" @click.prevent="check()"  href="#"><b>+</b></b-nav-item>
        </template>

        <!-- Render this if no tabs -->
        <template v-slot:empty>
          <div class="text-center text-muted">
            Add Guest information<br>
            Open a new tab using the <b>+</b> button above.
          </div>
        </template>
      </b-tabs>
    </b-card>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        tabs: [],
        tabCounter: 0,
        g: {
          tel:'',
          title: null,
          fname: '',
          lname: '',
          country: null,
          
        },
        title: [{ text: 'Select One', value: null }, 'Mr.', 'Ms.', 'Miss'],
      }
    },
    methods: {
      newTab() {
        this.tabs.push(this.tabCounter++)
      },
      check(){
      if(this.g.tel===null | this.g.title===null | this.g.fname===null
      | this.g.lname===null | this.g.country===null | this.roomid===null && this.tabCounter!=0){
        this.makeToast('danger','You have not done all the fields yet.')
      }
      else{
          this.newTab();
      }
    },
      makeToast(variant = null, text) {
      this.$bvToast.toast(text, {
        variant: variant,
        solid: true,
        toaster: "b-toaster-bottom-center",
      });
    },
    }
  }
</script>


