package com.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.TodoDao;
import com.database.DBConnection;

@WebServlet("/add_todo")
public class AddServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String username = req.getParameter("username");
		String todo = req.getParameter("todo");
		String status = req.getParameter("status");

		TodoDao dao = new TodoDao(DBConnection.getConn());
		
		HttpSession session = req.getSession();
		boolean f = false;
		try {
			f = dao.addTodo(username, todo, status);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		if(f) {
			session.setAttribute("sucMsg", "Todo added successfully");
			resp.sendRedirect("index.jsp");
		}
		else {
			session.setAttribute("failedMsg", "Something went wrong on server");
			resp.sendRedirect("index.jsp");
		}
	}
	
	
	
}

	