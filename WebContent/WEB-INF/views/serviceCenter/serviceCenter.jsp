<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<h5>

<div class="text-center">
<br><br><br><br><br><br>
안녕하세요 방캅스 입니다.<br>
FAQ를 확인 후 그 외에 궁금한 사항을<br>
1:1로 문의해 주시면, <br>
성실하게 답변도움 드리겠습니다.<br>
<br>
<br>

<div onclick="location.href='/main/community/board?boardno=5'" style="cursor:pointer">
<strong><u>▶FAQ 확인하기</u></strong><br>
</div>


<br>
<br>
신고에 대한 이의 사항은 <Strong>bangcops@gmail.com</Strong>으로<br>
그 외에 사항은 하단의 채팅창으로 문의해주세요<br>


<!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var d = window.document;
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "5a9af9c3-4027-46d1-816f-3a08ac8fc945"
  });
</script>
<!-- End Channel Plugin -->


</div>
<br>
</h5>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />   



