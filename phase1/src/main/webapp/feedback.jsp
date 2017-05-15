<html>
  <head>
    <title>Suggestion page</title>
    <script>
      function onSubmit() {
        document.getElementById('demo-form').submit();
      }
    </script>
    <style>
      body {
        font-family: Helvetica, sans-serif;
      }
      .status-message {
        background-color: #5ff;
        margin-bottom: 10px;
        text-align: center;
      }
      textarea {
        margin: 10px 0;
        resize: none;
      }
    </style>
  </head>
  <body>
    <h3>Give us feedback on our new webpage!</h3>
    <% if ('true'.equals(request.getParameter('success'))) { %>
      <div class='status-message'>Thanks for the feedback!</div>
    <% } else if ('false'.equals(request.getParameter('success'))) { %>
      <div class='status-message'>There was an error.</div>
    <% }%>
    <form id='demo-form' action=''/feedback' method='POST'>
      Your comment <br><textarea name='feedback' cols='50' rows='5'></textarea><br>
      <!-- Replace this with your site key -->
      <button onClick='onSubmit'>Submit</button>
    </form>
  </body>
</html>
