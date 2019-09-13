document.addEventListener("DOMContentLoaded", function(){
    let canvas = document.getElementById('mycanvas');
    canvas.width = 500;
    canvas.height = 500;

    let ctx = canvas.getContext('2d');
    ctx.fillRect(0, 0, 500, 500);
    ctx.beginPath();
    ctx.arc(100, 75, 50, 0, 2 * Math.PI);
    ctx.strokeStyle = "blue";
    ctx.lineWidth = 6;
    ctx.fillStyle = "pink";
    ctx.fill();
    ctx.stroke();

    ctx.beginPath();
    ctx.translate(25, 0);
    ctx.moveTo(50, 50);
    ctx.lineTo(0, 0);
    ctx.lineTo(50, 100);
    ctx.strokeStyle = "red";
    ctx.fillStyle = "red";
    ctx.fill();
});
