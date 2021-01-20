export default class Bird{
    constructor(dimensions){
        this.dimensions = dimensions;
        this.velocity = 0;
        this.x = this.dimensions.width/3;
        this.y = this.dimensions.width / 2;
    }
    drawbird(ctx){
        ctx.fillStyle = "yellow";
        ctx.fillRect(this.x, this.y, 30, 40);
    }
    animate(ctx){
        this.move();
        this.drawbird(ctx);
    }
    move(){
        
    }
}