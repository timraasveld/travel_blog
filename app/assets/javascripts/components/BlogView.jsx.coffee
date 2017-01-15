@BlogView = React.createClass
  render: ->
    `<div className="blog">
       <div className="content">
         { this.renderStories() }
       </div>
     </div>`

  renderStories: ->
    { stories, activeStoryId } = @props

    stories.map (story, index) ->
      `<StoryBlock active={ activeStoryId == story.id } key={ index } story={ story } />`

@StoryBlock = React.createClass
  getClassName: ->
    "story-block #{@props.story.css_class}"

  componentDidUpdate: (previousProps, previousState) ->
    if @props.active
      $(ReactDOM.findDOMNode(this)).scrollTo()

  render: ->
    { story: { id, happened_at, body } } = @props

    `<div id={ id } className={ this.getClassName() }>
       <span className='happened-at'>{ moment(happened_at).format('MMMM Do YYYY') }</span>
       <div className='body' dangerouslySetInnerHTML={ { __html: body } } />
     </div>`
