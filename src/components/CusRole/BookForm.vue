<template>
  <div>
    <NavLO />
    <br /><br /><br />
    <p>Card check</p>

    <div id="CARD">
      <b-card title="Available room" sub-title="Date: ">
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
            <tr>
              <th scope="row">
                <div style="width:90%; margin:auto">
                  <p>Room type 1</p>
                  <p style="font-size:small;">Description: .....................................................................</p>
                </div>
              </th>
              <td>2</td>
              <td>THB 2,500</td>
              <td>
                <div id="noRoom1">
                  <b-form-select
                    v-model="selected1"
                    :options="options"
                    size="sm"
                    class="mb-3"
                  ></b-form-select>
                </div>
              </td>
              <td rowspan="3">
                <!-- rowspan = for ตามจน.รูมไทป์ -->
                <a href="payment">
                  <b-button id='reserve' variant="primary">Reserve</b-button>
                </a>
              </td>
            </tr>

            <tr>
              <th scope="row">
                <div style="width:90%; margin:auto">
                  <p>Room type 2</p>
                  <p style="font-size:small;">Description: .....................................................................</p>
                </div>
              </th>
              <td>3</td>
              <td>THB 8,900</td>
              <td>
                <div id="noRoom2">
                  <b-form-select
                    v-model="selected2"
                    :options="options"
                    size="sm"
                    class="mb-3"
                  ></b-form-select>
                </div>
              </td>
            </tr>

            <tr>
              <th scope="row">
                <div style="width:90%; margin:auto">
                  <p>Room type 3</p>
                  <p style="font-size:small;">Description: .....................................................................</p>
                </div>
              </th>
              <td scope="row">4</td>
              <td>THB 120,000</td>
              <td>
                <div id="noRoom3">
                  <b-form-select
                    v-model="selected3"
                    :options="options"
                    size="sm"
                    class="mb-3"
                  ></b-form-select>
                </div>
              </td>
            </tr>
          </tbody>
        </table>

        <p>roomtype1: {{selected1}} rooms<br>
           roomtype2: {{selected2}} rooms<br>
           roomtype3: {{selected3}} rooms</p>
      </b-card>
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
      selected1: 0,
      options: [
        { value: 0, text: "0" },
        { value: 1, text: "1" },
        { value: 2, text: "2" },
        { value: 3, text: "3" },
        { value: 4, text: "4" },
      ],
      selected2: 0,
      selected3: 0,
      //ตามจน.รูมไทป์ ฟอร์ไป (รอดาต้า)
    };
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
  width:100%;
}

table td {
  word-wrap: break-word;
}
#reserve{
    font-size:16px;
    padding: 10px 24px;
    transition-duration: 0.4s;
}
#reserve:hover{
    background-color:darkblue;
    color:white;
}
</style>
