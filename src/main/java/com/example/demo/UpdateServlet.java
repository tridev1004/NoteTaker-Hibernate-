package com.example.demo;

import com.example.entities.Note;
import com.example.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;
import java.util.Date;

public class UpdateServlet extends HttpServlet {

    private static final long serialVersionUID=1L;

    public UpdateServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      try{

         String title=req.getParameter("title");
         String content=req.getParameter("content");
          int noteId=Integer.parseInt(req.getParameter("noteId").trim());

          Session s= FactoryProvider.getFactory().openSession();
          Transaction tx=s.beginTransaction();
                Note note=s.get(Note.class,noteId);
                note.setTitle(title);
                note.setContent(content);
                note.setAddeddate(new Date());



          tx.commit();
          s.close();
          resp.sendRedirect("all_notes.jsp");




      }catch (Exception e){
       e.printStackTrace();
      }
    }
}
