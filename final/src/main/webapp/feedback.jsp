<!DOCTYPE html>
<html>
  <head>
    <title>Suggestion page</title>
    <script src='https://www.google.com/recaptcha/api.js'></script>
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
     <% if (Boolean.TRUE.equals(request.getAttribute("success"))) { %>
         <div class='status-message'>Thanks for the feedback!</div>
       <% } else if (Boolean.FALSE.equals(request.getAttribute("success"))) { %>
         <div class='status-message'>There was an error.</div>
       <% }%>
    <form id='demo-form' action='/feedback' method='POST'>
      Your comment <br><textarea name='feedback' cols='50' rows='5'></textarea><br>
      <!-- Replace this with your site key -->
      <button class='g-recaptcha'
              data-sitekey='6LfeHx4UAAAAAAKUx5rO5nfKMtc9-syDTdFLftnm'
              data-callback='onSubmit'> Submit </button>
    </form>
  </body>
</html>
