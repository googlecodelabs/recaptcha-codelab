/**
 * Copyright 2017 Google Inc. All Rights Reserved.
 * <p>
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * <p>
 * http://www.apache.org/licenses/LICENSE-2.0
 * <p>
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
//[START all]
package com.example.feedback;


import org.json.JSONObject;
import org.json.JSONTokener;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

public class FeedbackServlet extends HttpServlet {
  @Override
  public void doGet(HttpServletRequest req, HttpServletResponse resp)
          throws IOException, ServletException {
    req.getRequestDispatcher("/feedback.jsp").forward(req, resp);
  }

  @Override
  public void doPost(HttpServletRequest req, HttpServletResponse resp)
          throws IOException, ServletException {
    req.setAttribute("success", true);
    req.getRequestDispatcher("/feedback.jsp").forward(req, resp);
  }

  private JSONObject postAndParseJSON(URL url, String postData) throws IOException {
    HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
    urlConnection.setDoOutput(true);
    urlConnection.setRequestMethod("POST");
    urlConnection.setRequestProperty(
            "Content-Type", "application/x-www-form-urlencoded");
    urlConnection.setRequestProperty(
            "charset", StandardCharsets.UTF_8.displayName());
    urlConnection.setRequestProperty(
            "Content-Length", Integer.toString(postData.length()));
    urlConnection.setUseCaches(false);
    urlConnection.getOutputStream()
            .write(postData.getBytes(StandardCharsets.UTF_8));
    JSONTokener jsonTokener = new JSONTokener(urlConnection.getInputStream());
    return new JSONObject(jsonTokener);
  }

  private StringBuilder addParam(
          StringBuilder postData, String param, String value)
          throws UnsupportedEncodingException {
    if (postData.length() != 0) {
      postData.append("&");
    }
    return postData.append(
            String.format("%s=%s",
                    URLEncoder.encode(param, StandardCharsets.UTF_8.displayName()),
                    URLEncoder.encode(value, StandardCharsets.UTF_8.displayName())));
  }
}