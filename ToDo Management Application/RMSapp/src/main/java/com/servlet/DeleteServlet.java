package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.TodoDao;
import com.database.DBConnection;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		
		TodoDao dao = new TodoDao(DBConnection.getConn());
		boolean f = dao.deleteTodo(id);
		HttpSession session = req.getSession();
		if(f)
		{ 
			session.setAttribute("sucMsg", "Todo deleted successfully");
			resp.sendRedirect("index.jsp");
		}else {
			session.setAttribute("failedMsg", "Something went wrong on server");
			resp.sendRedirect("index.jsp");
		}
	}
	
}
