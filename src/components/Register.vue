<template>
    <body id="regis">
        <div id="box">
            <b-card border-varient='Primary' class="container" style="padding:10px"> 
                <div id='left' class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Sign up</h3>
                    </div>
                    <b-form @submit="onSubmit">
                        <br>

                        <b-form-group id="ipg-email">
                        <b-form-input
                            id="ip-email"
                            v-model="form.email"
                            type="email"
                            required
                            placeholder="Email"
                        ></b-form-input>
                        </b-form-group>

                    <b-form-group id="ipg-uname" >
                        <b-form-input
                            id="ip-uname"
                            v-model="form.username"
                            required
                            placeholder="Username"
                        ></b-form-input>
                        </b-form-group>

                        <b-form-group id="ipg-pass">
                        <b-form-input
                            type="password"
                            id="ip-pass"
                            v-model="form.password"
                            required
                            placeholder="Password"
                        ></b-form-input>
                        </b-form-group>

                        <b-form-group id="ipg-cpass">
                        <b-form-input
                            type="password"
                            id="ip-cpass"
                            v-model="form.cpassword"
                            required
                            placeholder="Confirm your password"
                        ></b-form-input>
                        </b-form-group>

                        <div style="float: left;">
                        <b-button id="Sign up" type="submit" variant="primary">Sign up</b-button>
                        </div>
                    </b-form>
                </div>
                <br><br>
                <div id='back'>
                    <a href='/'>Back to home</a>
                </div>
            </b-card>
        </div>
    </body>
</template>

<script>
  export default {
    data() {
      return {
        form: {
          email: '',
          username:'',
          password:'',
          cpassword:'',

        },
        show: true
      }
    },
    methods: {
      onSubmit(evt) {
        evt.preventDefault() 
        this.$router.push('login')   
        //alert()
      }
    }
  }
</script>

<style scoped>
  #editcus {
    margin: 50px;
    
  }

    #back{
        text-align: right;
    }
    #box{
        max-width: 500px; 
        margin: auto;
        padding-top: 100px;
    }
    #left{
        max-width:30rem;
        padding:30px 20px;
        float: middle;
        text-align: left;
    }
    body {
        background-image: url('../assets/hotel.home.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center center;
        height: 100vh;
    }


</style>