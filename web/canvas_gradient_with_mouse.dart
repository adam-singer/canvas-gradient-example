/**
 * Remy Sharp
 * Adam Singer
 * http://creativecommons.org/licenses/by-sa/2.0/uk/
 */ 
import 'dart:html';

void main() {
  var color = 255;
  var canvas = new CanvasElement(width: 600, height: 600);
  var ctx = canvas.context2d;
  ctx.clearRect(0, 0, 600, 600);
  ctx.save();
  // Create radial gradient
  var grad = ctx.createRadialGradient(0, 0, 0, 0, 0, 600); 
  grad.addColorStop(0, '#000');
  grad.addColorStop(1, 'rgb($color, $color, $color)');
  // assign gradients to fill
  ctx.fillStyle = grad;

  // draw 600x600 fill
  ctx.fillRect(0, 0, 600, 600);
  ctx.save();
  
  document.body.on.mouseMove.add((event) {
    var width = window.innerWidth, 
        height = window.innerHeight, 
        x = event.clientX, 
        y = event.clientY,
        rx = 600 * x / width,
        ry = 600 * y / height;
    
    var xc = (256 * x ~/ width);
    var yc = (256 * y ~/ height);

    grad = ctx.createRadialGradient(rx, ry, 0, rx, ry, 600); 
    grad.addColorStop(0, '#000');
    grad.addColorStop(1, 'rgb($xc, ${(255 - xc)}, $yc)');
    // ctx.restore();
    ctx.fillStyle = grad;
    ctx.fillRect(0, 0, 600, 600);
    // ctx.save();
  });
  document.body.elements.add(canvas);
}