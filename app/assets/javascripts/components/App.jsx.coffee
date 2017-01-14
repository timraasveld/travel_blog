@App = React.createClass
  render: ->
    `<div className='app'>
      <MapView stories={ this.props.stories } />
      <BlogView stories={ this.props.stories } />
    </div>`
