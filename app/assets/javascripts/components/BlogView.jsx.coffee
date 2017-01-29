@BlogView = React.createClass
  render: ->
    `<div className="blog">
      { this.renderStory() }
     </div>``

  renderStory: ->
    { stories } = @props
    `<StoryBlock story={ stories[this.indexOfActiveStory()] } />`

  indexOfActiveStory: ->
    @props.stories.findIndex (story) =>
      story.key == @props.activeStoryKey

@StoryBlock = React.createClass
  getClassName: ->
    "story-block #{@props.story.key}"

  render: ->
    { story: { id, happened_at, body } } = @props

    `<div id={ id } className={ this.getClassName() }>
       <span className='happened-at'>{ moment(happened_at).format('MMMM Do YYYY') }</span>
       <div className='body' dangerouslySetInnerHTML={ { __html: body } } />
     </div>`
