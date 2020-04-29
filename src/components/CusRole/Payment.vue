<template>
  <div>
    <NavLO />
    <br /><br /><br />
    Payment

    <div id="CARD">
      <b-card title="Available room" sub-title="Date: ">
        <div>
          <b-card-group columns>
            <b-card
              title="Card title that wraps to a new line"
              img-src="https://placekitten.com/g/400/450"
              img-alt="Image"
              img-top
            >
              <b-card-text>
                This is a wider card with supporting text below as a natural
                lead-in to additional content. This content is a little bit
                longer.
              </b-card-text>
            </b-card>

            <b-card header="Payment method">
              <blockquote class="blockquote mb-0">
                <p>
                  Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                  Integer posuere erat a ante.
                </p>
                <footer class="blockquote-footer">
                  Someone famous in
                  <cite title="Source Title">Source Title</cite>
                </footer>
              </blockquote>
            </b-card>

            <b-card
              title="Title"
              img-src="https://placekitten.com/500/350"
              img-alt="Image"
              img-top
            >
              <b-card-text>
                This card has supporting text below as a natural lead-in to
                additional content.
              </b-card-text>
              <b-card-text class="small text-muted"
                >Last updated 3 mins ago</b-card-text
              >
            </b-card>

            <b-card>
              <b-card-title>Title</b-card-title>
              <b-card-text>
                This card has supporting text below as a natural lead-in to
                additional content.
              </b-card-text>
              <b-card-text class="small text-muted"
                >Last updated 3 mins ago</b-card-text
              >
            </b-card>

            <b-card
              img-src="https://picsum.photos/400/400/?image=41"
              img-alt="Image"
              overlay
            ></b-card>

            <b-card
              img-src="https://picsum.photos/400/200/?image=41"
              img-alt="Image"
              img-top
            >
              <b-card-text>
                This is a wider card with supporting text below as a natural
                lead-in to additional content. This card has even longer content
                than the first.
              </b-card-text>
              <template v-slot:footer>
                <small class="text-muted">Footer Text</small>
              </template>
            </b-card>
          </b-card-group>
        </div>
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
};
</script>

<style>
#CARD {
  max-width: 75%;
  margin: auto;
}
</style>
