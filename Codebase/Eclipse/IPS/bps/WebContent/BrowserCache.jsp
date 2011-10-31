
<%
response.setHeader("Cache-Control","no-store");//Use to controll the cache of the page.
response.setHeader("Pragma","no-cache");        //Request the page to save the page context.
response.setDateHeader ("Expires", 0);           //Prevent caching and proxy server.

  %>

Cache deleted