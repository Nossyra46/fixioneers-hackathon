//= require ./components/components.js
//= require_tree ./components
//= require react
//= require react_ujs
function run() {
  // React.render(<App />, document.getElementById('app'));
  ReactDOM.render(<Container />, document.getElementById('sendtext-modal'));
}

var loadedStates = ['complete', 'loaded', 'interactive'];

if (loadedStates.includes(document.readyState) && document.body) {
  run();
} else {
  window.addEventListener('DOMContentLoaded', run, false);
}
