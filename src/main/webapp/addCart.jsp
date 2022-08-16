<%@page import="vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//상품 주문 처리
	//선택한 id 받음
	String id = request.getParameter("id");
	
	//상품 리스트에 상품을 넣음
	
	ProductRepository dao = ProductRepository.getInstance();
	ArrayList<Product> goodList = dao.getAllProducts();		//상품 리스트 생성
	Product good = new Product();
	
	//해당 아이디와 일치하는 목록에 있는 상품 객체
	for(int i=0; i<goodList.size(); i++){
		good = goodList.get(i);
		if(good.getProductId().equals(id)){		//목록에 있는 상품과 전달된 id가 같으면
			break;								//빠져나옴
		}
	}
	
	//장바구니에 저장할 리스트 생성하고 세션 발급
	ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartList");
	if(list == null){
		list = new ArrayList<>();					//장바구니
		session.setAttribute("cartList", list);		//세션 발급
	}
	
	int cnt = 0;	//장바구니 품목의 개수
	Product goodsQnt = new Product();	//장바구니에 있는 품목
	
	for(int i=0; i<list.size(); i++){
		goodsQnt = list.get(i);
		if(goodsQnt.getProductId().equals(id)){
			cnt++;								//해당 아이디와 같은 품목이면 1증가
			int orderQuantity = goodsQnt.getQuantity() + 1;	//주문 수량 합계
			goodsQnt.setQuantity(orderQuantity);
		}
	}
	
	if(cnt == 0){
		good.setQuantity(1);	//추가 수량 1
		list.add(good);
	}
	
	//페이지 이동 - 현재 상세 페이지
	response.sendRedirect("./product.jsp?id=" + id);
	
%>