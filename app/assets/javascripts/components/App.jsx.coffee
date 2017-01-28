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
    { google_maps_api_key, stories, activeStoryKey } = this.state

    components = []
    unless @storyChosen()
      components.push `<IntroductionView key='introduction' />`
    components.push `<MapView
                      key='map'
                      apiKey={ google_maps_api_key }
                      stories={ stories } />`
    if @storyChosen()
      components.push `<BlogView
                        key='blog'
                        stories={ stories }
                        activeStoryKey={ this.activeStoryKey() } />`

    `<div className={this.getClassName()}>
      { components }
    </div>`
