<style lang="scss">
#loading-overlay {
  position: fixed;
  width: 100%;
  height: 100%;
  top: 0;
  background-color: gray;
  opacity: 0.5;
  z-index: 9999;
  margin: 0 auto;
  .lds-spinner {
    color: initial;
    display: inline-block;
    position: relative;
    width: 80px;
    height: 80px;
    top: 30vh;
    div {
      transform-origin: 40px 40px;
      animation: lds-spinner 1.2s linear infinite;
      &:after {
        content: " ";
        display: block;
        position: absolute;
        top: 3px;
        left: 37px;
        width: 6px;
        height: 18px;
        border-radius: 20%;
        background: #fff;
      }
      @for $i from 0 through 11 {
        &:nth-child(#{$i + 1}) {
          transform: rotate(#{30 * $i}deg);
          animation-delay: #{-1.1 + $i/10}s;
        }
      }
    }
  }
  @keyframes lds-spinner {
    0% {
      opacity: 1;
    }
    100% {
      opacity: 0;
    }
  }
}
</style>
<template>
  <div id="loading-overlay" :style="{ display: show ? 'block' : 'none' }">
    <div class="lds-spinner">
      <div></div>
      <div></div>
      <div></div>
      <div></div>
      <div></div>
      <div></div>
      <div></div>
      <div></div>
      <div></div>
      <div></div>
      <div></div>
      <div></div>
    </div>
  </div>
</template>

<script>
export default {
  data: () => ({
    percent: 0,
    show: false,
    canSuccess: true,
    duration: 10000,
    height: "2px",
    color: "#77b6ff",
    failedColor: "red"
  }),
  methods: {
    start() {
      this.show = true;
      this.canSuccess = true;
      if (this._timer) {
        clearInterval(this._timer);
        this.percent = 0;
      }
      this._cut = 10000 / Math.floor(this.duration);
      this._timer = setInterval(() => {
        this.increase(this._cut * Math.random());
        if (this.percent > 95) {
          this.finish();
        }
      }, 100);
      return this;
    },
    set(num) {
      this.show = true;
      this.canSuccess = true;
      this.percent = Math.floor(num);
      return this;
    },
    get() {
      return Math.floor(this.percent);
    },
    increase(num) {
      this.percent = this.percent + Math.floor(num);
      return this;
    },
    decrease(num) {
      this.percent = this.percent - Math.floor(num);
      return this;
    },
    finish() {
      this.percent = 100;
      this.hide();
      return this;
    },
    pause() {
      clearInterval(this._timer);
      return this;
    },
    hide() {
      clearInterval(this._timer);
      this._timer = null;
      setTimeout(() => {
        this.show = false;
        this.$nextTick(() => {
          setTimeout(() => {
            this.percent = 0;
          }, 200);
        });
      }, 500);
      return this;
    },
    fail() {
      this.canSuccess = false;
      return this;
    }
  }
};
</script>
