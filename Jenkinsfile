 node("docker-test") {

     stage("Checkout"){
        checkout scm
     }
     stage("Build"){
         docker.withRegistry('', 'docker-login') {
            docker.build('pong645/php-sample').push('latest')
            }
         docker.withRegistry('', 'docker-login') {
            docker.build('pong645/php-sample').push(env.BUILD_NUMBER)
            }
     }
 }