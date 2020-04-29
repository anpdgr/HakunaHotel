<template>
  <div>
    <NavLO />
    <br /><br /><br />
    <div id="CARD">
      <b-card border-variant="success" bg-variant="light" style="margin: 30px;" title="Billing">
        <div id="content">
          <div>
            <h5>Booking details</h5>
            <!-- ตัวอย่างข้อมูล -->
            <p>
              Booking ID: BKXXXXXX
              <span class="tab">Booking date: 16/09/42</span> <br />
              Check-in date: 11/08/43
              <span class="tab">Check-out date: 02/12/42</span> <br />
              Number of guests: 58 <span class="tab"></span> Billing name:
              Warakorn Inthong<br />
            </p>
          </div>

          <div>
            <h5>Rooms</h5>
            <!-- ตัวอย่างข้อมูล -->
            <h6>Room type1</h6>
            <p>2 rooms</p>
          </div>

          <div>
            <h5>Discount</h5>
            <!-- ตัวอย่างข้อมูล -->
            <h6>Code promotion: {{code}}</h6>
            <h6>Season discount</h6>
          </div>
<br>
          <div>
            <!-- ตัวอย่างข้อมูล -->
            <h5>Subtotal</h5>
            <h5>Tax</h5>
          </div>
          <hr>

          <div style='text-align:left;'>
            <!-- ตัวอย่างข้อมูล -->
            <h4><b>Total</b></h4>
            <input v-model='code' type='text' placeholder="Code promotion">
          </div>
        </div>
      </b-card>
      <div>
        <h5>Payment method:</h5>

        <b-form-radio-group
          size="lg"
          v-model="value"
          :options="options"
          :state="state"
          name="radio-validation"
        >
          <b-form-invalid-feedback :state="state">
            Please select one payment method
          </b-form-invalid-feedback>
          <b-form-valid-feedback :state="state">
            Further information about payment will be sent to your email.
          </b-form-valid-feedback>
        </b-form-radio-group>
      </div>
    </div>
    <div style="margin-top: 30px">
      <b-button
        v-b-tooltip.hover
        title="Please make sure that your information is correct"
        id="Confirm"
        type="submit"
        variant="success"
        @click="check()"
      >
        Confirm
      </b-button>
    </div>
  </div>
</template>

<script>
import NavLO from "../NavLO.vue";
export default {
  components: {
    NavLO,
  },
  data() {
    return {
      code:'',
      value: null,
      options: [
        { text: "Cash (hotel counter)", value: "counter" },
        { text: "Online banking", value: "online" },
        { text: "Credit card", value: "card" },
      ],
    };
  },
  computed: {
    state() {
      return Boolean(this.value);
    },
  },
  methods: {
    check() {
      if (this.value === null) {
        this.makeToast("danger", "Please select one payment method.");
      } else {
        this.makeToast("success", "Success");
        setTimeout(() => this.$router.push({ path: "/" }), 2000);
      }
    },
    makeToast(variant = null, text) {
      this.$bvToast.toast(text, {
        title: "Notice!",
        variant: variant,
        solid: true,
        toaster: "b-toaster-bottom-center",
      });
    },
  },
};
</script>

<style>
#CARD {
  max-width: 800px;
  margin: auto;
}
#content {
  margin: 40px;
}
h5 {
  text-align: left;
  font-weight: bold;
}
h6 {
  text-align: left;
  margin-left: 1rem;
}
p {
  text-align: left;
  margin-left: 2rem;
}
.tab {
  padding-left: 130px;
}
#Confirm {
  border-radius: 4px;
  font-size: 16px;
  padding: 12px 28px;
  transition-duration: 0.4s;
}
#Confirm:hover {
  background-color: limegreen;
  color: white;
}
</style>
