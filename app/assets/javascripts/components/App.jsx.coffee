@App = React.createClass
  getInitialState: -> @props.route.initialState

  activeStoryKey: ->
    @props.routeParams.storyKey || @state.stories[0].key

  storyChosen: ->
    @props.routeParams.storyKey?

  getClassName: ->
    className = 'app '
    className += if @storyChosen() then 'story-layout' else 'introduction-layout'
    className

  render: ->
    `<div className={this.getClassName()}>
      { this.renderComponents() }
    </div>`

  renderComponents: ->
    { google_maps_api_key, stories, activeStoryKey } = @state

    [
      `<IntroductionView key='introduction' />` unless @storyChosen()
      `<MapView
         key='map'
         apiKey={ google_maps_api_key }
         stories={ stories } />`
      `<BlogView
        key='blog'
        stories={ stories }
        activeStoryKey={ this.activeStoryKey() } />` if @storyChosen()
    ]
