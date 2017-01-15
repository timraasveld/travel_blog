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
      ReactDOM.findDOMNode(this).scrollIntoView()

  render: ->
    { story: { id, happenedAt, body } } = @props

    `<div id={ id } className={ this.getClassName() }>
       <h1>{ happenedAt }</h1>
       <div className="body" dangerouslySetInnerHTML={ { __html: body } } />
     </div>`
