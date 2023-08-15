<%@ page import="org.hibernate.Session" %>
<%@ page import="com.example.helper.FactoryProvider" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="com.example.entities.Note" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet"/>
    <title>Insert title here </title>
</head>
<body>

<div class="container ">
    <%@include file="Navbar.jsp" %>
    <h1> Edit Your Note</h1>
    <br>
    <%
    int noteId=Integer.parseInt(request.getParameter("note_id").trim());
        Session s= FactoryProvider.getFactory().openSession();
        Note note=(Note)s.get(Note.class,noteId);



    %>

    <form action="UpdateServlet" method="post">
        <input value="<%=note.getId()%>"  name="noteId" type="hidden"/>
        <div class="form-group">
            <label for="exampleInputEmail1">Note title</label>
            <input  name="title" required type="text" class="form-control"
                 value="<%=note.getTitle()  %>"   id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter here">
        </div>

        <div class="form-group">
            <label>Note content</label>
            <textarea name="content" required id="content" placeholder="Enter your content here"
                      class="form-control" style="height:300px;"><%=note.getContent()  %></textarea>
        </div>

        <div class="container text-center">
            <button type="submit" class="btn btn-success">Save Your Note</button>

        </div>
    </form>


</div>



<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">

</script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">

</script>
</body>
</html>