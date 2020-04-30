<template>
  <div>
    <NavLO />
    <br /><br /><br /><br />
    <CheckAv />
    <br />
    <div id="CARD">
      <b-card
        title="Available room"
        sub-title="Date: checkin_date to checkout_date Number of guests: num_guest"
      >
        <table class="table table-bordered">
          <thead>
            <tr class="table-secondary">
              <th scope="col" width="35%">Room type</th>
              <th scope="col" width="18%">Limit guest</th>
              <th scope="col" width="15%">Price for .. nights</th>
              <th scope="col" width="11%">No. rooms</th>
              <th scope="col"></th>
            </tr>
          </thead>
          <tbody>
            <!-- ตัวอย่างข้อมูล -->
            <tr>
              <th scope="row">
                <div style="width:90%; margin:auto">
                  <p>Room type 1</p>
                  <p style="font-size:small;">
                    Description:
                    .....................................................................
                  </p>
                </div>
              </th>
              <td>2</td>
              <td>THB 2,500</td>
              <td>
                <div id="noRoom1">
                  <b-form-select
                    v-model="selected[0]"
                    :options="options"
                    size="sm"
                    class="mb-3"
                  ></b-form-select>
                </div>
              </td>
              <td rowspan="3">
                <!-- rowspan = for ตามจน.รูมไทป์ -->
                <b-button
                  id="reserve"
                  type="submit"
                  variant="primary"
                  @click="check()"
                  >Reserve</b-button
                >
              </td>
            </tr>
            <!-- ตัวอย่างข้อมูล -->
            <tr>
              <th scope="row">
                <div style="width:90%; margin:auto">
                  <p>Room type 2</p>
                  <p style="font-size:small;">
                    Description:
                    .....................................................................
                  </p>
                </div>
              </th>
              <td>
                 <b-avatar variant="light"></b-avatar>
                  <b-avatar variant="light"></b-avatar>
                   <b-avatar variant="light"></b-avatar>
              </td>
              <td>THB 8,900</td>
              <td>
                <div id="noRoom2">
                  <b-form-select
                    v-model="selected[1]"
                    :options="options"
                    size="sm"
                    class="mb-3"
                  ></b-form-select>
                </div>
              </td>
            </tr>
            <!-- ตัวอย่างข้อมูล -->
            <tr>
              <th scope="row">
                <div style="width:90%; margin:auto">
                  <p>Room type 3</p>
                  <p style="font-size:small;">
                    Description:
                    .....................................................................
                  </p>
                </div>
              </th>
              <td scope="row">4</td>
              <td>THB 120,000</td>
              <td>
                <div id="noRoom3">
                  <b-form-select
                    v-model="selected[2]"
                    :options="options"
                    size="sm"
                    class="mb-3"
                  ></b-form-select>
                </div>
              </td>
            </tr>
          </tbody>
        </table>

        <p>
          roomtype1: {{ selected[0] }} rooms<br />
          roomtype2: {{ selected[1] }} rooms<br />
          roomtype3: {{ selected[2] }} rooms
        </p>
        <p>{{ selected }}</p>
      </b-card>
    </div>
  </div>
</template>

<script>
import NavLO from "../NavLO.vue";
import CheckAv from "../HomeElem/CheckAvi";

export default {
  components: {
    NavLO,
    CheckAv,
  },
  data() {
    return {
      isZero: true,
      selected: [0, 0, 0],
      options: [
        { value: 0, text: "0" },
        { value: 1, text: "1" },
        { value: 2, text: "2" },
        { value: 3, text: "3" },
        { value: 4, text: "4" },
      ],
      //ตามจน.รูมไทป์ ฟอร์ไป (รอดาต้า)
    };
  },
  methods: {
    checkNull() {
      for (let i = 0; i < this.selected.length; i++) {
        if (this.selected[i] != 0) {
          this.isZero = false;
        }
      }
      return this.isZero;
    },
    check() {
      if (this.checkNull()) {
        this.makeToast('danger','Please select number of each room type.');

      } else {
        this.$router.push("payment");
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
  max-width: 75%;
  margin: auto;
}
table {
  table-layout: fixed;
  width: 100%;
}

table td {
  word-wrap: break-word;
}
#reserve {
  font-size: 16px;
  padding: 10px 24px;
  transition-duration: 0.4s;
}
#reserve:hover {
  background-color: darkblue;
  color: white;
}
</style>
