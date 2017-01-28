{ Link } = ReactRouter

@MapView = React.createClass
  getDefaultProps: ->
    defaultCenter: { lat: 23.5123858, lng: 69.6495247 }
    defaultZoom: 4

  render: ->
    { apiKey, defaultCenter, defaultZoom } = @props

    storyMarkers = @renderStoryMarkers()

    mapUrlOptions = if apiKey? then { key: apiKey } else {}

    `<div className='map'>
       <GoogleMapReact
        bootstrapURLKeys={ mapUrlOptions }
        defaultCenter={ defaultCenter }
        defaultZoom={ defaultZoom }
       >
         { storyMarkers }
       </GoogleMapReact>
     </div>`

  renderStoryMarkers: ->
    { stories } = @props

    stories.map (story, index) =>
      { latitude, longitude } = story

      `<StoryMarker
        key={ index }
        story={ story }
        lat={ latitude }
        lng={ longitude } />`

@StoryMarker = React.createClass
  getClassName: ->
    "story-marker #{@props.story.key}"

  render: ->
    { story: { sign_body, key } } = @props

    `<Link to={ '/' + key }>
       <span className={ this.getClassName() } dangerouslySetInnerHTML={ { __html: sign_body } } />
     </Link>`
