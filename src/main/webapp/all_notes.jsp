<%@ page import="org.hibernate.Session" %>
<%@ page import="com.example.helper.FactoryProvider" %>
<%@ page import="org.hibernate.Query" %>
<%@ page import="com.example.entities.Note" %>
<%@ page import="java.util.List" %>
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
    <title>All notes: Note Taker</title>

</head>
<body>

<div class="container ">
    <%@include file="Navbar.jsp" %>
    <br>
    <h1 >All notes</h1>

    <div class="row">
       <div class="col-12">
           <%
               Session s= FactoryProvider.getFactory().openSession();
               Query q= s.createQuery("from Note");
               List<Note> list=q.list();
               for (Note note:list) {
                   %>
                        <div class="card mt-3" >
                        <img class="card-img-top m-4 mx-auto"   style="max-width:100px;"  src="Image/pencil.png" alt="Card image cap">
                         <div class="card-body px-5">
                         <h5 class="card-title"><%=note.getTitle()%></h5>
                          <p class="card-text">
                              <%=note.getContent()%>
                          </p>
                             <p><b class="text-primary"><%=note.getAddeddate()%></b></p>
                             <div class="container text-center mt-2">
                             <a href="DeleteServlet?note_id=<%=note.getId()%>" class="btn btn-danger">Delete</a>
                             <a href="edit.jsp?note_id=<%=note.getId()%>" class="btn btn-primary">Update</a>
                                 </div>
                                </div>
                                       </div>








                    <%


               }


               s.close();


           %>

       </div>
    </div>






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