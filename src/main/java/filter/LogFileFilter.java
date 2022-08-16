package filter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LogFileFilter implements Filter{
	
	PrintWriter writer;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		String filename = filterConfig.getInitParameter("filename");	//xml param
		
		if(filename == null) {
			throw new ServletException("로그 파일의 이름을 찾을 수 없습니다.");	//강제로 예외 발생시킴
		}
		
		try {
			writer = new PrintWriter(new FileWriter(filename, true), true);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		writer.println("클라이언트 IP: " + request.getRemoteAddr());
		writer.println("접근한 URL 경로: " + getURLPath(request));
		writer.println("요청 시각: " + getCurrentTime());
		
		chain.doFilter(request, response);	//실행
	}
	
	private String getURLPath(ServletRequest request) {
		HttpServletRequest req = null;
		String currentPath = "";		//현재 경로
		String queryString = "";
		if(request instanceof HttpServletRequest) {
			req = (HttpServletRequest) request;	//다운 캐스팅(형변환)
			currentPath = req.getRequestURI();	//정확한(직접) 주소
			queryString = req.getQueryString();
			//파라미터가 있으면 쿼리스트링을 출력하고 없으면 공백을 출력
			queryString = queryString == null ? "": "?" + queryString;
		}
		return currentPath + queryString;
	}

	private String getCurrentTime() {
		DateFormat formatter = new SimpleDateFormat("yyyy:MM:dd HH:mm:ss");
		Calendar calendar = Calendar.getInstance();
		calendar.setTimeInMillis(System.currentTimeMillis());	//현재 시간 설정
		return formatter.format(calendar.getTime());
	}

	@Override
	public void destroy() {
		writer.close();
	}
}
