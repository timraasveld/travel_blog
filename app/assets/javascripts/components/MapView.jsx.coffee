@MapView = React.createClass
  getDefaultProps: ->
    defaultCenter: {lat: 41.2459002, lng: 46.8065313}
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
        lat={ story.latitude }
        lng={ story.longitude } />`

@StoryMarker = React.createClass
  render: ->
    `<span className='story-marker'>TAAART</span>`
