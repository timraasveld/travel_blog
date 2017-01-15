@App = React.createClass
  getInitialState: -> @props

  activateStory: (storyId) ->
    @setState activeStoryId: storyId

  render: ->
    `<div className='app'>
      <MapView
       apiKey={ this.state.googleMapsApiKey }
       stories={ this.state.stories }
       onStoryClick={ this.activateStory } />
      <BlogView
       stories={ this.state.stories }
       activeStoryId={ this.state.activeStoryId } />
    </div>`
