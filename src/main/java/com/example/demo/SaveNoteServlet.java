package com.example.demo;


import com.example.entities.Note;
import com.example.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.hibernate.Session;
import org.hibernate.Transaction;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;


public class SaveNoteServlet  extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public SaveNoteServlet(){
        super();
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {



        try{
            String title=request.getParameter("title");
            String content=request.getParameter("content");
            Note note=new Note(title,content,new Date());
//            System.out.println(note.getId());


//            System.out.println(note.getId()+" :"+ note.getTitle());

             Session s= FactoryProvider.getFactory().openSession();
            Transaction  tx=s.beginTransaction();

             s.save(note);
            tx.commit();


             s.close();
                response.setContentType("text/html");
            PrintWriter out =response.getWriter();
            out.println(("<h1 style='text-align:center;'>Note is Added Successfully</h1>"));
            out.println(("<h1 style='text-align:center;'><a href='all_notes.jsp'>view all notes</a></h1>"));

        }catch (Exception e){
           e.printStackTrace();
        }



    }

}
