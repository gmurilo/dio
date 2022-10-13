function resizeme() {
  let $obj = document.getElementById('thumb-video-block');
  let $iframe = $obj.parentNode.querySelector('iframe');
  $iframe.setAttribute("width", $iframe.parentNode.offsetWidth) 
  $iframe.setAttribute("height", parseInt( ( $iframe.parentNode.offsetWidth / 16 ) * 9) ) ;
}
function video_thumbs () {
  let $videos = [
    {
      "href": "https://youtu.be/PkEpHoXUkeM",
      "img" : "video_thumbs/thumb1.png",
      "title": "Geração Tech Unimed - BH - Ciência de Dados",
      "channel": "DigitalInnovationOne",
      "views": "2,1 mil",
      "time" : "há 2 dias"
    },
    {
      "href": "https://youtu.be/0kpfMxtX7M4",
      "img" : "video_thumbs/thumb2.png",
      "title": "Scrum Talks",
      "channel": "DigitalInnovationOne",
      "views": "1,6 mil",
      "time" : "há 3 dias"
    },
    {
      "href": "https://youtu.be/Ru9AyUPSNPk",
      "img" : "video_thumbs/thumb3.png",
      "title": "Machine Learning Avançado - Fast Track",
      "channel": "DigitalInnovationOne",
      "views": "1,7 mil",
      "time" : "há 5 dias"
    },
    {
      "href": "https://youtu.be/gTYMAoX_27c",
      "img" : "video_thumbs/thumb4.png",
      "title": "Global Skills #2 - Project Planning",
      "channel": "DigitalInnovationOne",
      "views": "971",
      "time" : "há 5 dias"
    },
    {
      "href": "https://youtu.be/LWyxFrwSGoM",
      "img" : "video_thumbs/thumb5.png",
      "title": "Como aprender a programar Python do ZERO",
      "channel": "DigitalInnovationOne",
      "views": "711",
      "time" : "há 6 dias"
    },
    {
      "href": "https://youtu.be/anjXJPK5lzc",
      "img" : "video_thumbs/thumb6.jpg",
      "title": "Como conquistar sua vaga em Dubai | Hacking Dubai Tech",
      "channel": "DigitalInnovationOne",
      "views": "662",
      "time" : "há 1 dia"
    },
    {
      "href": "https://youtu.be/LWyxFrwSGoM",
      "img" : "video_thumbs/thumb7.jpg",
      "title": "Aprenda desenvolvimento web com a NTT DATA",
      "channel": "DigitalInnovationOne",
      "views": "2,1 mil",
      "time" : "há 1 dia"
    },
    {
      "href": "https://youtu.be/LWyxFrwSGoM",
      "img" : "video_thumbs/thumb8.jpg",
      "title": "Carreira SRE | Aceleração DevOps com Confiabilidade (SRE) #TQI",
      "channel": "DigitalInnovationOne",
      "views": "1,2 mil",
      "time" : "há 2 dias"
    }

  ];
  let $obj = document.getElementById('thumb-video-block');

  let $html = '';  
  for( $i = 0; $i < $videos.length; $i++ ) {
    $html += "<div class='thumb-video'><a href='' target='_blank'>";
    $html += "<img src='./assets/images/"+$videos[$i].img+"' alt='"+$videos[$i].title+"' class='video-thumb'/>";
    $html += "<div class='video-info'>";
    $html += "<img src='./assets/images/channel.png' title='dio' /><h2>"+$videos[$i].title+"</h2></div>";
    $html += "<p>"+$videos[$i].views+" visualiza&ccedil;&otilde;es<br/>Transmitido "+$videos[$i].time+"</p>";
    $html += "</div></a></div>";
  }
  $obj.innerHTML = $html;
  resizeme();
};

window.addEventListener('DOMContentLoaded', video_thumbs, false);
window.addEventListener('resize', resizeme, false);
