{ Router, Route, browserHistory } = ReactRouter

@EntryPoint = React.createClass
  render: ->
    `<Router history={ browserHistory }>
       <Route path='/(:storyKey)' component={ App } initialState={ this.props } />
     </Router>`
