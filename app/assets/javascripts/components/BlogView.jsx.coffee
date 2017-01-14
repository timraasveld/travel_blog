@BlogView = React.createClass
  render: ->
    `<div className="blog">
       <div className="content">
         { this.renderStories() }
       </div>
     </div>`

  renderStories: ->
    { stories } = @props

    stories.map (story, index) ->
      `<StoryBlock key={ index } story={ story } />`

@StoryBlock = React.createClass
  getClassName: ->
    "story-block #{@props.story.css_class}"

  render: ->
    { story: { happenedAt, body } } = @props

    `<div className={ this.getClassName() }>
       <h1>{ happenedAt }</h1>
       <div className="body" dangerouslySetInnerHTML={ { __html: body } } />
     </div>`
