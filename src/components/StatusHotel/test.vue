<template>
    
  <div class="chart-wrapper">
    <chart :options="chartOptionsBar"></chart>
    <button @click="gogo()">click</button>
  </div>
</template>


<script>
export default {
  methods:{
    gogo(){
      this.$router.push('mhome')
    }
  },
  name: 'HelloWorld',
  data() {
      return{
          chartOptionsBar: {
            xAxis: {
                data: ['Q1', 'Q2', 'Q3', 'Q4']
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                type: 'bar',
                data: [63, 75, 24, 92]
                }
            ],
            title: {
                text: 'Quarterly Sales Results',
                x: 'center',
                textStyle: {
                fontSize: 24
                }
            },
            color: ['#127ac2']
        }

      }
    
  }
}
</script>


<style scoped>
.chart-wrapper {
  width: 100%;
  height: 700px;
}
</style>