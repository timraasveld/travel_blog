@App = React.createClass
  getInitialState: -> @props.route.initialState

  activeStoryKey: ->
    @props.routeParams.storyKey || @state.stories[0].key

  render: ->
    { google_maps_api_key, stories, activeStoryKey } = this.state

    `<div className='app'>
      <MapView
       apiKey={ google_maps_api_key }
       stories={ stories } />
      <BlogView
       stories={ stories }
       activeStoryKey={ this.activeStoryKey() } />
    </div>`
