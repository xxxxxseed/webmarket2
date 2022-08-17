package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.common.JDBCUtil;

import vo.Product;

public class ProductRepository {

	private ArrayList<Product> listOfProducts = new ArrayList<>();
	//싱글톤 패턴으로 객체 생성
	private static ProductRepository instance;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//생성자
	private ProductRepository() {
		//DB 연동전 테스트 용도
		/*Product phone = new Product("P1234", "iphone 6s", 800000);
		phone.setDescription("4.7-inch 1334X750 Retina HD display 8-megapixel "
					+ "iSight Camera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
		phone.setFilename("P1234.png");
		
		Product notebook = new Product("P1235", "LG PC 그램", 1500000);
		notebook.setDescription("13.3-inch IPS LED display, 5th Generation Intel Core processors");
		notebook.setCategory("Notebook");
		notebook.setManufacturer("LG");
		notebook.setUnitsInStock(1000);
		notebook.setCondition("Refurbished");
		notebook.setFilename("P1235.png");
		
		Product tablet = new Product("P1236", "Galaxy Tab5", 600000);
		tablet.setDescription("212.8X125.6X6.6cm, SuperAMOLED display, Octa-Core processor");
		tablet.setCategory("Tablet");
		tablet.setManufacturer("Samsung");
		tablet.setUnitsInStock(1000);
		tablet.setCondition("Old");
		tablet.setFilename("P1236.png");
		
		listOfProducts.add(phone);		//리스트에 phone을 추가
		listOfProducts.add(notebook);
		listOfProducts.add(tablet);*/
	}
	
	//싱글톤 패턴의 getInstance() 정의
	public static ProductRepository getInstance() {
		if(instance == null) {
			instance = new ProductRepository();
		}
		return instance;
	}
	
	//상품 추가
	public void addProduct(Product product) {
		listOfProducts.add(product);
	}
	
	//목록 보기
	public ArrayList<Product> getAllProducts(){
		try {
			conn = JDBCUtil.getConnection();
			String sql = "SELECT * FROM product";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Product product = new Product();
				product.setProductId(rs.getString("p_id"));
				product.setPname(rs.getString("p_name"));
				product.setUnitPrice(rs.getInt("p_unitPrice"));
				product.setDescription(rs.getString("p_description"));
				product.setCategory(rs.getString("p_category"));
				product.setManufacturer(rs.getString("p_manufacturer"));
				product.setUnitsInStock(rs.getLong("p_unitsInStock"));
				product.setCondition(rs.getString("p_condition"));
				product.setFilename(rs.getString("p_productImage"));
				//System.out.println(product.getFilename());
				listOfProducts.add(product);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, rs);
		}
		return listOfProducts;
	}
	
	//상세 보기
	public Product getProductById(String productId) {
		Product productById = null;		//이름이 다른 객체 선언
		for(int i=0; i<listOfProducts.size(); i++) {
			Product product = listOfProducts.get(i);
			String dbProductId = product.getProductId();	//이미 등록된 id
			if(dbProductId.equals(productId)) {				//외부에서 전달된 id와 같으면
				productById = product;						//아이디가 같은 상품을 저장
				break;
			}
		}
		return productById;
	}
	
}
