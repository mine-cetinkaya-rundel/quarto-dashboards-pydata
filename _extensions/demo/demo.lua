return {
  ['demo'] = function(args) 
    quarto.doc.add_html_dependency({
      name = "demo",
      version = "1.0.0",
      stylesheets = {"demo.css"}
    })
    local notebook = pandoc.utils.stringify(args[1])
    local notebookImg = pandoc.Image("", "images/demo-" .. notebook .. ".png", "", pandoc.Attr("", { "demo-notebook"}))
    local outputImg = pandoc.Image("", "images/demo-" .. notebook .. "-output.png", "", pandoc.Attr("", { "demo-output", "fragment", "fade-in-then-out"}))
    local div = pandoc.Div({
      pandoc.Div(notebookImg, pandoc.Attr("", {"column"})),
      pandoc.Div(outputImg, pandoc.Attr("", {"column"}))
    }, pandoc.Attr("", {"columns"}))    
    if #args == 2 then
      local output2Img = pandoc.Image(
        "", 
        "images/demo-" .. notebook .. "-output-2.png", 
        "", 
        pandoc.Attr("", { "demo-output", "fragment"})
      )
      div.content[2].content:insert(output2Img)
    end
    return div
  end
}
