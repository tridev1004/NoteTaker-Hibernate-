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

public class DeleteServlet extends HttpServlet {

    public static final long serialVersionUID=1L;

    public DeleteServlet(){
        super();
    }



    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
         try {
                 int noteID=Integer.parseInt(req.getParameter("note_id").trim());

             Session  s= FactoryProvider.getFactory().openSession();
             Transaction tx=s.beginTransaction();
            Note note=(Note)s.get(Note.class,noteID);
            s.delete(note);
            tx.commit();
            s.close();
            resp.sendRedirect("all_notes.jsp");


         }catch (Exception e){

         }
    }
}
