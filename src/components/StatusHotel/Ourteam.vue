<template>
  <div>
    <STnav />
    <Side/>
    <div id="all">
      <div id="summary" style="float:right">
        <!-- ปุ่มดู summary staff position -->
        <b-button id="show-btn" variant="success" @click="showModalstaff"
          >see summary</b-button
        >
        <!-- chart detail  -->
        <b-modal ref="my-modal-staff" hide-footer title="Summary" size="lg">
          <div class="chart-wrapper">
            <chart :options="chartOptionsBar" style="float:center"></chart>
          </div>
        </b-modal>
      </div>
      <div id="topSection">
        <h1>Staff information</h1><br><br>
        <b-container fluid>
          <!-- User Interface controls -->
        <b-row>
          <b-col lg="6" class="my-1">
            <b-form-group
              label="Filter"
              label-cols-sm="3"
              label-align-sm="right"
              label-size="sm"
              label-for="filterInput"
              class="mb-0"
            >
              <!-- input text for filter -->
              <b-input-group size="sm">
                <b-form-input
                  v-model="filter"
                  type="search"
                  id="filterInput"
                  placeholder="Type to Search"
                ></b-form-input>
                <!-- cleat text in filter box -->
                <b-input-group-append>
                  <b-button :disabled="!filter" @click="filter = ''"
                    >Clear</b-button
                  >
                </b-input-group-append>
              </b-input-group>
            </b-form-group>
          </b-col>

          <b-col lg="6" class="my-1">
            <b-form-group
              label="Filter On"
              label-cols-sm="3"
              label-align-sm="right"
              label-size="sm"
              description="Leave all unchecked to filter on all data"
              class="mb-0"
            >
              <!-- check box for filter  -->
              <b-form-checkbox-group v-model="filterOn" class="mt-1">
                  <b-form-checkbox value="Staff_ID">ID</b-form-checkbox>
                  <b-form-checkbox value="Staff_FirstName">First name</b-form-checkbox>
                  <b-form-checkbox value="Staff_LastName">Last name</b-form-checkbox>
                  <b-form-checkbox value="Position">Position</b-form-checkbox>
                  <b-form-checkbox value="Salary">Salary</b-form-checkbox>
              </b-form-checkbox-group>
            </b-form-group>
          </b-col>
          <!-- setting number of row's booking data in per page -->
          <b-col sm="5" md="6" class="my-1">
            <b-form-group
              label="Per page"
              label-cols-sm="6"
              label-cols-md="4"
              label-cols-lg="3"
              label-align-sm="right"
              label-size="sm"
              label-for="perPageSelect"
              class="mb-0"
            >
              <b-form-select
                v-model="perPage"
                id="perPageSelect"
                size="sm"
                :options="pageOptions"
              ></b-form-select>
            </b-form-group>
          </b-col>
        </b-row>
        </b-container>
      </div>
      
    </div>

    <div id="table" >
      <!-- <b-table
        show-empty
        stacked="md"
        :items="items"
        :fields="fields"
        :current-page="currentPage"
        :per-page="perPage"
        :filter="filter"
        :filterIncludedFields="filterOn"
        @filtered="onFiltered"
        :tbody-tr-class="rowClass"
        style="margin-top:110px"
      > -->
      <b-table
        show-empty
        stacked="md"
        :items="items"
        :fields="fields"
        :current-page="currentPage"
        :per-page="perPage"
        :filter="filter"
        :filterIncludedFields="filterOn"
        @filtered="onFiltered"
        
        style="margin-top:110px"
      >
        <template v-slot:table-colgroup="scope">
          <col
            v-for="field in scope.fields"
            :key="field.key"
          />
        </template>
        <template v-slot:cell(actions)="row">
          <b-button variant="light" size="sm" @click="row.toggleDetails">
            {{ row.detailsShowing ? "Hide" : "Show" }} more details
          </b-button>

          <b-button
            size="sm"
            @click="showModal(row.item)"
            class="mr-1"
            variant="danger"
          >
            Edit
          </b-button>
        </template>

        <template v-slot:row-details="row">
          <b-card>
            <pre style="font-size:large; margin:0px">
              <b>Date of Birth</b>: {{row.item.Date_Of_Birth}}        <b>Address</b>: {{row.item.Address}}        <b>Start date</b>: {{row.item.Start_Date}}        <b>End date</b>: {{row.item.End_Date}}   
              </pre>
          </b-card>
        </template>
      </b-table>

      <!-- Info edit modal ปล ถ้า  placeholder เป็นข้อมูลปัจจุบันก็ดีนะ ทุก edit-->
      <b-modal ref="editModal" title="Edit staff information" hide-footer>
        <div id="editST">
          <!-- {{infoModalContent}} -->
          <b-form-group label="Position:" label-for="ip-position">
            <b-form-input
              id="ip-position"
              v-model="formEdit.Position"
              placeholder="Enter new position"
            ></b-form-input>
          </b-form-group>
          <!-- {{infoModalContent.Salary}} -->
          <b-form-group label="Salary:" label-for="ip-salary">
            <b-form-input
              id="ip-salary"
              v-model="formEdit.Salary"
              placeholder="Enter new salary"
              required=""
            ></b-form-input>
          </b-form-group>
          <!-- {{infoModalContent.Start_Date}} -->
          <b-form-group label="Start date:" label-for="ip-sDate">
            <b-form-datepicker
              id="ip-sDate"
              v-model="formEdit.SDate"
              placeholder="-- select date --"
            ></b-form-datepicker>
          </b-form-group>
          <!-- {{infoModalContent.End_Date}} -->
          <b-form-group label="End date:" label-for="ip-eDate">
            <b-form-datepicker
              id="ip-eDate"
              v-model="formEdit.EDate"
              placeholder="-- select date --"
            ></b-form-datepicker>
          </b-form-group>

          <div style="float: right;">
            <b-button
              type="reset"
              variant="danger"
              style="margin-right:20px;"
              @click="onReset"
              >Reset</b-button
            >
            <b-button @click="onSubmit" variant="primary">Submit</b-button>
          </div>
        </div>
      </b-modal>

      <b-col class="my-1">
        <b-pagination
          v-model="currentPage"
          :total-rows="totalRows"
          :per-page="perPage"
          pills
          align="center"
          class="my-0"
        ></b-pagination>
        <br />
        <hr />
      </b-col>
    </div>
  </div>
</template>

<script>
import STnav from "../Nav_st.vue";
import Side from "./Side_statusH.vue";
export default {
  components: { STnav, Side },
  data() {
    return {
      chartOptionsBar: {
        xAxis: {
          data: ["IT", "housekeeper", "DBA", "dev"],
        },
        yAxis: {
          type: "value",
        },
        series: [
          {
            type: "bar",
            data: [63, 5, 45, 9],
          },
        ],
        title: {
          text: "Quarterly Sales Results",
          x: "center",
          textStyle: {
            fontSize: 24,
          },
        },
        color: ["#127ac2"],
      },
      // staff info
      items: [],
      fields: [
        { key: "Staff_ID", label: "Staff ID", sortable: true },
        { key: "Name_Title", label: "Title", sortable: true },
        { key: "Staff_FirstName", label: "First name", sortable: true },
        { key: "Staff_LastName", label: "Last name", sortable: true },
        { key: "Position", label: "Position", sortable: true },
        { key: "Salary", label: "Salary", sortable: true },
        { key: "Email", label: "Email", sortable: true },
        { key: "Tel_No", label: "TelNo", sortable: true },
        { key: "actions", label: "Actions" },
      ],
      fieldsMore: [
        { key: "Date_Of_Birth", label: "Date of Birth", sortable: true },
        { key: "Address", label: "Address", sortable: true },
        { key: "Start_Date", label: "Start date", sortable: true },
        { key: "End_Date", label: "End date", sortable: true },
      ],
      //totalRows: 1,
      currentPage: 1,
      perPage: 5,
      pageOptions: [5, 10, 15],
      filter: null,
      filterOn: [],
      //edit prmt
      formEdit: {
        staffid: null,
        Position: null,
        Salary: null,
        SDate: null,
        EDate: null,
      },
      show: true,
    };
  },
  computed: {
    totalRows() {
      return this.items.length;
    },
    sortOptions() {
      // Create an options list from our fields
      return this.fields
        .filter((f) => f.sortable)
        .map((f) => {
          return { text: f.label, value: f.key };
        });
    },
  },
  mounted() {
    // Set the initial number of items
    this.totalRows = this.items.length;
    this.fetchStaff();
    //this.MergeName();
  },
  methods: {
    // MergeName(){
    //   for(var i=0; i<this.items.length; i++){
    //     this.items.name=this.items[i].Name_Title + this.items[i].Staff_FirstName +this.items[i].Staff_LastName;
    //   }
    // },
    onFiltered(filteredItems) {
      // Trigger pagination to update the number of buttons/pages due to filtering
      this.totalRows = filteredItems.length;
      this.currentPage = 1;
    },
    showModal(item) {
      this.infoModalContent = item;
      // console.log(this.infoModalContent.Staff_ID);
      this.formEdit.staffid = this.infoModalContent.Staff_ID;
      this.formEdit.Position = this.infoModalContent.Position;
      this.formEdit.Salary = this.infoModalContent.Salary;
      this.formEdit.SDate = this.infoModalContent.Start_Date;
      this.formEdit.EDate = this.infoModalContent.End_Date;
      this.$refs["editModal"].show();
    },
    hideModal() {
      this.$refs["editModal"].hide();
    },
    onSubmit(evt) {
      evt.preventDefault();
      if (
        this.formEdit.Position === null &&
        this.formEdit.Salary === null &&
        this.formEdit.SDate === null &&
        this.formEdit.EDate === null
      ) {
        this.makeToast("danger", "Nothing updated");
      } else {
        this.updateStaff();
        this.makeToast("success", "Information has been updated.");
      }
      this.hideModal();
    },
    onReset(evt) {
      evt.preventDefault();
      // Reset our form values
      this.formEdit.Position = "";
      this.formEdit.Salary = "";
      this.formEdit.SDate = "";
      this.formEdit.EDate = "";
      this.show = false;
      this.$nextTick(() => {
        this.show = true;
      });
    },
    fetchStaff() {
      var formData = this.toFormData(this.items);
      this.axios
        .post(
          "http://hakuna-hotel.kmutt.me/phpapi/Staff.php?action=read",
          formData
        )
        .then((response) => {
          //set var to default
          this.items = response.data.data;
          // if (response.data.error) {
          //   console.log(response.data.error);
          // } else {
          //   console.log(response.data.message);
          // }
        });
    },
    updateStaff() {
      // console.log(this.formEdit.EDate);
      if (this.formEdit.EDate == null) {
        var formData1 = this.toFormData(this.formEdit);
        this.axios
          .post(
            "http://hakuna-hotel.kmutt.me/phpapi/editourteam.php?action=update",
            formData1
          )
          // .then((response) => {
          //   //set var to default
          //   console.log(response);
          //   this.formEdit = {
          //     staffid: null,
          //     Position: null,
          //     Salary: null,
          //     SDate: null,
          //     EDate: null,
          //   };
          //   if (response.data.error) {
          //     console.log(response.data.error);
          //   } else {
          //     console.log(response.data.message);
          //   }
          // })
          ;
          this.formEdit = {
              staffid: null,
              Position: null,
              Salary: null,
              SDate: null,
              EDate: null,
            };
      } else {
        var formData2 = this.toFormData(this.formEdit);
        this.axios
          .post(
            "http://hakuna-hotel.kmutt.me/phpapi/editourteam.php?action=updateED",
            formData2
          )
          // .then((response) => {
          //   //set var to default
          //   console.log(response);
          //   this.formEdit = {
          //     staffid: null,
          //     Position: null,
          //     Salary: null,
          //     SDate: null,
          //     EDate: null,
          //   };
          //   if (response.data.error) {
          //     console.log(response.data.error);
          //   } else {
          //     console.log(response.data.message);
          //   }
          // })
          // ;
          this.formEdit = {
              staffid: null,
              Position: null,
              Salary: null,
              SDate: null,
              EDate: null,
            };
      }
    },
    // convert to formdata
    toFormData(obj) {
      var fd = new FormData();
      for (var i in obj) {
        fd.append(i, obj[i]);
      }
      return fd;
    },
    makeToast(variant = null, text) {
      this.$bvToast.toast(text, {
        title: "Notice!",
        variant: variant,
        solid: true,
        toaster: "b-toaster-bottom-center",
      });
    },
    rowClass(item) {
      if (item._showDetails === true) return "table-secondary";
      else return;
    },
    showModalstaff() {
      this.$refs["my-modal-staff"].show();
    },
    hideModalstaff() {
      this.$refs["my-modal-staff"].hide();
    },
  },
};
</script>

<style scoped>
#card {
  max-width: 90rem;
  margin: 100px 100px 100px 300px;
  padding: 30px;
}
#all {
  margin: 100px 100px auto 300px;
}
.chart-wrapper {
  width: 100%;
  height: 500px;
}
</style>
