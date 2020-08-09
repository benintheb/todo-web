package kr.or.connect.todo.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.connect.todo.dao.TodoDao;
import kr.or.connect.todo.dto.TodoDto;

@WebServlet("/main")
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TodoDao todoDao = new TodoDao();
		List<TodoDto> listTodo = todoDao.getTodos();
		
		ArrayList<Long> todo = new ArrayList<>();
		ArrayList<Long> doing = new ArrayList<>();
		ArrayList<Long> done = new ArrayList<>();
		
		for(int i = 0; i < listTodo.size(); i++){
			if(listTodo.get(i).getType().equals("TODO")) {
				todo.add(listTodo.get(i).getId() - 1);
			}
			else if(listTodo.get(i).getType().equals("DOING")) {
				doing.add(listTodo.get(i).getId() - 1);
			}
			else if(listTodo.get(i).getType().equals("DONE")) {
				done.add(listTodo.get(i).getId() - 1);
			}
		}
		
		request.setAttribute("todoList", listTodo);
		request.setAttribute("todoIds", todo);
		request.setAttribute("doingIds", doing);
		request.setAttribute("doneIds", done);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/main.jsp");
        requestDispatcher.forward(request, response);
	}
}
