class Building
  constructor:(context, color) ->
    @context = context
    @width = 100
    @height = 135
    @color = color

  draw:(x,y) ->
    @context.fillStyle = @color
    @height = @height + y
    @context.fillRect x, 640-@height, @width, @height
    @build_windows(x, y)

  build_windows:(x, y) ->
    times = Math.round (@height)/31
    windows = [ 10, 25, 40, 55, 70, 85 ]
    current_distance = 30
    total_height = 30
    @context.fillStyle = '#FFFF00'
    row = 1
    loop
      break if times < row
      @create_window x+z, 620+total_height-@height for z in windows
      total_height += current_distance
      row++

  create_window:(x, y) ->
    @context.fillRect x, y, 8, 16


class Painter
  constructor: ->
    @canvas = document.getElementById "gorillas"
    @context = @canvas.getContext "2d"
    @color = '#00FFFF'

  draw_building:(x, y) ->
    building = new Building(@context, @color)
    building.draw(x, y)

  set_color:(color) ->
    @color = color

window.onload = ->
  painter = new Painter
  painter.draw_building(40, 145)
  painter.draw_building(142, 105)

  painter.set_color '#800000'
  painter.draw_building(244, 165)
  painter.draw_building(346, 155)
  painter.draw_building(448, 95)

  painter.set_color '#C0C0C0'
  painter.draw_building(550, 15)

  painter.set_color '#800000'
  painter.draw_building(652, 215)

  painter.set_color '#C0C0C0'
  painter.draw_building(754, 55)

  painter.set_color '#800000'
  painter.draw_building(856, 45)
  painter.draw_building(958, 0)
