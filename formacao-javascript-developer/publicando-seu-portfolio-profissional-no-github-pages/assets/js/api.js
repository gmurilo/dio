async function fetchProfileData() {
  var url = './data/profile.json';
  if ( window.location.hostname === '' ) {
    url = 'https://raw.githubusercontent.com/gmurilo/dio-desafio-github-primeiro-repositorio/main/formacao-javascript-developer/js-developer-portfolio/data/profile.json';
  }
  const response = await fetch(url)
  const profileData = await response.json()
  return profileData
}
