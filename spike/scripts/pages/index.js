
$(document).ready(function() {

  var scene = new THREE.Scene();
  var camera = new THREE.PerspectiveCamera( 70, window.innerWidth / window.innerHeight, 0.1, 1000 );
  var renderer = new THREE.WebGLRenderer();

  var cubeList = [];
  renderer.setSize( window.innerWidth, window.innerHeight );
  document.body.appendChild( renderer.domElement );


  function createSkyBox()
  {
    var urlPrefix = "assets/";
    var urls = [ urlPrefix + "left.jpg", urlPrefix + "right.jpg",urlPrefix + "ceiling.jpg", urlPrefix + "floor.jpg",urlPrefix + "back.jpg", urlPrefix + "front.jpg" ];
    var textureCube = THREE.ImageUtils.loadTextureCube( urls );
    /*
    var shader  = THREE.ShaderUtils.lib["cube"];
    shader.uniforms["tCube"].texture = textureCube;
    var material = new THREE.ShaderMaterial({
      fragmentShader  : shader.fragmentShader,
      vertexShader  : shader.vertexShader,
      uniforms  : shader.uniforms
    });
    */
    //var material = new THREE.MeshBasicMaterial( { color: 0x00ff00 } );

    skyboxMesh  = new THREE.Mesh( new THREE.BoxGeometry( 100000, 100000, 100000, 1, 1, 1, null, true ), material );
    scene.add( skyboxMesh );
  }

  function createFloor(){
    var geometry = new THREE.PlaneGeometry( 50, 50, 10,10 );

    //var material = new THREE.MeshLambertMaterial({map: THREE.ImageUtils.loadTexture("assets/floor.jpg")})

    var material = new THREE.MeshLambertMaterial( {color: 0xffff00, side: THREE.DoubleSide} );
    var plane = new THREE.Mesh( geometry, material );
    plane.rotation.x = 90;
    plane.rotation.y = 0;
    plane.rotation.z = 0;
    plane.position.set(0,0,0);
    scene.add( plane );
  }

  function createScene()
  {

    createLight();
    createCubes();
    createFloor();
    createCamera();
  }

  function createCamera()
  {
    camera.rotation.set(0,0,0);
    camera.position.set(0,0,25);
    cameraControls();
  }


  function cameraControls()
  {
    $(document).keydown(function(e) {
      console.log(e.which);
    switch(e.which) {

        case 65: // a -- in to the screen
          camera.rotation.x +=0.1;
        break;

        case 83: // s -- out to the screen
          camera.rotation.x -=0.1;
        break;


        case 32: // space
          camera.position.z--;
        break;

        case 37: // left
          camera.position.x--;
        break;

        case 38: // up
          camera.position.y++;
        break;

        case 39: // right
        camera.position.x++;
        break;

        case 40: // down
          camera.position.y--;
        break;

        default: return; // exit this handler for other keys
    }
    e.preventDefault(); // prevent the default action (scroll / move caret)
    });
  }
  function createLight()
  {
    var light = new THREE.PointLight(0xffffff);
    light.position.set(0,10,10);
    scene.add(light);
  }


  function createCubes()
  {

   // var light = new THREE.AmbientLight( 0x404040 ); // soft white light
   // scene.add( light );

    var geometry = new THREE.BoxGeometry(1,1,1);
    var material = new THREE.MeshLambertMaterial( { color: 0xff0000} );
    var cube = new THREE.Mesh( geometry, material );
    cube.position.set(0,0,0)
    scene.add( cube );


    cubeList.push(cube);
    var geometry2 = new THREE.BoxGeometry(1,1,1);
    var material2 = new THREE.MeshLambertMaterial( { color: 0x00ff000 } );
    var cube2 = new THREE.Mesh( geometry2, material2 );
    cube2.position.set(0,3,-3)
    scene.add( cube2 );
    cubeList.push(cube2);


    var geometry3 = new THREE.BoxGeometry(1,1,1);
    var material3 = new THREE.MeshLambertMaterial( { color: 0x0000ff } );
    var cube3 = new THREE.Mesh( geometry3, material3 );
    cube3.position.set(3,3,-3)
    scene.add( cube3 );
    cubeList.push(cube3);
  }


  function render() {
    requestAnimationFrame(render);
    update()
    renderer.render(scene, camera);
  }

  function update(){
    for(var i = 0; i < cubeList.length; ++i)
    {
      cubeList[i].rotation.x += 0.03;
      cubeList[i].rotation.y += 0.03;
    }

  }


  createScene();
  render();

});