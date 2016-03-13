//= require react
//= require jquery

var Container = React.createClass({
  getInitialState: function () {
    return {
      // isLoggedIn: false,
      loggedInAs: '',
      isOpen: false,
      isDisplayedModal: false,
      isDisplayedLogOut: false
    };
  },
  componentDidMount: function () {
    $.post('/sessions', function (res) {
      console.log(res);
      if (res.name) {
        // this.setState({isLoggedIn: true});
        this.setState({
          // isLoggedIn: true,
          loggedInAs: res.name,
        });
      }
      else {
        this.setState({
          // isLoggedIn: false,
          loggedInAs: '',
        });
      }
    }.bind(this));
  },
  displayTextModal: function () {
    this.setState({isDisplayedModal: true});
  },
  displayLogOutBtn: function () {
    this.setState({isDisplayedLogOut: true});
  },
  hideLogOutBtn: function () {
    this.setState({isDisplayedLogOut: false});
  },
  logout: function () {
    $.ajax({
      url: '/sessions',
      type: 'DELETE',
      success: function () {
        this.setState({
          // isLoggedIn: false,
          loggedInAs: '',
        });
        window.location = 'http://localhost:3000/';
      }.bind(this),
      error: function (err) {
        console.log(err);
      }
    });
  },
  loggin: function (e) {
    // TODO AJAX call
    // Handled by the back-end
    // e.preventDefault();

  },
  render: function () {
    if (this.state.loggedInAs !== '') {
      var displaySpan = this.state.isDisplayedLogOut ? 'none' : 'inline';
      var displayLogOutBtn = this.state.isDisplayedLogOut ? 'inline-block' : 'none';
      return (
        <div>
          <span style={{display: displaySpan}} onMouseEnter={this.displayLogOutBtn}>Logged in as: {this.state.loggedInAs}</span>
          <button style={{display: displayLogOutBtn}} onMouseOut={this.hideLogOutBtn} onClick={this.logout} className='btn btn-danger'>Log Out</button>
          <button style={{marginLeft: '20px'}} onClick={this.displayTextModal} className='btn btn-primary'>Envoyer un message</button>
          <TextModal isOpen={this.state.isDisplayedModal} />
        </div>
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
      <form className='navbar-form navbar-right' style={{marginTop: "-50px !important"}} onSubmit={this.props.loggin}>
        <div className='form-group'>
          <input className='form-control input-black' placeholder='Email' type='text' />
        </div>
        <div className='form-group'>
          <input className='form-control input-black' placeholder='Password' type='text' />
          <button className='btn btn-success btn-grey' style={{backgroundColor: "#9c9c9c !important", color: "#000 !important", borderColor: "#9d9d9d !important"}} type='submit'>Sign in</button>
        </div>
      </form>
    );
  }
});
