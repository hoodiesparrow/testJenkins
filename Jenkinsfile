node {
    stage ('clone') {
        git branch: 'master', credentialsId: 'GithubIDTOKEN', url: 'https://github.com/hoodiesparrow/testJenkins.git'
    }

    stage ('docker build') {
        sh 'docker-compose down --rmi all' 
				sh 'docker-compose up -d --build' 
				sh 'docker rmi $(docker images -f "dangling=true" -q)'
    } 
}