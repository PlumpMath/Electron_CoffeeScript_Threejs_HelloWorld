class BoardController
  constructor: (@containerId, @assets) ->
    alert "the board controller is" + @containerId + @assets
  drawboard: -> 
    alert "drawing board" + @containerId + @assets

class Game
  constructor: (@containerId, @assets) ->
    alert "game" + @containerId + @assets
    bc = new BoardController(@containerId, @assets)
    bc.drawboard()

class Checkers
  @containerId = document.getElementById('boardContainer')
  @assetsId = '3d_assets/'
  @game = new Game(@containerId, @assetsId)

window.onload = ->
  scene = new THREE.Scene()
  alert "scene is" + scene
  boxGeometry = new THREE.BoxGeometry(1, 1, 1)
  boxMaterial = new THREE.MeshBasicMaterial({
    color: 0xFF0000
  })
  box = new THREE.Mesh(boxGeometry, boxMaterial)
  scene.add(box)
  camera = new THREE.PerspectiveCamera(
    50,
    window.innerWidth / window.innerHeight,
    0.1,
    2000)
  camera.position.z = 5
  renderer = new THREE.WebGLRenderer()
  renderer.setSize(window.innerWidth, window.innerHeight)
  document.body.appendChild(renderer.domElement)  
  render = -> 
    requestAnimationFrame(render)
    renderer.render(scene, camera)
    box.rotation.x += .01
    box.rotation.y += .01
  render()
c = new Checkers()