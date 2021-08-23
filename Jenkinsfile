node {
  git branch: 'main', url: 'https://github.com/SiwatINC/homebridge_gui'
  docker.withRegistry("https://ghcr.io/v2") {
      docker.build("siwatinc/homebridge_gui:latest").push()
  }
}
