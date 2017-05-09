<html>
<head>
  <title>Suggestion page</title>
  <script>
    function onSubmit() {
      document.getElementById("demo-form").submit();
    }
  </script>
</head>
<body>
<% if ("true".equals(request.getParameter("success"))) { %>
<div>Thanks for the feedback!</div>
<% } else if ("false".equals(request.getParameter("success"))) { %>
<div>There was an error.</div>
<% }%>
Send a suggestion:
<form id="demo-form" action="/feedback" method="POST">
  Enter your email address: <input type="text" name="email" style="width:250px"><br>
  Your comment: <br><textarea name="feedback" cols="50" rows="20"></textarea><br>
  <!-- Replace this with your site key -->
  <button onSubmit="onSubmit"> Submit </button>
</form>
</body>
</html>
