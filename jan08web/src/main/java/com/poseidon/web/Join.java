package com.poseidon.web;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poseidon.dao.MemberDAO;
import com.poseidon.dto.MemberDTO;

@WebServlet("/join")
public class Join extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Join() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("join.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 값 잡기
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pw = request.getParameter("pw1");

		
		MemberDTO dto = new MemberDTO();
		dto.setMid(id);
		dto.setMname(name);
		dto.setMpw(pw);
		
		if(dto.getMid() != null && dto.getMname() != null && dto.getMpw() != null) {
		MemberDAO dao = new MemberDAO();
		int result = dao.join(dto);
		
		if(result == 1) {
			response.sendRedirect("./login");
			System.out.println("작전 성공");
		} else {
			response.sendRedirect("./error");
			System.out.println("작전 실패");
		}
		}
		// db에 보내기
		
		// 정상적으로 데이터 입력 완료했다면 로그인 페이지,
		// 비정상이면 에러로
	}
}
