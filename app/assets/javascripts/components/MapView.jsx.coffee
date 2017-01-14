@MapView = React.createClass
  getDefaultProps: ->
    defaultCenter: { lat: 33.8982912, lng: 45.1447584 }
    defaultZoom: 4

  className: 'map'

  render: ->
    `<div className='map'>
       <GoogleMapReact
        defaultCenter={ this.props.defaultCenter }
        defaultZoom={ this.props.defaultZoom }
       >
         { this.renderStoryMarkers() }
       </GoogleMapReact>
     </div>`


  renderStoryMarkers: ->
    @props.stories.map (story, index) ->
      `<StoryMarker
        key={ index }
        story={ story }
        lat={ story.latitude }
        lng={ story.longitude } />`

@StoryMarker = React.createClass
  getClassName: ->
    "story-marker #{@props.story.map_css_class}"

  render: ->
    `<span className='story-marker'>{ this.props.story.sign_body }</span>`
