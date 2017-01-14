@App = React.createClass
  render: ->
    console.log @props
    `<div className='app'>
      <MapView stories={ this.props.stories } />
      <BlogView stories={ this.props.stories } />
    </div>`
