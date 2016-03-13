//= require react
//= require jquery

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
  closeModal: function (event) {
    this.setState({isOpen: false});
  },
  handleSend: function (event) {
    event.preventDefault();
    if (this.state.isTooLong) {
      return false;
    }
    else {
      // TODO AJAX call
      // post
      $.post('/sms/', function (data) {
        console.log('sms sent.');
      });
      this.setState({isOpen: false});
    }
  },
  render: function () {
    var display = this.state.isOpen ? 'block' : 'none';
    var inlineStyle = {
      // position: 'fixed',
      top: '50px',
      bottom: '50px',
      left: '50px',
      right: '50px',
      display: display,
      maxWidth: '700px',

      // background: 'rgba(255, 255, 255, 0.7)',
      // padding: '25px',
      // zIndex: 1
    };
    return (
      <div id='text-modal' style={{display:display}} className='modal'>
        <div className='modal-dialog'>
          <div className='modal-content'>
            <div className='modal-header'>
              <h4 className="modal-title" id="myModalLabel">Send a text message</h4>
            </div>
            <form onSubmit={this.handleSend}>
              <div className='modal-body'>
                <textarea name='message' className='form-control' placeholder='Your message here...' onChange={this.displayCharsLeft}></textarea>
                <span className={this.state.isTooLong ? 'pull-right label label-warning' : 'pull-right label label-success'}>{this.state.charsLeft}</span>
              </div>
              <div className='modal-footer'>
                <button type="button" className="btn btn-default" onClick={this.closeModal}>Close</button>
                <button style={{opacity: this.state.isTooLong ? 0.5 : 1}} className='btn btn-primary' type='submit'>Send</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    );
  }
});
