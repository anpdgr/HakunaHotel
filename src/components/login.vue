<template>
    <body id="login">
        <div id="box">
          
            <b-card style="max-width:30rem; padding:30px; float: middle;"> 
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Sign in</h3>
                        <br>
                    </div>
                    <b-form @submit="onSubmit">
                        
                    <b-form-group id="ipg-uname" >
                        <b-form-input
                            id="ip-uname"
                            v-model="form.fname"
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

                        <div style="float: left;">
                        <b-button v-on:click="check=1" type="submit" variant="primary" >Sign in</b-button>
                        </div>
                    </b-form>
                </div>
                <br><br>
                <div id='back' style="text-align: right;">
                    <a href='register' style="text-decoration: underline;">I didn't have an account</a>
                    <br>
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

          username:'',
          password:''

        },
        show: true,
        check:0
      }
    },
    methods: {
      onSubmit(evt) {
        evt.preventDefault()
        //alert(JSON.stringify(this.form))
        this.$router.push('/')
      }
    }
  }
</script>

<style scoped>
    #back{
        text-align: right;
    }
    #box{
        max-width: 500px; 
        margin: auto;
        padding-top: 100px;
    }
    body {
        background-image: url('../assets/hotel.home.jpg');
        background-size: cover;
        background-repeat: no-repeat;
        background-position: center center;
        height: 100vh;
    }


</style>