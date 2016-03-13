//= require react
// react is undefined.
var Container = React.createClass({
  getInitialState: function () {
    return {
      isLoggedIn: false,
      isOpen: false
    };
  },
  displayTextModal: function () {
    this.setState({isDisplayedModal: true});
  },
  loggin: function (e) {
    // TODO AJAX call
    e.preventDefault();
    this.setState({isLoggedIn: true});
  },
  render: function () {
    if (this.state.isLoggedIn) {
      return (
        <ul className='navbar-right'>
          <li>
            <a onClick={this.displayTextModal}></a>
            <button onClick={this.displayTextModal}>Envoyer un message</button>
            <TextModal isOpen={this.state.isDisplayedModal} />
          </li>
        </ul>
      );
    }
    else {
      return (
        // React binds component methods to components
        <LogginForm loggin={this.loggin}/>
      );
    }
  }
});

var LogginForm = React.createClass({
  render: function () {
    return (
      <form className='navbar-form navbar-right' onSubmit={this.props.loggin}>
        <div className='form-group'>
          <input className='form-control' placeholder='Email' type='text' />
        </div>
        <div className='form-group'>
          <input className='form-control' placeholder='Email' type='text' />
          <button className='btn btn-success' type='submit'>Sign in</button>
        </div>
      </form>
    );
  }
});

var TextModal = React.createClass({
  getInitialState: function () {
    return {
      charsLeft: 152,
      isTooLong: false,
      isOpen: this.props.isOpen
    };
  },
  componentWillReceiveProps: function () {
    this.setState({isOpen: this.props.isOpen});
  },
  displayCharsLeft: function (event) {
    var charsLeft = 152 - event.target.value.length;
    if (charsLeft < 0) {
      this.setState({
        charsLeft: charsLeft,
        isTooLong: true
      });
    } else {
      this.setState({
        charsLeft: charsLeft,
      });
    }
  },
  handleSend: function (event) {
    event.preventDefault();
    if (this.state.isTooLong) {
      return false;
    }
    else {
      // TODO AJAX call
      this.setState({isOpen: false});
    }
  },
  render: function () {
    var display = this.state.isOpen ? 'block' : 'none';
    var inlineStyle = {
      position: 'fixed',
      top: '50px',
      bottom: '50px',
      left: '50px',
      right: '50px',
      display: display,
      background: 'rgba(255, 255, 255, 0.7)',
      padding: '25px',
      zIndex: 1
    };
    return (
      <div id='text-modal' style={inlineStyle}>
        <form onSubmit={this.handleSend} className>
          <div className='row'>
            <div className='md-col-8 centered'>
              <textarea placeholder='Your message here...' onChange={this.displayCharsLeft}></textarea>
              <span className={this.state.isTooLong ? 'label label-warning' : 'label label-success'}>{this.state.charsLeft}</span>
            </div>
          </div>
          <button style={{opacity: this.state.isTooLong ? 0.5 : 1}} type='submit'>Send</button>
        </form>
      </div>
    );
  }
});

// ReactDOM.render(document.getElementById('sendtext-modal'), <Container />);
