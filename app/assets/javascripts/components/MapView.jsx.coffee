@MapView = React.createClass
  getDefaultProps: ->
    defaultCenter: { lat: 33.8982912, lng: 45.1447584 }
    defaultZoom: 4

  className: 'map'

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
    { stories, onStoryClick } = @props

    stories.map (story, index) =>
      { latitude, longitude } = story

      `<StoryMarker
        key={ index }
        onClick={ onStoryClick }
        story={ story }
        lat={ latitude }
        lng={ longitude } />`

@StoryMarker = React.createClass
  getClassName: ->
    "story-marker #{@props.story.css_class}"

  onClick: ->
    { onClick, story } = @props
    onClick story.id

  render: ->
    `<span onClick={ this.onClick } className={ this.getClassName() } dangerouslySetInnerHTML={ { __html: this.props.story.sign_body } }/>`
