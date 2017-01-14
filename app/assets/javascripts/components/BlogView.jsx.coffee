@BlogView = React.createClass
  render: ->
    `<div className="blog">
       { this.renderStories() }
     </div>`

  renderStories: ->
    { stories } = @props

    stories.map (story) ->
      `<StoryBlock story={ story } />`

@StoryBlock = React.createClass
  getClassName: ->
    "story-block #{@props.story.css_class}"

  render: ->
    { story: { happenedAt, body } } = @props

    `<div className={ this.getClassName() }>
       <h1>{ happenedAt }</h1>
       <div className="body">{ body }</div>
     </div>`
