---
title       : Lissajous Figures 
subtitle    : learn shiny building a playground for Lissajous Figures  
author      : skilchen
job         : struggling student in the coursera course Developing Data Products
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax, bootstrap]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---
<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>
### Goals

1. Use [something](http://en.wikipedia.org/wiki/Lissajous_curve) interesting to play with to learn shiny.
2. Let the user interactively select parameters to draw Lissajous figures.
3. Display the figures in a 3D WebGL canvas that allows the user to rotate and zoom the figure.
4. Let the user save parameters that produced nice looking figures.
5. Let the user display the figures, for which other people saved parameters by selecting a row from a data table.
6. Store the preferred parameters persistently across sessions and application restarts.


--- 

## Lissajous figures

Lissajous figures are graphs of overlayed waves defined by parametric equations of the following form  
$x = A\cdot\sin(a\cdot t + d)$, $y = B\cdot\sin(b\cdot t + e)$, $z = C\cdot\sin(c\cdot t * f)$  
where 
* A,B,C define the amplitude of the waves
* a,b,c define the frequency of the waves
* d,e,f define the relative phase shift of the waves
* t is the range of values for which the equations are evaluated

To simplify the matters, in my toy application some of the parameters have fixed values, namely: $A = B = c = 1$, $d = e = f = 0$ and t is defined as `seq(0, 2*pi, length.out = 3 * 360)`.  
The user can choose the values for a, b and c. Additionaly he can choose to draw the figures using lines or spheres. The figures can also be drawn using triangle waves of the form $x = A \cdot \arcsin(\sin(a \cdot t + d))$

---
### Example Lissajous Figure

```r
tt <- seq(0, 2*pi, length.out=360*3); x <- sin(2*tt); y <- sin(1*tt); z <- sin(3*tt)    
lines3d(x, y, z, col=rainbow(1000))
```

<canvas id="exampletextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** linestrip object 7 ****** -->
<script id="examplevshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="examplefshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function examplewebGLStart() {
var debug = function(msg) {
document.getElementById("exampledebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("examplecanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 375;  var height = 375;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("exampletextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** linestrip object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "examplevshader7" ));
gl.attachShader(prog7, getShader( gl, "examplefshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
0, 0, 0, 1, 0, 0, 1,
0.01164605, 0.005823123, 0.01746858, 1, 0.007843138, 0, 1,
0.02329052, 0.01164605, 0.03493183, 1, 0.01176471, 0, 1,
0.03493183, 0.01746858, 0.05238442, 1, 0.01960784, 0, 1,
0.0465684, 0.02329052, 0.06982102, 1, 0.02352941, 0, 1,
0.05819866, 0.02911167, 0.08723632, 1, 0.03137255, 0, 1,
0.06982102, 0.03493183, 0.104625, 1, 0.03529412, 0, 1,
0.08143391, 0.04075081, 0.1219817, 1, 0.04313726, 0, 1,
0.09303576, 0.0465684, 0.1393012, 1, 0.04705882, 0, 1,
0.104625, 0.05238442, 0.1565782, 1, 0.05490196, 0, 1,
0.1162, 0.05819866, 0.1738075, 1, 0.05882353, 0, 1,
0.1277593, 0.06401093, 0.1909837, 1, 0.06666667, 0, 1,
0.1393012, 0.06982102, 0.2081016, 1, 0.07058824, 0, 1,
0.1508243, 0.07562874, 0.2251559, 1, 0.07843138, 0, 1,
0.1623269, 0.08143391, 0.2421416, 1, 0.08235294, 0, 1,
0.1738075, 0.08723632, 0.2590534, 1, 0.09019608, 0, 1,
0.1852645, 0.09303576, 0.2758861, 1, 0.09411765, 0, 1,
0.1966964, 0.09883205, 0.2926347, 1, 0.1019608, 0, 1,
0.2081016, 0.104625, 0.3092939, 1, 0.1098039, 0, 1,
0.2194785, 0.1104144, 0.3258587, 1, 0.1137255, 0, 1,
0.2308257, 0.1162, 0.3423241, 1, 0.1215686, 0, 1,
0.2421416, 0.1219817, 0.358685, 1, 0.1254902, 0, 1,
0.2534247, 0.1277593, 0.3749365, 1, 0.1333333, 0, 1,
0.2646734, 0.1335325, 0.3910736, 1, 0.1372549, 0, 1,
0.2758861, 0.1393012, 0.4070913, 1, 0.145098, 0, 1,
0.2870615, 0.1450652, 0.4229847, 1, 0.1490196, 0, 1,
0.2981979, 0.1508243, 0.4387491, 1, 0.1568628, 0, 1,
0.3092939, 0.1565782, 0.4543796, 1, 0.1607843, 0, 1,
0.3203479, 0.1623269, 0.4698714, 1, 0.1686275, 0, 1,
0.3313585, 0.16807, 0.4852198, 1, 0.172549, 0, 1,
0.3423241, 0.1738075, 0.5004202, 1, 0.1803922, 0, 1,
0.3532433, 0.179539, 0.5154678, 1, 0.1843137, 0, 1,
0.3641146, 0.1852645, 0.5303581, 1, 0.1921569, 0, 1,
0.3749365, 0.1909837, 0.5450866, 1, 0.1960784, 0, 1,
0.3857076, 0.1966964, 0.5596488, 1, 0.2039216, 0, 1,
0.3964263, 0.2024024, 0.5740401, 1, 0.2117647, 0, 1,
0.4070913, 0.2081016, 0.5882562, 1, 0.2156863, 0, 1,
0.417701, 0.2137937, 0.6022929, 1, 0.2235294, 0, 1,
0.4282541, 0.2194785, 0.6161457, 1, 0.227451, 0, 1,
0.4387491, 0.2251559, 0.6298105, 1, 0.2352941, 0, 1,
0.4491846, 0.2308257, 0.6432831, 1, 0.2392157, 0, 1,
0.4595592, 0.2364877, 0.6565594, 1, 0.2470588, 0, 1,
0.4698714, 0.2421416, 0.6696353, 1, 0.2509804, 0, 1,
0.4801199, 0.2477873, 0.6825069, 1, 0.2588235, 0, 1,
0.4903033, 0.2534247, 0.6951702, 1, 0.2627451, 0, 1,
0.5004202, 0.2590534, 0.7076213, 1, 0.2705882, 0, 1,
0.5104692, 0.2646734, 0.7198565, 1, 0.2745098, 0, 1,
0.520449, 0.2702843, 0.731872, 1, 0.282353, 0, 1,
0.5303581, 0.2758861, 0.7436641, 1, 0.2862745, 0, 1,
0.5401954, 0.2814786, 0.7552294, 1, 0.2941177, 0, 1,
0.5499594, 0.2870615, 0.7665641, 1, 0.3019608, 0, 1,
0.5596488, 0.2926347, 0.7776648, 1, 0.3058824, 0, 1,
0.5692622, 0.2981979, 0.7885283, 1, 0.3137255, 0, 1,
0.5787985, 0.3037511, 0.7991511, 1, 0.3176471, 0, 1,
0.5882562, 0.3092939, 0.8095301, 1, 0.3254902, 0, 1,
0.5976342, 0.3148263, 0.819662, 1, 0.3294118, 0, 1,
0.6069311, 0.3203479, 0.8295438, 1, 0.3372549, 0, 1,
0.6161457, 0.3258587, 0.8391724, 1, 0.3411765, 0, 1,
0.6252767, 0.3313585, 0.8485449, 1, 0.3490196, 0, 1,
0.6343229, 0.336847, 0.8576584, 1, 0.3529412, 0, 1,
0.6432831, 0.3423241, 0.8665103, 1, 0.3607843, 0, 1,
0.6521561, 0.3477896, 0.8750976, 1, 0.3647059, 0, 1,
0.6609405, 0.3532433, 0.883418, 1, 0.372549, 0, 1,
0.6696353, 0.358685, 0.8914687, 1, 0.3764706, 0, 1,
0.6782393, 0.3641146, 0.8992474, 1, 0.3843137, 0, 1,
0.6867513, 0.3695318, 0.9067516, 1, 0.3882353, 0, 1,
0.6951702, 0.3749365, 0.9139792, 1, 0.3960784, 0, 1,
0.7034947, 0.3803285, 0.9209278, 1, 0.4039216, 0, 1,
0.7117239, 0.3857076, 0.9275953, 1, 0.4078431, 0, 1,
0.7198565, 0.3910736, 0.9339798, 1, 0.4156863, 0, 1,
0.7278914, 0.3964263, 0.9400793, 1, 0.4196078, 0, 1,
0.7358277, 0.4017656, 0.9458919, 1, 0.427451, 0, 1,
0.7436641, 0.4070913, 0.9514158, 1, 0.4313726, 0, 1,
0.7513997, 0.4124031, 0.9566493, 1, 0.4392157, 0, 1,
0.7590334, 0.417701, 0.9615909, 1, 0.4431373, 0, 1,
0.7665641, 0.4229847, 0.9662391, 1, 0.4509804, 0, 1,
0.7739908, 0.4282541, 0.9705924, 1, 0.454902, 0, 1,
0.7813125, 0.433509, 0.9746495, 1, 0.4627451, 0, 1,
0.7885283, 0.4387491, 0.9784091, 1, 0.4666667, 0, 1,
0.7956371, 0.4439744, 0.9818702, 1, 0.4745098, 0, 1,
0.8026381, 0.4491846, 0.9850317, 1, 0.4784314, 0, 1,
0.8095301, 0.4543796, 0.9878924, 1, 0.4862745, 0, 1,
0.8163124, 0.4595592, 0.9904518, 1, 0.4901961, 0, 1,
0.8229839, 0.4647232, 0.9927089, 1, 0.4980392, 0, 1,
0.8295438, 0.4698714, 0.994663, 1, 0.5058824, 0, 1,
0.8359911, 0.4750037, 0.9963136, 1, 0.509804, 0, 1,
0.8423252, 0.4801199, 0.9976601, 1, 0.5176471, 0, 1,
0.8485449, 0.4852198, 0.9987022, 1, 0.5215687, 0, 1,
0.8546495, 0.4903033, 0.9994395, 1, 0.5294118, 0, 1,
0.8606383, 0.4953701, 0.9998718, 1, 0.5333334, 0, 1,
0.8665103, 0.5004202, 0.9999989, 1, 0.5411765, 0, 1,
0.8722647, 0.5054533, 0.9998209, 1, 0.5450981, 0, 1,
0.8779009, 0.5104692, 0.9993378, 1, 0.5529412, 0, 1,
0.883418, 0.5154678, 0.9985497, 1, 0.5568628, 0, 1,
0.8888152, 0.520449, 0.9974568, 1, 0.5647059, 0, 1,
0.894092, 0.5254125, 0.9960596, 1, 0.5686275, 0, 1,
0.8992474, 0.5303581, 0.9943584, 1, 0.5764706, 0, 1,
0.9042808, 0.5352858, 0.9923537, 1, 0.5803922, 0, 1,
0.9091917, 0.5401954, 0.9900462, 1, 0.5882353, 0, 1,
0.9139792, 0.5450866, 0.9874366, 1, 0.5921569, 0, 1,
0.9186427, 0.5499594, 0.9845256, 1, 0.6, 0, 1,
0.9231816, 0.5548135, 0.9813141, 1, 0.6078432, 0, 1,
0.9275953, 0.5596488, 0.9778032, 1, 0.6117647, 0, 1,
0.9318832, 0.564465, 0.973994, 1, 0.6196079, 0, 1,
0.9360448, 0.5692622, 0.9698874, 1, 0.6235294, 0, 1,
0.9400793, 0.5740401, 0.9654849, 1, 0.6313726, 0, 1,
0.9439863, 0.5787985, 0.9607877, 1, 0.6352941, 0, 1,
0.9477653, 0.5835373, 0.9557973, 1, 0.6431373, 0, 1,
0.9514158, 0.5882562, 0.9505152, 1, 0.6470588, 0, 1,
0.9549372, 0.5929553, 0.9449431, 1, 0.654902, 0, 1,
0.958329, 0.5976342, 0.9390826, 1, 0.6588235, 0, 1,
0.9615909, 0.6022929, 0.9329355, 1, 0.6666667, 0, 1,
0.9647224, 0.6069311, 0.9265037, 1, 0.6705883, 0, 1,
0.967723, 0.6115488, 0.9197891, 1, 0.6784314, 0, 1,
0.9705924, 0.6161457, 0.9127939, 1, 0.682353, 0, 1,
0.9733301, 0.6207218, 0.9055201, 1, 0.6901961, 0, 1,
0.9759358, 0.6252767, 0.8979699, 1, 0.6941177, 0, 1,
0.9784091, 0.6298105, 0.8901457, 1, 0.7019608, 0, 1,
0.9807498, 0.6343229, 0.8820499, 1, 0.7098039, 0, 1,
0.9829574, 0.6388139, 0.8736849, 1, 0.7137255, 0, 1,
0.9850317, 0.6432831, 0.8650532, 1, 0.7215686, 0, 1,
0.9869723, 0.6477306, 0.8561576, 1, 0.7254902, 0, 1,
0.9887791, 0.6521561, 0.8470007, 1, 0.7333333, 0, 1,
0.9904518, 0.6565594, 0.8375853, 1, 0.7372549, 0, 1,
0.9919901, 0.6609405, 0.8279143, 1, 0.7450981, 0, 1,
0.993394, 0.6652992, 0.8179907, 1, 0.7490196, 0, 1,
0.994663, 0.6696353, 0.8078173, 1, 0.7568628, 0, 1,
0.9957972, 0.6739488, 0.7973976, 1, 0.7607843, 0, 1,
0.9967963, 0.6782393, 0.7867343, 1, 0.7686275, 0, 1,
0.9976601, 0.6825069, 0.7758311, 1, 0.772549, 0, 1,
0.9983887, 0.6867513, 0.7646911, 1, 0.7803922, 0, 1,
0.9989818, 0.6909724, 0.7533177, 1, 0.7843137, 0, 1,
0.9994395, 0.6951702, 0.7417144, 1, 0.7921569, 0, 1,
0.9997616, 0.6993443, 0.7298848, 1, 0.7960784, 0, 1,
0.9999481, 0.7034947, 0.7178324, 1, 0.8039216, 0, 1,
0.9999989, 0.7076213, 0.705561, 1, 0.8117647, 0, 1,
0.9999142, 0.7117239, 0.6930742, 1, 0.8156863, 0, 1,
0.9996938, 0.7158023, 0.680376, 1, 0.8235294, 0, 1,
0.9993378, 0.7198565, 0.6674701, 1, 0.827451, 0, 1,
0.9988462, 0.7238863, 0.6543605, 1, 0.8352941, 0, 1,
0.9982193, 0.7278914, 0.6410512, 1, 0.8392157, 0, 1,
0.9974568, 0.731872, 0.6275463, 1, 0.8470588, 0, 1,
0.9965591, 0.7358277, 0.6138499, 1, 0.8509804, 0, 1,
0.9955263, 0.7397584, 0.5999661, 1, 0.8588235, 0, 1,
0.9943584, 0.7436641, 0.5858992, 1, 0.8627451, 0, 1,
0.9930556, 0.7475446, 0.5716536, 1, 0.8705882, 0, 1,
0.9916182, 0.7513997, 0.5572335, 1, 0.8745098, 0, 1,
0.9900462, 0.7552294, 0.5426433, 1, 0.8823529, 0, 1,
0.98834, 0.7590334, 0.5278875, 1, 0.8862745, 0, 1,
0.9864997, 0.7628117, 0.5129707, 1, 0.8941177, 0, 1,
0.9845256, 0.7665641, 0.4978973, 1, 0.8980392, 0, 1,
0.9824179, 0.7702905, 0.4826719, 1, 0.9058824, 0, 1,
0.980177, 0.7739908, 0.4672993, 1, 0.9137255, 0, 1,
0.9778032, 0.7776648, 0.451784, 1, 0.9176471, 0, 1,
0.9752968, 0.7813125, 0.4361309, 1, 0.9254902, 0, 1,
0.972658, 0.7849337, 0.4203447, 1, 0.9294118, 0, 1,
0.9698874, 0.7885283, 0.4044302, 1, 0.9372549, 0, 1,
0.9669852, 0.7920961, 0.3883922, 1, 0.9411765, 0, 1,
0.9639518, 0.7956371, 0.3722357, 1, 0.9490196, 0, 1,
0.9607877, 0.7991511, 0.3559657, 1, 0.9529412, 0, 1,
0.9574932, 0.8026381, 0.339587, 1, 0.9607843, 0, 1,
0.954069, 0.8060977, 0.3231047, 1, 0.9647059, 0, 1,
0.9505152, 0.8095301, 0.3065238, 1, 0.972549, 0, 1,
0.9468326, 0.812935, 0.2898493, 1, 0.9764706, 0, 1,
0.9430215, 0.8163124, 0.2730864, 1, 0.9843137, 0, 1,
0.9390826, 0.819662, 0.2562401, 1, 0.9882353, 0, 1,
0.9350162, 0.8229839, 0.2393157, 1, 0.9960784, 0, 1,
0.9308231, 0.8262779, 0.2223182, 0.9960784, 1, 0, 1,
0.9265037, 0.8295438, 0.2052528, 0.9921569, 1, 0, 1,
0.9220586, 0.8327816, 0.1881249, 0.9843137, 1, 0, 1,
0.9174885, 0.8359911, 0.1709395, 0.9803922, 1, 0, 1,
0.9127939, 0.8391724, 0.1537019, 0.972549, 1, 0, 1,
0.9079755, 0.8423252, 0.1364175, 0.9686275, 1, 0, 1,
0.903034, 0.8454493, 0.1190914, 0.9607843, 1, 0, 1,
0.8979699, 0.8485449, 0.1017289, 0.9568627, 1, 0, 1,
0.8927841, 0.8516116, 0.08433547, 0.9490196, 1, 0, 1,
0.8874772, 0.8546495, 0.06691626, 0.945098, 1, 0, 1,
0.8820499, 0.8576584, 0.04947662, 0.9372549, 1, 0, 1,
0.876503, 0.8606383, 0.03202188, 0.9333333, 1, 0, 1,
0.8708372, 0.8635889, 0.01455738, 0.9254902, 1, 0, 1,
0.8650532, 0.8665103, -0.002911574, 0.9215686, 1, 0, 1,
0.859152, 0.8694022, -0.02037963, 0.9137255, 1, 0, 1,
0.8531342, 0.8722647, -0.03784148, 0.9098039, 1, 0, 1,
0.8470007, 0.8750976, -0.05529177, 0.9019608, 1, 0, 1,
0.8407523, 0.8779009, -0.07272519, 0.8941177, 1, 0, 1,
0.8343899, 0.8806744, -0.09013642, 0.8901961, 1, 0, 1,
0.8279143, 0.883418, -0.1075201, 0.8823529, 1, 0, 1,
0.8213264, 0.8861316, -0.124871, 0.8784314, 1, 0, 1,
0.8146271, 0.8888152, -0.1421838, 0.8705882, 1, 0, 1,
0.8078173, 0.8914687, -0.1594532, 0.8666667, 1, 0, 1,
0.800898, 0.894092, -0.176674, 0.8588235, 1, 0, 1,
0.79387, 0.8966849, -0.1938408, 0.854902, 1, 0, 1,
0.7867343, 0.8992474, -0.2109485, 0.8470588, 1, 0, 1,
0.779492, 0.9017794, -0.2279918, 0.8431373, 1, 0, 1,
0.7721439, 0.9042808, -0.2449655, 0.8352941, 1, 0, 1,
0.7646911, 0.9067516, -0.2618645, 0.8313726, 1, 0, 1,
0.7571346, 0.9091917, -0.2786835, 0.8235294, 1, 0, 1,
0.7494753, 0.9116009, -0.2954175, 0.8196079, 1, 0, 1,
0.7417144, 0.9139792, -0.3120614, 0.8117647, 1, 0, 1,
0.7338529, 0.9163265, -0.32861, 0.8078431, 1, 0, 1,
0.7258919, 0.9186427, -0.3450583, 0.8, 1, 0, 1,
0.7178324, 0.9209278, -0.3614014, 0.7921569, 1, 0, 1,
0.7096756, 0.9231816, -0.3776341, 0.7882353, 1, 0, 1,
0.7014225, 0.9254042, -0.3937516, 0.7803922, 1, 0, 1,
0.6930742, 0.9275953, -0.4097489, 0.7764706, 1, 0, 1,
0.684632, 0.929755, -0.4256212, 0.7686275, 1, 0, 1,
0.6760969, 0.9318832, -0.4413636, 0.7647059, 1, 0, 1,
0.6674701, 0.9339798, -0.4569713, 0.7568628, 1, 0, 1,
0.6587527, 0.9360448, -0.4724396, 0.7529412, 1, 0, 1,
0.649946, 0.9380779, -0.4877636, 0.7450981, 1, 0, 1,
0.6410512, 0.9400793, -0.5029389, 0.7411765, 1, 0, 1,
0.6320694, 0.9420488, -0.5179606, 0.7333333, 1, 0, 1,
0.6230019, 0.9439863, -0.5328243, 0.7294118, 1, 0, 1,
0.6138499, 0.9458919, -0.5475253, 0.7215686, 1, 0, 1,
0.6046146, 0.9477653, -0.5620593, 0.7176471, 1, 0, 1,
0.5952973, 0.9496067, -0.5764217, 0.7098039, 1, 0, 1,
0.5858992, 0.9514158, -0.5906083, 0.7058824, 1, 0, 1,
0.5764217, 0.9531927, -0.6046146, 0.6980392, 1, 0, 1,
0.566866, 0.9549372, -0.6184363, 0.6901961, 1, 0, 1,
0.5572335, 0.9566493, -0.6320694, 0.6862745, 1, 0, 1,
0.5475253, 0.958329, -0.6455096, 0.6784314, 1, 0, 1,
0.5377429, 0.9599763, -0.6587527, 0.6745098, 1, 0, 1,
0.5278875, 0.9615909, -0.6717949, 0.6666667, 1, 0, 1,
0.5179606, 0.963173, -0.684632, 0.6627451, 1, 0, 1,
0.5079634, 0.9647224, -0.6972602, 0.654902, 1, 0, 1,
0.4978973, 0.9662391, -0.7096756, 0.6509804, 1, 0, 1,
0.4877636, 0.967723, -0.7218744, 0.6431373, 1, 0, 1,
0.4775639, 0.9691741, -0.7338529, 0.6392157, 1, 0, 1,
0.4672993, 0.9705924, -0.7456075, 0.6313726, 1, 0, 1,
0.4569713, 0.9719777, -0.7571346, 0.627451, 1, 0, 1,
0.4465814, 0.9733301, -0.7684305, 0.6196079, 1, 0, 1,
0.4361309, 0.9746495, -0.779492, 0.6156863, 1, 0, 1,
0.4256212, 0.9759358, -0.7903156, 0.6078432, 1, 0, 1,
0.4150538, 0.9771891, -0.800898, 0.6039216, 1, 0, 1,
0.4044302, 0.9784091, -0.811236, 0.5960785, 1, 0, 1,
0.3937516, 0.9795961, -0.8213264, 0.5882353, 1, 0, 1,
0.3830197, 0.9807498, -0.8311662, 0.5843138, 1, 0, 1,
0.3722357, 0.9818702, -0.8407523, 0.5764706, 1, 0, 1,
0.3614014, 0.9829574, -0.8500819, 0.572549, 1, 0, 1,
0.350518, 0.9840112, -0.859152, 0.5647059, 1, 0, 1,
0.339587, 0.9850317, -0.8679599, 0.5607843, 1, 0, 1,
0.32861, 0.9860187, -0.876503, 0.5529412, 1, 0, 1,
0.3175884, 0.9869723, -0.8847786, 0.5490196, 1, 0, 1,
0.3065238, 0.9878924, -0.8927841, 0.5411765, 1, 0, 1,
0.2954175, 0.9887791, -0.9005172, 0.5372549, 1, 0, 1,
0.2842712, 0.9896322, -0.9079755, 0.5294118, 1, 0, 1,
0.2730864, 0.9904518, -0.9151567, 0.5254902, 1, 0, 1,
0.2618645, 0.9912378, -0.9220586, 0.5176471, 1, 0, 1,
0.2506071, 0.9919901, -0.9286791, 0.5137255, 1, 0, 1,
0.2393157, 0.9927089, -0.9350162, 0.5058824, 1, 0, 1,
0.2279918, 0.993394, -0.941068, 0.5019608, 1, 0, 1,
0.216637, 0.9940453, -0.9468326, 0.4941176, 1, 0, 1,
0.2052528, 0.994663, -0.9523082, 0.4862745, 1, 0, 1,
0.1938408, 0.9952469, -0.9574932, 0.4823529, 1, 0, 1,
0.1824025, 0.9957972, -0.9623861, 0.4745098, 1, 0, 1,
0.1709395, 0.9963136, -0.9669852, 0.4705882, 1, 0, 1,
0.1594532, 0.9967963, -0.9712892, 0.4627451, 1, 0, 1,
0.1479454, 0.9972451, -0.9752968, 0.4588235, 1, 0, 1,
0.1364175, 0.9976601, -0.9790068, 0.4509804, 1, 0, 1,
0.124871, 0.9980413, -0.9824179, 0.4470588, 1, 0, 1,
0.1133077, 0.9983887, -0.9855294, 0.4392157, 1, 0, 1,
0.1017289, 0.9987022, -0.98834, 0.4352941, 1, 0, 1,
0.09013642, 0.9989818, -0.990849, 0.427451, 1, 0, 1,
0.07853166, 0.9992276, -0.9930556, 0.4235294, 1, 0, 1,
0.06691626, 0.9994395, -0.9949592, 0.4156863, 1, 0, 1,
0.05529177, 0.9996175, -0.9965591, 0.4117647, 1, 0, 1,
0.04365979, 0.9997616, -0.9978549, 0.4039216, 1, 0, 1,
0.03202188, 0.9998718, -0.9988462, 0.3960784, 1, 0, 1,
0.02037963, 0.9999481, -0.9995327, 0.3921569, 1, 0, 1,
0.008734623, 0.9999905, -0.9999142, 0.3843137, 1, 0, 1,
-0.002911574, 0.9999989, -0.9999905, 0.3803922, 1, 0, 1,
-0.01455738, 0.9999735, -0.9997616, 0.372549, 1, 0, 1,
-0.0262012, 0.9999142, -0.9992276, 0.3686275, 1, 0, 1,
-0.03784148, 0.9998209, -0.9983887, 0.3607843, 1, 0, 1,
-0.04947662, 0.9996938, -0.9972451, 0.3568628, 1, 0, 1,
-0.06110505, 0.9995327, -0.9957972, 0.3490196, 1, 0, 1,
-0.07272519, 0.9993378, -0.9940453, 0.345098, 1, 0, 1,
-0.08433547, 0.999109, -0.9919901, 0.3372549, 1, 0, 1,
-0.09593431, 0.9988462, -0.9896322, 0.3333333, 1, 0, 1,
-0.1075201, 0.9985497, -0.9869723, 0.3254902, 1, 0, 1,
-0.1190914, 0.9982193, -0.9840112, 0.3215686, 1, 0, 1,
-0.1306465, 0.9978549, -0.9807498, 0.3137255, 1, 0, 1,
-0.1421838, 0.9974568, -0.9771891, 0.3098039, 1, 0, 1,
-0.1537019, 0.9970249, -0.9733301, 0.3019608, 1, 0, 1,
-0.1651992, 0.9965591, -0.9691741, 0.2941177, 1, 0, 1,
-0.176674, 0.9960596, -0.9647224, 0.2901961, 1, 0, 1,
-0.1881249, 0.9955263, -0.9599763, 0.282353, 1, 0, 1,
-0.1995502, 0.9949592, -0.9549372, 0.2784314, 1, 0, 1,
-0.2109485, 0.9943584, -0.9496067, 0.2705882, 1, 0, 1,
-0.2223182, 0.9937239, -0.9439863, 0.2666667, 1, 0, 1,
-0.2336577, 0.9930556, -0.9380779, 0.2588235, 1, 0, 1,
-0.2449655, 0.9923537, -0.9318832, 0.254902, 1, 0, 1,
-0.2562401, 0.9916182, -0.9254042, 0.2470588, 1, 0, 1,
-0.26748, 0.990849, -0.9186427, 0.2431373, 1, 0, 1,
-0.2786835, 0.9900462, -0.9116009, 0.2352941, 1, 0, 1,
-0.2898493, 0.9892099, -0.9042808, 0.2313726, 1, 0, 1,
-0.3009758, 0.98834, -0.8966849, 0.2235294, 1, 0, 1,
-0.3120614, 0.9874366, -0.8888152, 0.2196078, 1, 0, 1,
-0.3231047, 0.9864997, -0.8806744, 0.2117647, 1, 0, 1,
-0.3341042, 0.9855294, -0.8722647, 0.2078431, 1, 0, 1,
-0.3450583, 0.9845256, -0.8635889, 0.2, 1, 0, 1,
-0.3559657, 0.9834884, -0.8546495, 0.1921569, 1, 0, 1,
-0.3668248, 0.9824179, -0.8454493, 0.1882353, 1, 0, 1,
-0.3776341, 0.9813141, -0.8359911, 0.1803922, 1, 0, 1,
-0.3883922, 0.980177, -0.8262779, 0.1764706, 1, 0, 1,
-0.3990976, 0.9790068, -0.8163124, 0.1686275, 1, 0, 1,
-0.4097489, 0.9778032, -0.8060977, 0.1647059, 1, 0, 1,
-0.4203447, 0.9765666, -0.7956371, 0.1568628, 1, 0, 1,
-0.4308833, 0.9752968, -0.7849337, 0.1529412, 1, 0, 1,
-0.4413636, 0.973994, -0.7739908, 0.145098, 1, 0, 1,
-0.451784, 0.972658, -0.7628117, 0.1411765, 1, 0, 1,
-0.4621431, 0.9712892, -0.7513997, 0.1333333, 1, 0, 1,
-0.4724396, 0.9698874, -0.7397584, 0.1294118, 1, 0, 1,
-0.4826719, 0.9684527, -0.7278914, 0.1215686, 1, 0, 1,
-0.4928388, 0.9669852, -0.7158023, 0.1176471, 1, 0, 1,
-0.5029389, 0.9654849, -0.7034947, 0.1098039, 1, 0, 1,
-0.5129707, 0.9639518, -0.6909724, 0.1058824, 1, 0, 1,
-0.5229329, 0.9623861, -0.6782393, 0.09803922, 1, 0, 1,
-0.5328243, 0.9607877, -0.6652992, 0.09019608, 1, 0, 1,
-0.5426433, 0.9591567, -0.6521561, 0.08627451, 1, 0, 1,
-0.5523888, 0.9574932, -0.6388139, 0.07843138, 1, 0, 1,
-0.5620593, 0.9557973, -0.6252767, 0.07450981, 1, 0, 1,
-0.5716536, 0.954069, -0.6115488, 0.06666667, 1, 0, 1,
-0.5811703, 0.9523082, -0.5976342, 0.0627451, 1, 0, 1,
-0.5906083, 0.9505152, -0.5835373, 0.05490196, 1, 0, 1,
-0.5999661, 0.94869, -0.5692622, 0.05098039, 1, 0, 1,
-0.6092426, 0.9468326, -0.5548135, 0.04313726, 1, 0, 1,
-0.6184363, 0.9449431, -0.5401954, 0.03921569, 1, 0, 1,
-0.6275463, 0.9430215, -0.5254125, 0.03137255, 1, 0, 1,
-0.6365711, 0.941068, -0.5104692, 0.02745098, 1, 0, 1,
-0.6455096, 0.9390826, -0.4953701, 0.01960784, 1, 0, 1,
-0.6543605, 0.9370653, -0.4801199, 0.01568628, 1, 0, 1,
-0.6631227, 0.9350162, -0.4647232, 0.007843138, 1, 0, 1,
-0.6717949, 0.9329355, -0.4491846, 0.003921569, 1, 0, 1,
-0.680376, 0.9308231, -0.433509, 0, 1, 0.003921569, 1,
-0.6888648, 0.9286791, -0.417701, 0, 1, 0.01176471, 1,
-0.6972602, 0.9265037, -0.4017656, 0, 1, 0.01568628, 1,
-0.705561, 0.9242968, -0.3857076, 0, 1, 0.02352941, 1,
-0.7137661, 0.9220586, -0.3695318, 0, 1, 0.02745098, 1,
-0.7218744, 0.9197891, -0.3532433, 0, 1, 0.03529412, 1,
-0.7298848, 0.9174885, -0.336847, 0, 1, 0.03921569, 1,
-0.7377962, 0.9151567, -0.3203479, 0, 1, 0.04705882, 1,
-0.7456075, 0.9127939, -0.3037511, 0, 1, 0.05098039, 1,
-0.7533177, 0.9104002, -0.2870615, 0, 1, 0.05882353, 1,
-0.7609257, 0.9079755, -0.2702843, 0, 1, 0.0627451, 1,
-0.7684305, 0.9055201, -0.2534247, 0, 1, 0.07058824, 1,
-0.7758311, 0.903034, -0.2364877, 0, 1, 0.07450981, 1,
-0.7831265, 0.9005172, -0.2194785, 0, 1, 0.08235294, 1,
-0.7903156, 0.8979699, -0.2024024, 0, 1, 0.08627451, 1,
-0.7973976, 0.8953922, -0.1852645, 0, 1, 0.09411765, 1,
-0.8043713, 0.8927841, -0.16807, 0, 1, 0.1019608, 1,
-0.811236, 0.8901457, -0.1508243, 0, 1, 0.1058824, 1,
-0.8179907, 0.8874772, -0.1335325, 0, 1, 0.1137255, 1,
-0.8246343, 0.8847786, -0.1162, 0, 1, 0.1176471, 1,
-0.8311662, 0.8820499, -0.09883205, 0, 1, 0.1254902, 1,
-0.8375853, 0.8792914, -0.08143391, 0, 1, 0.1294118, 1,
-0.8438908, 0.876503, -0.06401093, 0, 1, 0.1372549, 1,
-0.8500819, 0.8736849, -0.0465684, 0, 1, 0.1411765, 1,
-0.8561576, 0.8708372, -0.02911167, 0, 1, 0.1490196, 1,
-0.8621172, 0.8679599, -0.01164605, 0, 1, 0.1529412, 1,
-0.8679599, 0.8650532, 0.005823123, 0, 1, 0.1607843, 1,
-0.8736849, 0.8621172, 0.02329052, 0, 1, 0.1647059, 1,
-0.8792914, 0.859152, 0.04075081, 0, 1, 0.172549, 1,
-0.8847786, 0.8561576, 0.05819866, 0, 1, 0.1764706, 1,
-0.8901457, 0.8531342, 0.07562874, 0, 1, 0.1843137, 1,
-0.8953922, 0.8500819, 0.09303576, 0, 1, 0.1882353, 1,
-0.9005172, 0.8470007, 0.1104144, 0, 1, 0.1960784, 1,
-0.9055201, 0.8438908, 0.1277593, 0, 1, 0.2039216, 1,
-0.9104002, 0.8407523, 0.1450652, 0, 1, 0.2078431, 1,
-0.9151567, 0.8375853, 0.1623269, 0, 1, 0.2156863, 1,
-0.9197891, 0.8343899, 0.179539, 0, 1, 0.2196078, 1,
-0.9242968, 0.8311662, 0.1966964, 0, 1, 0.227451, 1,
-0.9286791, 0.8279143, 0.2137937, 0, 1, 0.2313726, 1,
-0.9329355, 0.8246343, 0.2308257, 0, 1, 0.2392157, 1,
-0.9370653, 0.8213264, 0.2477873, 0, 1, 0.2431373, 1,
-0.941068, 0.8179907, 0.2646734, 0, 1, 0.2509804, 1,
-0.9449431, 0.8146271, 0.2814786, 0, 1, 0.254902, 1,
-0.94869, 0.811236, 0.2981979, 0, 1, 0.2627451, 1,
-0.9523082, 0.8078173, 0.3148263, 0, 1, 0.2666667, 1,
-0.9557973, 0.8043713, 0.3313585, 0, 1, 0.2745098, 1,
-0.9591567, 0.800898, 0.3477896, 0, 1, 0.2784314, 1,
-0.9623861, 0.7973976, 0.3641146, 0, 1, 0.2862745, 1,
-0.9654849, 0.79387, 0.3803285, 0, 1, 0.2901961, 1,
-0.9684527, 0.7903156, 0.3964263, 0, 1, 0.2980392, 1,
-0.9712892, 0.7867343, 0.4124031, 0, 1, 0.3058824, 1,
-0.973994, 0.7831265, 0.4282541, 0, 1, 0.3098039, 1,
-0.9765666, 0.779492, 0.4439744, 0, 1, 0.3176471, 1,
-0.9790068, 0.7758311, 0.4595592, 0, 1, 0.3215686, 1,
-0.9813141, 0.7721439, 0.4750037, 0, 1, 0.3294118, 1,
-0.9834884, 0.7684305, 0.4903033, 0, 1, 0.3333333, 1,
-0.9855294, 0.7646911, 0.5054533, 0, 1, 0.3411765, 1,
-0.9874366, 0.7609257, 0.520449, 0, 1, 0.345098, 1,
-0.9892099, 0.7571346, 0.5352858, 0, 1, 0.3529412, 1,
-0.990849, 0.7533177, 0.5499594, 0, 1, 0.3568628, 1,
-0.9923537, 0.7494753, 0.564465, 0, 1, 0.3647059, 1,
-0.9937239, 0.7456075, 0.5787985, 0, 1, 0.3686275, 1,
-0.9949592, 0.7417144, 0.5929553, 0, 1, 0.3764706, 1,
-0.9960596, 0.7377962, 0.6069311, 0, 1, 0.3803922, 1,
-0.9970249, 0.7338529, 0.6207218, 0, 1, 0.3882353, 1,
-0.9978549, 0.7298848, 0.6343229, 0, 1, 0.3921569, 1,
-0.9985497, 0.7258919, 0.6477306, 0, 1, 0.4, 1,
-0.999109, 0.7218744, 0.6609405, 0, 1, 0.4078431, 1,
-0.9995327, 0.7178324, 0.6739488, 0, 1, 0.4117647, 1,
-0.9998209, 0.7137661, 0.6867513, 0, 1, 0.4196078, 1,
-0.9999735, 0.7096756, 0.6993443, 0, 1, 0.4235294, 1,
-0.9999905, 0.705561, 0.7117239, 0, 1, 0.4313726, 1,
-0.9998718, 0.7014225, 0.7238863, 0, 1, 0.4352941, 1,
-0.9996175, 0.6972602, 0.7358277, 0, 1, 0.4431373, 1,
-0.9992276, 0.6930742, 0.7475446, 0, 1, 0.4470588, 1,
-0.9987022, 0.6888648, 0.7590334, 0, 1, 0.454902, 1,
-0.9980413, 0.684632, 0.7702905, 0, 1, 0.4588235, 1,
-0.9972451, 0.680376, 0.7813125, 0, 1, 0.4666667, 1,
-0.9963136, 0.6760969, 0.7920961, 0, 1, 0.4705882, 1,
-0.9952469, 0.6717949, 0.8026381, 0, 1, 0.4784314, 1,
-0.9940453, 0.6674701, 0.812935, 0, 1, 0.4823529, 1,
-0.9927089, 0.6631227, 0.8229839, 0, 1, 0.4901961, 1,
-0.9912378, 0.6587527, 0.8327816, 0, 1, 0.4941176, 1,
-0.9896322, 0.6543605, 0.8423252, 0, 1, 0.5019608, 1,
-0.9878924, 0.649946, 0.8516116, 0, 1, 0.509804, 1,
-0.9860187, 0.6455096, 0.8606383, 0, 1, 0.5137255, 1,
-0.9840112, 0.6410512, 0.8694022, 0, 1, 0.5215687, 1,
-0.9818702, 0.6365711, 0.8779009, 0, 1, 0.5254902, 1,
-0.9795961, 0.6320694, 0.8861316, 0, 1, 0.5333334, 1,
-0.9771891, 0.6275463, 0.894092, 0, 1, 0.5372549, 1,
-0.9746495, 0.6230019, 0.9017794, 0, 1, 0.5450981, 1,
-0.9719777, 0.6184363, 0.9091917, 0, 1, 0.5490196, 1,
-0.9691741, 0.6138499, 0.9163265, 0, 1, 0.5568628, 1,
-0.9662391, 0.6092426, 0.9231816, 0, 1, 0.5607843, 1,
-0.963173, 0.6046146, 0.929755, 0, 1, 0.5686275, 1,
-0.9599763, 0.5999661, 0.9360448, 0, 1, 0.572549, 1,
-0.9566493, 0.5952973, 0.9420488, 0, 1, 0.5803922, 1,
-0.9531927, 0.5906083, 0.9477653, 0, 1, 0.5843138, 1,
-0.9496067, 0.5858992, 0.9531927, 0, 1, 0.5921569, 1,
-0.9458919, 0.5811703, 0.958329, 0, 1, 0.5960785, 1,
-0.9420488, 0.5764217, 0.963173, 0, 1, 0.6039216, 1,
-0.9380779, 0.5716536, 0.967723, 0, 1, 0.6117647, 1,
-0.9339798, 0.566866, 0.9719777, 0, 1, 0.6156863, 1,
-0.929755, 0.5620593, 0.9759358, 0, 1, 0.6235294, 1,
-0.9254042, 0.5572335, 0.9795961, 0, 1, 0.627451, 1,
-0.9209278, 0.5523888, 0.9829574, 0, 1, 0.6352941, 1,
-0.9163265, 0.5475253, 0.9860187, 0, 1, 0.6392157, 1,
-0.9116009, 0.5426433, 0.9887791, 0, 1, 0.6470588, 1,
-0.9067516, 0.5377429, 0.9912378, 0, 1, 0.6509804, 1,
-0.9017794, 0.5328243, 0.993394, 0, 1, 0.6588235, 1,
-0.8966849, 0.5278875, 0.9952469, 0, 1, 0.6627451, 1,
-0.8914687, 0.5229329, 0.9967963, 0, 1, 0.6705883, 1,
-0.8861316, 0.5179606, 0.9980413, 0, 1, 0.6745098, 1,
-0.8806744, 0.5129707, 0.9989818, 0, 1, 0.682353, 1,
-0.8750976, 0.5079634, 0.9996175, 0, 1, 0.6862745, 1,
-0.8694022, 0.5029389, 0.9999481, 0, 1, 0.6941177, 1,
-0.8635889, 0.4978973, 0.9999735, 0, 1, 0.7019608, 1,
-0.8576584, 0.4928388, 0.9996938, 0, 1, 0.7058824, 1,
-0.8516116, 0.4877636, 0.999109, 0, 1, 0.7137255, 1,
-0.8454493, 0.4826719, 0.9982193, 0, 1, 0.7176471, 1,
-0.8391724, 0.4775639, 0.9970249, 0, 1, 0.7254902, 1,
-0.8327816, 0.4724396, 0.9955263, 0, 1, 0.7294118, 1,
-0.8262779, 0.4672993, 0.9937239, 0, 1, 0.7372549, 1,
-0.819662, 0.4621431, 0.9916182, 0, 1, 0.7411765, 1,
-0.812935, 0.4569713, 0.9892099, 0, 1, 0.7490196, 1,
-0.8060977, 0.451784, 0.9864997, 0, 1, 0.7529412, 1,
-0.7991511, 0.4465814, 0.9834884, 0, 1, 0.7607843, 1,
-0.7920961, 0.4413636, 0.980177, 0, 1, 0.7647059, 1,
-0.7849337, 0.4361309, 0.9765666, 0, 1, 0.772549, 1,
-0.7776648, 0.4308833, 0.972658, 0, 1, 0.7764706, 1,
-0.7702905, 0.4256212, 0.9684527, 0, 1, 0.7843137, 1,
-0.7628117, 0.4203447, 0.9639518, 0, 1, 0.7882353, 1,
-0.7552294, 0.4150538, 0.9591567, 0, 1, 0.7960784, 1,
-0.7475446, 0.4097489, 0.954069, 0, 1, 0.8039216, 1,
-0.7397584, 0.4044302, 0.94869, 0, 1, 0.8078431, 1,
-0.731872, 0.3990976, 0.9430215, 0, 1, 0.8156863, 1,
-0.7238863, 0.3937516, 0.9370653, 0, 1, 0.8196079, 1,
-0.7158023, 0.3883922, 0.9308231, 0, 1, 0.827451, 1,
-0.7076213, 0.3830197, 0.9242968, 0, 1, 0.8313726, 1,
-0.6993443, 0.3776341, 0.9174885, 0, 1, 0.8392157, 1,
-0.6909724, 0.3722357, 0.9104002, 0, 1, 0.8431373, 1,
-0.6825069, 0.3668248, 0.903034, 0, 1, 0.8509804, 1,
-0.6739488, 0.3614014, 0.8953922, 0, 1, 0.854902, 1,
-0.6652992, 0.3559657, 0.8874772, 0, 1, 0.8627451, 1,
-0.6565594, 0.350518, 0.8792914, 0, 1, 0.8666667, 1,
-0.6477306, 0.3450583, 0.8708372, 0, 1, 0.8745098, 1,
-0.6388139, 0.339587, 0.8621172, 0, 1, 0.8784314, 1,
-0.6298105, 0.3341042, 0.8531342, 0, 1, 0.8862745, 1,
-0.6207218, 0.32861, 0.8438908, 0, 1, 0.8901961, 1,
-0.6115488, 0.3231047, 0.8343899, 0, 1, 0.8980392, 1,
-0.6022929, 0.3175884, 0.8246343, 0, 1, 0.9058824, 1,
-0.5929553, 0.3120614, 0.8146271, 0, 1, 0.9098039, 1,
-0.5835373, 0.3065238, 0.8043713, 0, 1, 0.9176471, 1,
-0.5740401, 0.3009758, 0.79387, 0, 1, 0.9215686, 1,
-0.564465, 0.2954175, 0.7831265, 0, 1, 0.9294118, 1,
-0.5548135, 0.2898493, 0.7721439, 0, 1, 0.9333333, 1,
-0.5450866, 0.2842712, 0.7609257, 0, 1, 0.9411765, 1,
-0.5352858, 0.2786835, 0.7494753, 0, 1, 0.945098, 1,
-0.5254125, 0.2730864, 0.7377962, 0, 1, 0.9529412, 1,
-0.5154678, 0.26748, 0.7258919, 0, 1, 0.9568627, 1,
-0.5054533, 0.2618645, 0.7137661, 0, 1, 0.9647059, 1,
-0.4953701, 0.2562401, 0.7014225, 0, 1, 0.9686275, 1,
-0.4852198, 0.2506071, 0.6888648, 0, 1, 0.9764706, 1,
-0.4750037, 0.2449655, 0.6760969, 0, 1, 0.9803922, 1,
-0.4647232, 0.2393157, 0.6631227, 0, 1, 0.9882353, 1,
-0.4543796, 0.2336577, 0.649946, 0, 1, 0.9921569, 1,
-0.4439744, 0.2279918, 0.6365711, 0, 1, 1, 1,
-0.433509, 0.2223182, 0.6230019, 0, 0.9921569, 1, 1,
-0.4229847, 0.216637, 0.6092426, 0, 0.9882353, 1, 1,
-0.4124031, 0.2109485, 0.5952973, 0, 0.9803922, 1, 1,
-0.4017656, 0.2052528, 0.5811703, 0, 0.9764706, 1, 1,
-0.3910736, 0.1995502, 0.566866, 0, 0.9686275, 1, 1,
-0.3803285, 0.1938408, 0.5523888, 0, 0.9647059, 1, 1,
-0.3695318, 0.1881249, 0.5377429, 0, 0.9568627, 1, 1,
-0.358685, 0.1824025, 0.5229329, 0, 0.9529412, 1, 1,
-0.3477896, 0.176674, 0.5079634, 0, 0.945098, 1, 1,
-0.336847, 0.1709395, 0.4928388, 0, 0.9411765, 1, 1,
-0.3258587, 0.1651992, 0.4775639, 0, 0.9333333, 1, 1,
-0.3148263, 0.1594532, 0.4621431, 0, 0.9294118, 1, 1,
-0.3037511, 0.1537019, 0.4465814, 0, 0.9215686, 1, 1,
-0.2926347, 0.1479454, 0.4308833, 0, 0.9176471, 1, 1,
-0.2814786, 0.1421838, 0.4150538, 0, 0.9098039, 1, 1,
-0.2702843, 0.1364175, 0.3990976, 0, 0.9058824, 1, 1,
-0.2590534, 0.1306465, 0.3830197, 0, 0.8980392, 1, 1,
-0.2477873, 0.124871, 0.3668248, 0, 0.8901961, 1, 1,
-0.2364877, 0.1190914, 0.350518, 0, 0.8862745, 1, 1,
-0.2251559, 0.1133077, 0.3341042, 0, 0.8784314, 1, 1,
-0.2137937, 0.1075201, 0.3175884, 0, 0.8745098, 1, 1,
-0.2024024, 0.1017289, 0.3009758, 0, 0.8666667, 1, 1,
-0.1909837, 0.09593431, 0.2842712, 0, 0.8627451, 1, 1,
-0.179539, 0.09013642, 0.26748, 0, 0.854902, 1, 1,
-0.16807, 0.08433547, 0.2506071, 0, 0.8509804, 1, 1,
-0.1565782, 0.07853166, 0.2336577, 0, 0.8431373, 1, 1,
-0.1450652, 0.07272519, 0.216637, 0, 0.8392157, 1, 1,
-0.1335325, 0.06691626, 0.1995502, 0, 0.8313726, 1, 1,
-0.1219817, 0.06110505, 0.1824025, 0, 0.827451, 1, 1,
-0.1104144, 0.05529177, 0.1651992, 0, 0.8196079, 1, 1,
-0.09883205, 0.04947662, 0.1479454, 0, 0.8156863, 1, 1,
-0.08723632, 0.04365979, 0.1306465, 0, 0.8078431, 1, 1,
-0.07562874, 0.03784148, 0.1133077, 0, 0.8039216, 1, 1,
-0.06401093, 0.03202188, 0.09593431, 0, 0.7960784, 1, 1,
-0.05238442, 0.0262012, 0.07853166, 0, 0.7882353, 1, 1,
-0.04075081, 0.02037963, 0.06110505, 0, 0.7843137, 1, 1,
-0.02911167, 0.01455738, 0.04365979, 0, 0.7764706, 1, 1,
-0.01746858, 0.008734623, 0.0262012, 0, 0.772549, 1, 1,
-0.005823123, 0.002911574, 0.008734623, 0, 0.7647059, 1, 1,
0.005823123, -0.002911574, -0.008734623, 0, 0.7607843, 1, 1,
0.01746858, -0.008734623, -0.0262012, 0, 0.7529412, 1, 1,
0.02911167, -0.01455738, -0.04365979, 0, 0.7490196, 1, 1,
0.04075081, -0.02037963, -0.06110505, 0, 0.7411765, 1, 1,
0.05238442, -0.0262012, -0.07853166, 0, 0.7372549, 1, 1,
0.06401093, -0.03202188, -0.09593431, 0, 0.7294118, 1, 1,
0.07562874, -0.03784148, -0.1133077, 0, 0.7254902, 1, 1,
0.08723632, -0.04365979, -0.1306465, 0, 0.7176471, 1, 1,
0.09883205, -0.04947662, -0.1479454, 0, 0.7137255, 1, 1,
0.1104144, -0.05529177, -0.1651992, 0, 0.7058824, 1, 1,
0.1219817, -0.06110505, -0.1824025, 0, 0.6980392, 1, 1,
0.1335325, -0.06691626, -0.1995502, 0, 0.6941177, 1, 1,
0.1450652, -0.07272519, -0.216637, 0, 0.6862745, 1, 1,
0.1565782, -0.07853166, -0.2336577, 0, 0.682353, 1, 1,
0.16807, -0.08433547, -0.2506071, 0, 0.6745098, 1, 1,
0.179539, -0.09013642, -0.26748, 0, 0.6705883, 1, 1,
0.1909837, -0.09593431, -0.2842712, 0, 0.6627451, 1, 1,
0.2024024, -0.1017289, -0.3009758, 0, 0.6588235, 1, 1,
0.2137937, -0.1075201, -0.3175884, 0, 0.6509804, 1, 1,
0.2251559, -0.1133077, -0.3341042, 0, 0.6470588, 1, 1,
0.2364877, -0.1190914, -0.350518, 0, 0.6392157, 1, 1,
0.2477873, -0.124871, -0.3668248, 0, 0.6352941, 1, 1,
0.2590534, -0.1306465, -0.3830197, 0, 0.627451, 1, 1,
0.2702843, -0.1364175, -0.3990976, 0, 0.6235294, 1, 1,
0.2814786, -0.1421838, -0.4150538, 0, 0.6156863, 1, 1,
0.2926347, -0.1479454, -0.4308833, 0, 0.6117647, 1, 1,
0.3037511, -0.1537019, -0.4465814, 0, 0.6039216, 1, 1,
0.3148263, -0.1594532, -0.4621431, 0, 0.5960785, 1, 1,
0.3258587, -0.1651992, -0.4775639, 0, 0.5921569, 1, 1,
0.336847, -0.1709395, -0.4928388, 0, 0.5843138, 1, 1,
0.3477896, -0.176674, -0.5079634, 0, 0.5803922, 1, 1,
0.358685, -0.1824025, -0.5229329, 0, 0.572549, 1, 1,
0.3695318, -0.1881249, -0.5377429, 0, 0.5686275, 1, 1,
0.3803285, -0.1938408, -0.5523888, 0, 0.5607843, 1, 1,
0.3910736, -0.1995502, -0.566866, 0, 0.5568628, 1, 1,
0.4017656, -0.2052528, -0.5811703, 0, 0.5490196, 1, 1,
0.4124031, -0.2109485, -0.5952973, 0, 0.5450981, 1, 1,
0.4229847, -0.216637, -0.6092426, 0, 0.5372549, 1, 1,
0.433509, -0.2223182, -0.6230019, 0, 0.5333334, 1, 1,
0.4439744, -0.2279918, -0.6365711, 0, 0.5254902, 1, 1,
0.4543796, -0.2336577, -0.649946, 0, 0.5215687, 1, 1,
0.4647232, -0.2393157, -0.6631227, 0, 0.5137255, 1, 1,
0.4750037, -0.2449655, -0.6760969, 0, 0.509804, 1, 1,
0.4852198, -0.2506071, -0.6888648, 0, 0.5019608, 1, 1,
0.4953701, -0.2562401, -0.7014225, 0, 0.4941176, 1, 1,
0.5054533, -0.2618645, -0.7137661, 0, 0.4901961, 1, 1,
0.5154678, -0.26748, -0.7258919, 0, 0.4823529, 1, 1,
0.5254125, -0.2730864, -0.7377962, 0, 0.4784314, 1, 1,
0.5352858, -0.2786835, -0.7494753, 0, 0.4705882, 1, 1,
0.5450866, -0.2842712, -0.7609257, 0, 0.4666667, 1, 1,
0.5548135, -0.2898493, -0.7721439, 0, 0.4588235, 1, 1,
0.564465, -0.2954175, -0.7831265, 0, 0.454902, 1, 1,
0.5740401, -0.3009758, -0.79387, 0, 0.4470588, 1, 1,
0.5835373, -0.3065238, -0.8043713, 0, 0.4431373, 1, 1,
0.5929553, -0.3120614, -0.8146271, 0, 0.4352941, 1, 1,
0.6022929, -0.3175884, -0.8246343, 0, 0.4313726, 1, 1,
0.6115488, -0.3231047, -0.8343899, 0, 0.4235294, 1, 1,
0.6207218, -0.32861, -0.8438908, 0, 0.4196078, 1, 1,
0.6298105, -0.3341042, -0.8531342, 0, 0.4117647, 1, 1,
0.6388139, -0.339587, -0.8621172, 0, 0.4078431, 1, 1,
0.6477306, -0.3450583, -0.8708372, 0, 0.4, 1, 1,
0.6565594, -0.350518, -0.8792914, 0, 0.3921569, 1, 1,
0.6652992, -0.3559657, -0.8874772, 0, 0.3882353, 1, 1,
0.6739488, -0.3614014, -0.8953922, 0, 0.3803922, 1, 1,
0.6825069, -0.3668248, -0.903034, 0, 0.3764706, 1, 1,
0.6909724, -0.3722357, -0.9104002, 0, 0.3686275, 1, 1,
0.6993443, -0.3776341, -0.9174885, 0, 0.3647059, 1, 1,
0.7076213, -0.3830197, -0.9242968, 0, 0.3568628, 1, 1,
0.7158023, -0.3883922, -0.9308231, 0, 0.3529412, 1, 1,
0.7238863, -0.3937516, -0.9370653, 0, 0.345098, 1, 1,
0.731872, -0.3990976, -0.9430215, 0, 0.3411765, 1, 1,
0.7397584, -0.4044302, -0.94869, 0, 0.3333333, 1, 1,
0.7475446, -0.4097489, -0.954069, 0, 0.3294118, 1, 1,
0.7552294, -0.4150538, -0.9591567, 0, 0.3215686, 1, 1,
0.7628117, -0.4203447, -0.9639518, 0, 0.3176471, 1, 1,
0.7702905, -0.4256212, -0.9684527, 0, 0.3098039, 1, 1,
0.7776648, -0.4308833, -0.972658, 0, 0.3058824, 1, 1,
0.7849337, -0.4361309, -0.9765666, 0, 0.2980392, 1, 1,
0.7920961, -0.4413636, -0.980177, 0, 0.2901961, 1, 1,
0.7991511, -0.4465814, -0.9834884, 0, 0.2862745, 1, 1,
0.8060977, -0.451784, -0.9864997, 0, 0.2784314, 1, 1,
0.812935, -0.4569713, -0.9892099, 0, 0.2745098, 1, 1,
0.819662, -0.4621431, -0.9916182, 0, 0.2666667, 1, 1,
0.8262779, -0.4672993, -0.9937239, 0, 0.2627451, 1, 1,
0.8327816, -0.4724396, -0.9955263, 0, 0.254902, 1, 1,
0.8391724, -0.4775639, -0.9970249, 0, 0.2509804, 1, 1,
0.8454493, -0.4826719, -0.9982193, 0, 0.2431373, 1, 1,
0.8516116, -0.4877636, -0.999109, 0, 0.2392157, 1, 1,
0.8576584, -0.4928388, -0.9996938, 0, 0.2313726, 1, 1,
0.8635889, -0.4978973, -0.9999735, 0, 0.227451, 1, 1,
0.8694022, -0.5029389, -0.9999481, 0, 0.2196078, 1, 1,
0.8750976, -0.5079634, -0.9996175, 0, 0.2156863, 1, 1,
0.8806744, -0.5129707, -0.9989818, 0, 0.2078431, 1, 1,
0.8861316, -0.5179606, -0.9980413, 0, 0.2039216, 1, 1,
0.8914687, -0.5229329, -0.9967963, 0, 0.1960784, 1, 1,
0.8966849, -0.5278875, -0.9952469, 0, 0.1882353, 1, 1,
0.9017794, -0.5328243, -0.993394, 0, 0.1843137, 1, 1,
0.9067516, -0.5377429, -0.9912378, 0, 0.1764706, 1, 1,
0.9116009, -0.5426433, -0.9887791, 0, 0.172549, 1, 1,
0.9163265, -0.5475253, -0.9860187, 0, 0.1647059, 1, 1,
0.9209278, -0.5523888, -0.9829574, 0, 0.1607843, 1, 1,
0.9254042, -0.5572335, -0.9795961, 0, 0.1529412, 1, 1,
0.929755, -0.5620593, -0.9759358, 0, 0.1490196, 1, 1,
0.9339798, -0.566866, -0.9719777, 0, 0.1411765, 1, 1,
0.9380779, -0.5716536, -0.967723, 0, 0.1372549, 1, 1,
0.9420488, -0.5764217, -0.963173, 0, 0.1294118, 1, 1,
0.9458919, -0.5811703, -0.958329, 0, 0.1254902, 1, 1,
0.9496067, -0.5858992, -0.9531927, 0, 0.1176471, 1, 1,
0.9531927, -0.5906083, -0.9477653, 0, 0.1137255, 1, 1,
0.9566493, -0.5952973, -0.9420488, 0, 0.1058824, 1, 1,
0.9599763, -0.5999661, -0.9360448, 0, 0.09803922, 1, 1,
0.963173, -0.6046146, -0.929755, 0, 0.09411765, 1, 1,
0.9662391, -0.6092426, -0.9231816, 0, 0.08627451, 1, 1,
0.9691741, -0.6138499, -0.9163265, 0, 0.08235294, 1, 1,
0.9719777, -0.6184363, -0.9091917, 0, 0.07450981, 1, 1,
0.9746495, -0.6230019, -0.9017794, 0, 0.07058824, 1, 1,
0.9771891, -0.6275463, -0.894092, 0, 0.0627451, 1, 1,
0.9795961, -0.6320694, -0.8861316, 0, 0.05882353, 1, 1,
0.9818702, -0.6365711, -0.8779009, 0, 0.05098039, 1, 1,
0.9840112, -0.6410512, -0.8694022, 0, 0.04705882, 1, 1,
0.9860187, -0.6455096, -0.8606383, 0, 0.03921569, 1, 1,
0.9878924, -0.649946, -0.8516116, 0, 0.03529412, 1, 1,
0.9896322, -0.6543605, -0.8423252, 0, 0.02745098, 1, 1,
0.9912378, -0.6587527, -0.8327816, 0, 0.02352941, 1, 1,
0.9927089, -0.6631227, -0.8229839, 0, 0.01568628, 1, 1,
0.9940453, -0.6674701, -0.812935, 0, 0.01176471, 1, 1,
0.9952469, -0.6717949, -0.8026381, 0, 0.003921569, 1, 1,
0.9963136, -0.6760969, -0.7920961, 0.003921569, 0, 1, 1,
0.9972451, -0.680376, -0.7813125, 0.007843138, 0, 1, 1,
0.9980413, -0.684632, -0.7702905, 0.01568628, 0, 1, 1,
0.9987022, -0.6888648, -0.7590334, 0.01960784, 0, 1, 1,
0.9992276, -0.6930742, -0.7475446, 0.02745098, 0, 1, 1,
0.9996175, -0.6972602, -0.7358277, 0.03137255, 0, 1, 1,
0.9998718, -0.7014225, -0.7238863, 0.03921569, 0, 1, 1,
0.9999905, -0.705561, -0.7117239, 0.04313726, 0, 1, 1,
0.9999735, -0.7096756, -0.6993443, 0.05098039, 0, 1, 1,
0.9998209, -0.7137661, -0.6867513, 0.05490196, 0, 1, 1,
0.9995327, -0.7178324, -0.6739488, 0.0627451, 0, 1, 1,
0.999109, -0.7218744, -0.6609405, 0.06666667, 0, 1, 1,
0.9985497, -0.7258919, -0.6477306, 0.07450981, 0, 1, 1,
0.9978549, -0.7298848, -0.6343229, 0.07843138, 0, 1, 1,
0.9970249, -0.7338529, -0.6207218, 0.08627451, 0, 1, 1,
0.9960596, -0.7377962, -0.6069311, 0.09019608, 0, 1, 1,
0.9949592, -0.7417144, -0.5929553, 0.09803922, 0, 1, 1,
0.9937239, -0.7456075, -0.5787985, 0.1058824, 0, 1, 1,
0.9923537, -0.7494753, -0.564465, 0.1098039, 0, 1, 1,
0.990849, -0.7533177, -0.5499594, 0.1176471, 0, 1, 1,
0.9892099, -0.7571346, -0.5352858, 0.1215686, 0, 1, 1,
0.9874366, -0.7609257, -0.520449, 0.1294118, 0, 1, 1,
0.9855294, -0.7646911, -0.5054533, 0.1333333, 0, 1, 1,
0.9834884, -0.7684305, -0.4903033, 0.1411765, 0, 1, 1,
0.9813141, -0.7721439, -0.4750037, 0.145098, 0, 1, 1,
0.9790068, -0.7758311, -0.4595592, 0.1529412, 0, 1, 1,
0.9765666, -0.779492, -0.4439744, 0.1568628, 0, 1, 1,
0.973994, -0.7831265, -0.4282541, 0.1647059, 0, 1, 1,
0.9712892, -0.7867343, -0.4124031, 0.1686275, 0, 1, 1,
0.9684527, -0.7903156, -0.3964263, 0.1764706, 0, 1, 1,
0.9654849, -0.79387, -0.3803285, 0.1803922, 0, 1, 1,
0.9623861, -0.7973976, -0.3641146, 0.1882353, 0, 1, 1,
0.9591567, -0.800898, -0.3477896, 0.1921569, 0, 1, 1,
0.9557973, -0.8043713, -0.3313585, 0.2, 0, 1, 1,
0.9523082, -0.8078173, -0.3148263, 0.2078431, 0, 1, 1,
0.94869, -0.811236, -0.2981979, 0.2117647, 0, 1, 1,
0.9449431, -0.8146271, -0.2814786, 0.2196078, 0, 1, 1,
0.941068, -0.8179907, -0.2646734, 0.2235294, 0, 1, 1,
0.9370653, -0.8213264, -0.2477873, 0.2313726, 0, 1, 1,
0.9329355, -0.8246343, -0.2308257, 0.2352941, 0, 1, 1,
0.9286791, -0.8279143, -0.2137937, 0.2431373, 0, 1, 1,
0.9242968, -0.8311662, -0.1966964, 0.2470588, 0, 1, 1,
0.9197891, -0.8343899, -0.179539, 0.254902, 0, 1, 1,
0.9151567, -0.8375853, -0.1623269, 0.2588235, 0, 1, 1,
0.9104002, -0.8407523, -0.1450652, 0.2666667, 0, 1, 1,
0.9055201, -0.8438908, -0.1277593, 0.2705882, 0, 1, 1,
0.9005172, -0.8470007, -0.1104144, 0.2784314, 0, 1, 1,
0.8953922, -0.8500819, -0.09303576, 0.282353, 0, 1, 1,
0.8901457, -0.8531342, -0.07562874, 0.2901961, 0, 1, 1,
0.8847786, -0.8561576, -0.05819866, 0.2941177, 0, 1, 1,
0.8792914, -0.859152, -0.04075081, 0.3019608, 0, 1, 1,
0.8736849, -0.8621172, -0.02329052, 0.3098039, 0, 1, 1,
0.8679599, -0.8650532, -0.005823123, 0.3137255, 0, 1, 1,
0.8621172, -0.8679599, 0.01164605, 0.3215686, 0, 1, 1,
0.8561576, -0.8708372, 0.02911167, 0.3254902, 0, 1, 1,
0.8500819, -0.8736849, 0.0465684, 0.3333333, 0, 1, 1,
0.8438908, -0.876503, 0.06401093, 0.3372549, 0, 1, 1,
0.8375853, -0.8792914, 0.08143391, 0.345098, 0, 1, 1,
0.8311662, -0.8820499, 0.09883205, 0.3490196, 0, 1, 1,
0.8246343, -0.8847786, 0.1162, 0.3568628, 0, 1, 1,
0.8179907, -0.8874772, 0.1335325, 0.3607843, 0, 1, 1,
0.811236, -0.8901457, 0.1508243, 0.3686275, 0, 1, 1,
0.8043713, -0.8927841, 0.16807, 0.372549, 0, 1, 1,
0.7973976, -0.8953922, 0.1852645, 0.3803922, 0, 1, 1,
0.7903156, -0.8979699, 0.2024024, 0.3843137, 0, 1, 1,
0.7831265, -0.9005172, 0.2194785, 0.3921569, 0, 1, 1,
0.7758311, -0.903034, 0.2364877, 0.3960784, 0, 1, 1,
0.7684305, -0.9055201, 0.2534247, 0.4039216, 0, 1, 1,
0.7609257, -0.9079755, 0.2702843, 0.4117647, 0, 1, 1,
0.7533177, -0.9104002, 0.2870615, 0.4156863, 0, 1, 1,
0.7456075, -0.9127939, 0.3037511, 0.4235294, 0, 1, 1,
0.7377962, -0.9151567, 0.3203479, 0.427451, 0, 1, 1,
0.7298848, -0.9174885, 0.336847, 0.4352941, 0, 1, 1,
0.7218744, -0.9197891, 0.3532433, 0.4392157, 0, 1, 1,
0.7137661, -0.9220586, 0.3695318, 0.4470588, 0, 1, 1,
0.705561, -0.9242968, 0.3857076, 0.4509804, 0, 1, 1,
0.6972602, -0.9265037, 0.4017656, 0.4588235, 0, 1, 1,
0.6888648, -0.9286791, 0.417701, 0.4627451, 0, 1, 1,
0.680376, -0.9308231, 0.433509, 0.4705882, 0, 1, 1,
0.6717949, -0.9329355, 0.4491846, 0.4745098, 0, 1, 1,
0.6631227, -0.9350162, 0.4647232, 0.4823529, 0, 1, 1,
0.6543605, -0.9370653, 0.4801199, 0.4862745, 0, 1, 1,
0.6455096, -0.9390826, 0.4953701, 0.4941176, 0, 1, 1,
0.6365711, -0.941068, 0.5104692, 0.5019608, 0, 1, 1,
0.6275463, -0.9430215, 0.5254125, 0.5058824, 0, 1, 1,
0.6184363, -0.9449431, 0.5401954, 0.5137255, 0, 1, 1,
0.6092426, -0.9468326, 0.5548135, 0.5176471, 0, 1, 1,
0.5999661, -0.94869, 0.5692622, 0.5254902, 0, 1, 1,
0.5906083, -0.9505152, 0.5835373, 0.5294118, 0, 1, 1,
0.5811703, -0.9523082, 0.5976342, 0.5372549, 0, 1, 1,
0.5716536, -0.954069, 0.6115488, 0.5411765, 0, 1, 1,
0.5620593, -0.9557973, 0.6252767, 0.5490196, 0, 1, 1,
0.5523888, -0.9574932, 0.6388139, 0.5529412, 0, 1, 1,
0.5426433, -0.9591567, 0.6521561, 0.5607843, 0, 1, 1,
0.5328243, -0.9607877, 0.6652992, 0.5647059, 0, 1, 1,
0.5229329, -0.9623861, 0.6782393, 0.572549, 0, 1, 1,
0.5129707, -0.9639518, 0.6909724, 0.5764706, 0, 1, 1,
0.5029389, -0.9654849, 0.7034947, 0.5843138, 0, 1, 1,
0.4928388, -0.9669852, 0.7158023, 0.5882353, 0, 1, 1,
0.4826719, -0.9684527, 0.7278914, 0.5960785, 0, 1, 1,
0.4724396, -0.9698874, 0.7397584, 0.6039216, 0, 1, 1,
0.4621431, -0.9712892, 0.7513997, 0.6078432, 0, 1, 1,
0.451784, -0.972658, 0.7628117, 0.6156863, 0, 1, 1,
0.4413636, -0.973994, 0.7739908, 0.6196079, 0, 1, 1,
0.4308833, -0.9752968, 0.7849337, 0.627451, 0, 1, 1,
0.4203447, -0.9765666, 0.7956371, 0.6313726, 0, 1, 1,
0.4097489, -0.9778032, 0.8060977, 0.6392157, 0, 1, 1,
0.3990976, -0.9790068, 0.8163124, 0.6431373, 0, 1, 1,
0.3883922, -0.980177, 0.8262779, 0.6509804, 0, 1, 1,
0.3776341, -0.9813141, 0.8359911, 0.654902, 0, 1, 1,
0.3668248, -0.9824179, 0.8454493, 0.6627451, 0, 1, 1,
0.3559657, -0.9834884, 0.8546495, 0.6666667, 0, 1, 1,
0.3450583, -0.9845256, 0.8635889, 0.6745098, 0, 1, 1,
0.3341042, -0.9855294, 0.8722647, 0.6784314, 0, 1, 1,
0.3231047, -0.9864997, 0.8806744, 0.6862745, 0, 1, 1,
0.3120614, -0.9874366, 0.8888152, 0.6901961, 0, 1, 1,
0.3009758, -0.98834, 0.8966849, 0.6980392, 0, 1, 1,
0.2898493, -0.9892099, 0.9042808, 0.7058824, 0, 1, 1,
0.2786835, -0.9900462, 0.9116009, 0.7098039, 0, 1, 1,
0.26748, -0.990849, 0.9186427, 0.7176471, 0, 1, 1,
0.2562401, -0.9916182, 0.9254042, 0.7215686, 0, 1, 1,
0.2449655, -0.9923537, 0.9318832, 0.7294118, 0, 1, 1,
0.2336577, -0.9930556, 0.9380779, 0.7333333, 0, 1, 1,
0.2223182, -0.9937239, 0.9439863, 0.7411765, 0, 1, 1,
0.2109485, -0.9943584, 0.9496067, 0.7450981, 0, 1, 1,
0.1995502, -0.9949592, 0.9549372, 0.7529412, 0, 1, 1,
0.1881249, -0.9955263, 0.9599763, 0.7568628, 0, 1, 1,
0.176674, -0.9960596, 0.9647224, 0.7647059, 0, 1, 1,
0.1651992, -0.9965591, 0.9691741, 0.7686275, 0, 1, 1,
0.1537019, -0.9970249, 0.9733301, 0.7764706, 0, 1, 1,
0.1421838, -0.9974568, 0.9771891, 0.7803922, 0, 1, 1,
0.1306465, -0.9978549, 0.9807498, 0.7882353, 0, 1, 1,
0.1190914, -0.9982193, 0.9840112, 0.7921569, 0, 1, 1,
0.1075201, -0.9985497, 0.9869723, 0.8, 0, 1, 1,
0.09593431, -0.9988462, 0.9896322, 0.8078431, 0, 1, 1,
0.08433547, -0.999109, 0.9919901, 0.8117647, 0, 1, 1,
0.07272519, -0.9993378, 0.9940453, 0.8196079, 0, 1, 1,
0.06110505, -0.9995327, 0.9957972, 0.8235294, 0, 1, 1,
0.04947662, -0.9996938, 0.9972451, 0.8313726, 0, 1, 1,
0.03784148, -0.9998209, 0.9983887, 0.8352941, 0, 1, 1,
0.0262012, -0.9999142, 0.9992276, 0.8431373, 0, 1, 1,
0.01455738, -0.9999735, 0.9997616, 0.8470588, 0, 1, 1,
0.002911574, -0.9999989, 0.9999905, 0.854902, 0, 1, 1,
-0.008734623, -0.9999905, 0.9999142, 0.8588235, 0, 1, 1,
-0.02037963, -0.9999481, 0.9995327, 0.8666667, 0, 1, 1,
-0.03202188, -0.9998718, 0.9988462, 0.8705882, 0, 1, 1,
-0.04365979, -0.9997616, 0.9978549, 0.8784314, 0, 1, 1,
-0.05529177, -0.9996175, 0.9965591, 0.8823529, 0, 1, 1,
-0.06691626, -0.9994395, 0.9949592, 0.8901961, 0, 1, 1,
-0.07853166, -0.9992276, 0.9930556, 0.8941177, 0, 1, 1,
-0.09013642, -0.9989818, 0.990849, 0.9019608, 0, 1, 1,
-0.1017289, -0.9987022, 0.98834, 0.9098039, 0, 1, 1,
-0.1133077, -0.9983887, 0.9855294, 0.9137255, 0, 1, 1,
-0.124871, -0.9980413, 0.9824179, 0.9215686, 0, 1, 1,
-0.1364175, -0.9976601, 0.9790068, 0.9254902, 0, 1, 1,
-0.1479454, -0.9972451, 0.9752968, 0.9333333, 0, 1, 1,
-0.1594532, -0.9967963, 0.9712892, 0.9372549, 0, 1, 1,
-0.1709395, -0.9963136, 0.9669852, 0.945098, 0, 1, 1,
-0.1824025, -0.9957972, 0.9623861, 0.9490196, 0, 1, 1,
-0.1938408, -0.9952469, 0.9574932, 0.9568627, 0, 1, 1,
-0.2052528, -0.994663, 0.9523082, 0.9607843, 0, 1, 1,
-0.216637, -0.9940453, 0.9468326, 0.9686275, 0, 1, 1,
-0.2279918, -0.993394, 0.941068, 0.972549, 0, 1, 1,
-0.2393157, -0.9927089, 0.9350162, 0.9803922, 0, 1, 1,
-0.2506071, -0.9919901, 0.9286791, 0.9843137, 0, 1, 1,
-0.2618645, -0.9912378, 0.9220586, 0.9921569, 0, 1, 1,
-0.2730864, -0.9904518, 0.9151567, 0.9960784, 0, 1, 1,
-0.2842712, -0.9896322, 0.9079755, 1, 0, 0.9960784, 1,
-0.2954175, -0.9887791, 0.9005172, 1, 0, 0.9882353, 1,
-0.3065238, -0.9878924, 0.8927841, 1, 0, 0.9843137, 1,
-0.3175884, -0.9869723, 0.8847786, 1, 0, 0.9764706, 1,
-0.32861, -0.9860187, 0.876503, 1, 0, 0.972549, 1,
-0.339587, -0.9850317, 0.8679599, 1, 0, 0.9647059, 1,
-0.350518, -0.9840112, 0.859152, 1, 0, 0.9607843, 1,
-0.3614014, -0.9829574, 0.8500819, 1, 0, 0.9529412, 1,
-0.3722357, -0.9818702, 0.8407523, 1, 0, 0.9490196, 1,
-0.3830197, -0.9807498, 0.8311662, 1, 0, 0.9411765, 1,
-0.3937516, -0.9795961, 0.8213264, 1, 0, 0.9372549, 1,
-0.4044302, -0.9784091, 0.811236, 1, 0, 0.9294118, 1,
-0.4150538, -0.9771891, 0.800898, 1, 0, 0.9254902, 1,
-0.4256212, -0.9759358, 0.7903156, 1, 0, 0.9176471, 1,
-0.4361309, -0.9746495, 0.779492, 1, 0, 0.9137255, 1,
-0.4465814, -0.9733301, 0.7684305, 1, 0, 0.9058824, 1,
-0.4569713, -0.9719777, 0.7571346, 1, 0, 0.9019608, 1,
-0.4672993, -0.9705924, 0.7456075, 1, 0, 0.8941177, 1,
-0.4775639, -0.9691741, 0.7338529, 1, 0, 0.8862745, 1,
-0.4877636, -0.967723, 0.7218744, 1, 0, 0.8823529, 1,
-0.4978973, -0.9662391, 0.7096756, 1, 0, 0.8745098, 1,
-0.5079634, -0.9647224, 0.6972602, 1, 0, 0.8705882, 1,
-0.5179606, -0.963173, 0.684632, 1, 0, 0.8627451, 1,
-0.5278875, -0.9615909, 0.6717949, 1, 0, 0.8588235, 1,
-0.5377429, -0.9599763, 0.6587527, 1, 0, 0.8509804, 1,
-0.5475253, -0.958329, 0.6455096, 1, 0, 0.8470588, 1,
-0.5572335, -0.9566493, 0.6320694, 1, 0, 0.8392157, 1,
-0.566866, -0.9549372, 0.6184363, 1, 0, 0.8352941, 1,
-0.5764217, -0.9531927, 0.6046146, 1, 0, 0.827451, 1,
-0.5858992, -0.9514158, 0.5906083, 1, 0, 0.8235294, 1,
-0.5952973, -0.9496067, 0.5764217, 1, 0, 0.8156863, 1,
-0.6046146, -0.9477653, 0.5620593, 1, 0, 0.8117647, 1,
-0.6138499, -0.9458919, 0.5475253, 1, 0, 0.8039216, 1,
-0.6230019, -0.9439863, 0.5328243, 1, 0, 0.7960784, 1,
-0.6320694, -0.9420488, 0.5179606, 1, 0, 0.7921569, 1,
-0.6410512, -0.9400793, 0.5029389, 1, 0, 0.7843137, 1,
-0.649946, -0.9380779, 0.4877636, 1, 0, 0.7803922, 1,
-0.6587527, -0.9360448, 0.4724396, 1, 0, 0.772549, 1,
-0.6674701, -0.9339798, 0.4569713, 1, 0, 0.7686275, 1,
-0.6760969, -0.9318832, 0.4413636, 1, 0, 0.7607843, 1,
-0.684632, -0.929755, 0.4256212, 1, 0, 0.7568628, 1,
-0.6930742, -0.9275953, 0.4097489, 1, 0, 0.7490196, 1,
-0.7014225, -0.9254042, 0.3937516, 1, 0, 0.7450981, 1,
-0.7096756, -0.9231816, 0.3776341, 1, 0, 0.7372549, 1,
-0.7178324, -0.9209278, 0.3614014, 1, 0, 0.7333333, 1,
-0.7258919, -0.9186427, 0.3450583, 1, 0, 0.7254902, 1,
-0.7338529, -0.9163265, 0.32861, 1, 0, 0.7215686, 1,
-0.7417144, -0.9139792, 0.3120614, 1, 0, 0.7137255, 1,
-0.7494753, -0.9116009, 0.2954175, 1, 0, 0.7098039, 1,
-0.7571346, -0.9091917, 0.2786835, 1, 0, 0.7019608, 1,
-0.7646911, -0.9067516, 0.2618645, 1, 0, 0.6941177, 1,
-0.7721439, -0.9042808, 0.2449655, 1, 0, 0.6901961, 1,
-0.779492, -0.9017794, 0.2279918, 1, 0, 0.682353, 1,
-0.7867343, -0.8992474, 0.2109485, 1, 0, 0.6784314, 1,
-0.79387, -0.8966849, 0.1938408, 1, 0, 0.6705883, 1,
-0.800898, -0.894092, 0.176674, 1, 0, 0.6666667, 1,
-0.8078173, -0.8914687, 0.1594532, 1, 0, 0.6588235, 1,
-0.8146271, -0.8888152, 0.1421838, 1, 0, 0.654902, 1,
-0.8213264, -0.8861316, 0.124871, 1, 0, 0.6470588, 1,
-0.8279143, -0.883418, 0.1075201, 1, 0, 0.6431373, 1,
-0.8343899, -0.8806744, 0.09013642, 1, 0, 0.6352941, 1,
-0.8407523, -0.8779009, 0.07272519, 1, 0, 0.6313726, 1,
-0.8470007, -0.8750976, 0.05529177, 1, 0, 0.6235294, 1,
-0.8531342, -0.8722647, 0.03784148, 1, 0, 0.6196079, 1,
-0.859152, -0.8694022, 0.02037963, 1, 0, 0.6117647, 1,
-0.8650532, -0.8665103, 0.002911574, 1, 0, 0.6078432, 1,
-0.8708372, -0.8635889, -0.01455738, 1, 0, 0.6, 1,
-0.876503, -0.8606383, -0.03202188, 1, 0, 0.5921569, 1,
-0.8820499, -0.8576584, -0.04947662, 1, 0, 0.5882353, 1,
-0.8874772, -0.8546495, -0.06691626, 1, 0, 0.5803922, 1,
-0.8927841, -0.8516116, -0.08433547, 1, 0, 0.5764706, 1,
-0.8979699, -0.8485449, -0.1017289, 1, 0, 0.5686275, 1,
-0.903034, -0.8454493, -0.1190914, 1, 0, 0.5647059, 1,
-0.9079755, -0.8423252, -0.1364175, 1, 0, 0.5568628, 1,
-0.9127939, -0.8391724, -0.1537019, 1, 0, 0.5529412, 1,
-0.9174885, -0.8359911, -0.1709395, 1, 0, 0.5450981, 1,
-0.9220586, -0.8327816, -0.1881249, 1, 0, 0.5411765, 1,
-0.9265037, -0.8295438, -0.2052528, 1, 0, 0.5333334, 1,
-0.9308231, -0.8262779, -0.2223182, 1, 0, 0.5294118, 1,
-0.9350162, -0.8229839, -0.2393157, 1, 0, 0.5215687, 1,
-0.9390826, -0.819662, -0.2562401, 1, 0, 0.5176471, 1,
-0.9430215, -0.8163124, -0.2730864, 1, 0, 0.509804, 1,
-0.9468326, -0.812935, -0.2898493, 1, 0, 0.5058824, 1,
-0.9505152, -0.8095301, -0.3065238, 1, 0, 0.4980392, 1,
-0.954069, -0.8060977, -0.3231047, 1, 0, 0.4901961, 1,
-0.9574932, -0.8026381, -0.339587, 1, 0, 0.4862745, 1,
-0.9607877, -0.7991511, -0.3559657, 1, 0, 0.4784314, 1,
-0.9639518, -0.7956371, -0.3722357, 1, 0, 0.4745098, 1,
-0.9669852, -0.7920961, -0.3883922, 1, 0, 0.4666667, 1,
-0.9698874, -0.7885283, -0.4044302, 1, 0, 0.4627451, 1,
-0.972658, -0.7849337, -0.4203447, 1, 0, 0.454902, 1,
-0.9752968, -0.7813125, -0.4361309, 1, 0, 0.4509804, 1,
-0.9778032, -0.7776648, -0.451784, 1, 0, 0.4431373, 1,
-0.980177, -0.7739908, -0.4672993, 1, 0, 0.4392157, 1,
-0.9824179, -0.7702905, -0.4826719, 1, 0, 0.4313726, 1,
-0.9845256, -0.7665641, -0.4978973, 1, 0, 0.427451, 1,
-0.9864997, -0.7628117, -0.5129707, 1, 0, 0.4196078, 1,
-0.98834, -0.7590334, -0.5278875, 1, 0, 0.4156863, 1,
-0.9900462, -0.7552294, -0.5426433, 1, 0, 0.4078431, 1,
-0.9916182, -0.7513997, -0.5572335, 1, 0, 0.4039216, 1,
-0.9930556, -0.7475446, -0.5716536, 1, 0, 0.3960784, 1,
-0.9943584, -0.7436641, -0.5858992, 1, 0, 0.3882353, 1,
-0.9955263, -0.7397584, -0.5999661, 1, 0, 0.3843137, 1,
-0.9965591, -0.7358277, -0.6138499, 1, 0, 0.3764706, 1,
-0.9974568, -0.731872, -0.6275463, 1, 0, 0.372549, 1,
-0.9982193, -0.7278914, -0.6410512, 1, 0, 0.3647059, 1,
-0.9988462, -0.7238863, -0.6543605, 1, 0, 0.3607843, 1,
-0.9993378, -0.7198565, -0.6674701, 1, 0, 0.3529412, 1,
-0.9996938, -0.7158023, -0.680376, 1, 0, 0.3490196, 1,
-0.9999142, -0.7117239, -0.6930742, 1, 0, 0.3411765, 1,
-0.9999989, -0.7076213, -0.705561, 1, 0, 0.3372549, 1,
-0.9999481, -0.7034947, -0.7178324, 1, 0, 0.3294118, 1,
-0.9997616, -0.6993443, -0.7298848, 1, 0, 0.3254902, 1,
-0.9994395, -0.6951702, -0.7417144, 1, 0, 0.3176471, 1,
-0.9989818, -0.6909724, -0.7533177, 1, 0, 0.3137255, 1,
-0.9983887, -0.6867513, -0.7646911, 1, 0, 0.3058824, 1,
-0.9976601, -0.6825069, -0.7758311, 1, 0, 0.2980392, 1,
-0.9967963, -0.6782393, -0.7867343, 1, 0, 0.2941177, 1,
-0.9957972, -0.6739488, -0.7973976, 1, 0, 0.2862745, 1,
-0.994663, -0.6696353, -0.8078173, 1, 0, 0.282353, 1,
-0.993394, -0.6652992, -0.8179907, 1, 0, 0.2745098, 1,
-0.9919901, -0.6609405, -0.8279143, 1, 0, 0.2705882, 1,
-0.9904518, -0.6565594, -0.8375853, 1, 0, 0.2627451, 1,
-0.9887791, -0.6521561, -0.8470007, 1, 0, 0.2588235, 1,
-0.9869723, -0.6477306, -0.8561576, 1, 0, 0.2509804, 1,
-0.9850317, -0.6432831, -0.8650532, 1, 0, 0.2470588, 1,
-0.9829574, -0.6388139, -0.8736849, 1, 0, 0.2392157, 1,
-0.9807498, -0.6343229, -0.8820499, 1, 0, 0.2352941, 1,
-0.9784091, -0.6298105, -0.8901457, 1, 0, 0.227451, 1,
-0.9759358, -0.6252767, -0.8979699, 1, 0, 0.2235294, 1,
-0.9733301, -0.6207218, -0.9055201, 1, 0, 0.2156863, 1,
-0.9705924, -0.6161457, -0.9127939, 1, 0, 0.2117647, 1,
-0.967723, -0.6115488, -0.9197891, 1, 0, 0.2039216, 1,
-0.9647224, -0.6069311, -0.9265037, 1, 0, 0.1960784, 1,
-0.9615909, -0.6022929, -0.9329355, 1, 0, 0.1921569, 1,
-0.958329, -0.5976342, -0.9390826, 1, 0, 0.1843137, 1,
-0.9549372, -0.5929553, -0.9449431, 1, 0, 0.1803922, 1,
-0.9514158, -0.5882562, -0.9505152, 1, 0, 0.172549, 1,
-0.9477653, -0.5835373, -0.9557973, 1, 0, 0.1686275, 1,
-0.9439863, -0.5787985, -0.9607877, 1, 0, 0.1607843, 1,
-0.9400793, -0.5740401, -0.9654849, 1, 0, 0.1568628, 1,
-0.9360448, -0.5692622, -0.9698874, 1, 0, 0.1490196, 1,
-0.9318832, -0.564465, -0.973994, 1, 0, 0.145098, 1,
-0.9275953, -0.5596488, -0.9778032, 1, 0, 0.1372549, 1,
-0.9231816, -0.5548135, -0.9813141, 1, 0, 0.1333333, 1,
-0.9186427, -0.5499594, -0.9845256, 1, 0, 0.1254902, 1,
-0.9139792, -0.5450866, -0.9874366, 1, 0, 0.1215686, 1,
-0.9091917, -0.5401954, -0.9900462, 1, 0, 0.1137255, 1,
-0.9042808, -0.5352858, -0.9923537, 1, 0, 0.1098039, 1,
-0.8992474, -0.5303581, -0.9943584, 1, 0, 0.1019608, 1,
-0.894092, -0.5254125, -0.9960596, 1, 0, 0.09411765, 1,
-0.8888152, -0.520449, -0.9974568, 1, 0, 0.09019608, 1,
-0.883418, -0.5154678, -0.9985497, 1, 0, 0.08235294, 1,
-0.8779009, -0.5104692, -0.9993378, 1, 0, 0.07843138, 1,
-0.8722647, -0.5054533, -0.9998209, 1, 0, 0.07058824, 1,
-0.8665103, -0.5004202, -0.9999989, 1, 0, 0.06666667, 1,
-0.8606383, -0.4953701, -0.9998718, 1, 0, 0.05882353, 1,
-0.8546495, -0.4903033, -0.9994395, 1, 0, 0.05490196, 1,
-0.8485449, -0.4852198, -0.9987022, 1, 0, 0.04705882, 1,
-0.8423252, -0.4801199, -0.9976601, 1, 0, 0.04313726, 1,
-0.8359911, -0.4750037, -0.9963136, 1, 0, 0.03529412, 1,
-0.8295438, -0.4698714, -0.994663, 1, 0, 0.03137255, 1,
-0.8229839, -0.4647232, -0.9927089, 1, 0, 0.02352941, 1,
-0.8163124, -0.4595592, -0.9904518, 1, 0, 0.01960784, 1,
-0.8095301, -0.4543796, -0.9878924, 1, 0, 0.01176471, 1,
-0.8026381, -0.4491846, -0.9850317, 1, 0, 0.007843138, 1,
-0.7956371, -0.4439744, -0.9818702, 1, 0, 0, 1,
-0.7885283, -0.4387491, -0.9784091, 1, 0.007843138, 0, 1,
-0.7813125, -0.433509, -0.9746495, 1, 0.01176471, 0, 1,
-0.7739908, -0.4282541, -0.9705924, 1, 0.01960784, 0, 1,
-0.7665641, -0.4229847, -0.9662391, 1, 0.02352941, 0, 1,
-0.7590334, -0.417701, -0.9615909, 1, 0.03137255, 0, 1,
-0.7513997, -0.4124031, -0.9566493, 1, 0.03529412, 0, 1,
-0.7436641, -0.4070913, -0.9514158, 1, 0.04313726, 0, 1,
-0.7358277, -0.4017656, -0.9458919, 1, 0.04705882, 0, 1,
-0.7278914, -0.3964263, -0.9400793, 1, 0.05490196, 0, 1,
-0.7198565, -0.3910736, -0.9339798, 1, 0.05882353, 0, 1,
-0.7117239, -0.3857076, -0.9275953, 1, 0.06666667, 0, 1,
-0.7034947, -0.3803285, -0.9209278, 1, 0.07058824, 0, 1,
-0.6951702, -0.3749365, -0.9139792, 1, 0.07843138, 0, 1,
-0.6867513, -0.3695318, -0.9067516, 1, 0.08235294, 0, 1,
-0.6782393, -0.3641146, -0.8992474, 1, 0.09019608, 0, 1,
-0.6696353, -0.358685, -0.8914687, 1, 0.09411765, 0, 1,
-0.6609405, -0.3532433, -0.883418, 1, 0.1019608, 0, 1,
-0.6521561, -0.3477896, -0.8750976, 1, 0.1098039, 0, 1,
-0.6432831, -0.3423241, -0.8665103, 1, 0.1137255, 0, 1,
-0.6343229, -0.336847, -0.8576584, 1, 0.1215686, 0, 1,
-0.6252767, -0.3313585, -0.8485449, 1, 0.1254902, 0, 1,
-0.6161457, -0.3258587, -0.8391724, 1, 0.1333333, 0, 1,
-0.6069311, -0.3203479, -0.8295438, 1, 0.1372549, 0, 1,
-0.5976342, -0.3148263, -0.819662, 1, 0.145098, 0, 1,
-0.5882562, -0.3092939, -0.8095301, 1, 0.1490196, 0, 1,
-0.5787985, -0.3037511, -0.7991511, 1, 0.1568628, 0, 1,
-0.5692622, -0.2981979, -0.7885283, 1, 0.1607843, 0, 1,
-0.5596488, -0.2926347, -0.7776648, 1, 0.1686275, 0, 1,
-0.5499594, -0.2870615, -0.7665641, 1, 0.172549, 0, 1,
-0.5401954, -0.2814786, -0.7552294, 1, 0.1803922, 0, 1,
-0.5303581, -0.2758861, -0.7436641, 1, 0.1843137, 0, 1,
-0.520449, -0.2702843, -0.731872, 1, 0.1921569, 0, 1,
-0.5104692, -0.2646734, -0.7198565, 1, 0.1960784, 0, 1,
-0.5004202, -0.2590534, -0.7076213, 1, 0.2039216, 0, 1,
-0.4903033, -0.2534247, -0.6951702, 1, 0.2117647, 0, 1,
-0.4801199, -0.2477873, -0.6825069, 1, 0.2156863, 0, 1,
-0.4698714, -0.2421416, -0.6696353, 1, 0.2235294, 0, 1,
-0.4595592, -0.2364877, -0.6565594, 1, 0.227451, 0, 1,
-0.4491846, -0.2308257, -0.6432831, 1, 0.2352941, 0, 1,
-0.4387491, -0.2251559, -0.6298105, 1, 0.2392157, 0, 1,
-0.4282541, -0.2194785, -0.6161457, 1, 0.2470588, 0, 1,
-0.417701, -0.2137937, -0.6022929, 1, 0.2509804, 0, 1,
-0.4070913, -0.2081016, -0.5882562, 1, 0.2588235, 0, 1,
-0.3964263, -0.2024024, -0.5740401, 1, 0.2627451, 0, 1,
-0.3857076, -0.1966964, -0.5596488, 1, 0.2705882, 0, 1,
-0.3749365, -0.1909837, -0.5450866, 1, 0.2745098, 0, 1,
-0.3641146, -0.1852645, -0.5303581, 1, 0.282353, 0, 1,
-0.3532433, -0.179539, -0.5154678, 1, 0.2862745, 0, 1,
-0.3423241, -0.1738075, -0.5004202, 1, 0.2941177, 0, 1,
-0.3313585, -0.16807, -0.4852198, 1, 0.3019608, 0, 1,
-0.3203479, -0.1623269, -0.4698714, 1, 0.3058824, 0, 1,
-0.3092939, -0.1565782, -0.4543796, 1, 0.3137255, 0, 1,
-0.2981979, -0.1508243, -0.4387491, 1, 0.3176471, 0, 1,
-0.2870615, -0.1450652, -0.4229847, 1, 0.3254902, 0, 1,
-0.2758861, -0.1393012, -0.4070913, 1, 0.3294118, 0, 1,
-0.2646734, -0.1335325, -0.3910736, 1, 0.3372549, 0, 1,
-0.2534247, -0.1277593, -0.3749365, 1, 0.3411765, 0, 1,
-0.2421416, -0.1219817, -0.358685, 1, 0.3490196, 0, 1,
-0.2308257, -0.1162, -0.3423241, 1, 0.3529412, 0, 1,
-0.2194785, -0.1104144, -0.3258587, 1, 0.3607843, 0, 1,
-0.2081016, -0.104625, -0.3092939, 1, 0.3647059, 0, 1,
-0.1966964, -0.09883205, -0.2926347, 1, 0.372549, 0, 1,
-0.1852645, -0.09303576, -0.2758861, 1, 0.3764706, 0, 1,
-0.1738075, -0.08723632, -0.2590534, 1, 0.3843137, 0, 1,
-0.1623269, -0.08143391, -0.2421416, 1, 0.3882353, 0, 1,
-0.1508243, -0.07562874, -0.2251559, 1, 0.3960784, 0, 1,
-0.1393012, -0.06982102, -0.2081016, 1, 0.4039216, 0, 1,
-0.1277593, -0.06401093, -0.1909837, 1, 0.4078431, 0, 1,
-0.1162, -0.05819866, -0.1738075, 1, 0.4156863, 0, 1,
-0.104625, -0.05238442, -0.1565782, 1, 0.4196078, 0, 1,
-0.09303576, -0.0465684, -0.1393012, 1, 0.427451, 0, 1,
-0.08143391, -0.04075081, -0.1219817, 1, 0.4313726, 0, 1,
-0.06982102, -0.03493183, -0.104625, 1, 0.4392157, 0, 1,
-0.05819866, -0.02911167, -0.08723632, 1, 0.4431373, 0, 1,
-0.0465684, -0.02329052, -0.06982102, 1, 0.4509804, 0, 1,
-0.03493183, -0.01746858, -0.05238442, 1, 0.454902, 0, 1,
-0.02329052, -0.01164605, -0.03493183, 1, 0.4627451, 0, 1,
-0.01164605, -0.005823123, -0.01746858, 1, 0.4666667, 0, 1,
-4.898425e-16, -2.449213e-16, -7.347638e-16, 1, 0.4745098, 0, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 374, 374);
gl.scissor(0, 0, 374, 374);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 1.905254;
var distance = 6.692123;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0, -0, -0 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -6.692123);
// ****** linestrip object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.LINE_STRIP, 0, 1080);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 374
};
var vpHeights = {
1: 374
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 374 && 0 <= coords.y && coords.y <= 374) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="examplecanvas" width="1" height="1"></canvas> 
<p id="exampledebug">
You must enable Javascript to view this page properly.</p>
<script>examplewebGLStart();</script>
<span><font size="-2">
click and drag to rotate the figure, use the mouse wheel or middle button to zoom.
</font></span>

---
### Selectable DataTable

In the default [DataTable]((http://shiny.rstudio.com/articles/datatables.html) provided by shiny, it is not possible to detect what row a user has selected by clicking on a row. To implement the reactive row selection feature i found a solution in a [google discussion group about shiny]((https://groups.google.com/forum/\\#!topic/shiny-discuss/_zNZMR2gHn0).

### Persistence
To store the parameters persistently across user sessions and application restarts, i selected a [mongoDB](http://www.mongodb.org) database hosted on [mongolab]((https://mongolab.com).  

### Links  
My toy application: http://skilchen.shinyapps.io/lissajous_playground  
The github repo: http://github.com/skilchen/lissajous_playground  

Please give it a try. 
Unfortunately on shinyapps.io my application occasionaly has very bad response times. I don't know why ...





