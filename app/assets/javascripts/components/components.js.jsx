//= require react
//= require jquery

var Container = React.createClass({
  getInitialState: function () {
    $.post('/sessions', function (res) {
      console.log(res);
      if (res.status === 200) {
        // this.setState({isLoggedIn: true});
        return {
          isLoggedIn: true,
          isOpen: false
        };
      }
      else {
        return {
          isLoggedIn: false,
          isOpen: false
        };
      }
    }.bind(this));
  },
  displayTextModal: function () {
    this.setState({isDisplayedModal: true});
  },
  loggin: function (e) {
    // TODO AJAX call
    // Handled by the back-end
    // e.preventDefault();

  },
  render: function () {
    if (this.state.isLoggedIn) {
      return (
        <ul className='navbar-right'>
          <a onClick={this.displayTextModal}></a>
          <button onClick={this.displayTextModal} className='btn btn-primary navbar-btn'>Envoyer un message</button>
          <TextModal isOpen={this.state.isDisplayedModal} />
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
          <input className='form-control' placeholder='Password' type='text' />
          <button className='btn btn-success' type='submit'>Sign in</button>
        </div>
      </form>
    );
  }
});
