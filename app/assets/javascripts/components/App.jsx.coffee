@App = React.createClass
  getInitialState: -> @props

  activateStory: (storyId) ->
    @setState activeStoryId: storyId

  render: ->
    { google_maps_api_key, stories, activeStoryId } = this.state

    `<div className='app'>
      <MapView
       bootstrapURLKeys={ { key: google_maps_api_key,
                            language: 'en' } }
       stories={ stories }
       onStoryClick={ this.activateStory } />
      <BlogView
       stories={ stories }
       activeStoryId={ activeStoryId } />
    </div>`
