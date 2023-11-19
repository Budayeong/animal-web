package home;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.jar.Attributes.Name;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class InfoDao {
	
	
			//MySQL 디비 연동 시작!!
			String id = "root";	
			String password = "111111";
			String url ="jdbc:mysql://localhost:3307/jspdb_e?characterEncoding=utf-8";
			
			//디비연동에 필요한 JDBC 클래스 선언
			Connection con = null;
			PreparedStatement pstmt =null;
			Statement vs = null;
			ResultSet rs = null;
			
			public void connect_cp() {
				//컨텍스트 객체 생성
				try {
					Context initctx = new InitialContext();
					//context.xml 접근
					Context envctx = (Context) initctx.lookup("java:/comp/env");
					
					//'jdbc/pool/ 이름의 커넥션 풀에 접근
					DataSource ds = (DataSource) envctx.lookup("jdbc/pool");
					//커넥션 풀로부터 커넥션 하나 빌려오기
					con = ds.getConnection();
					
					System.out.println("커넥션 풀로부터 디비 연결 성공!!");
					
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			public void connect() {
				try {
					//MySQL 드라이버 로딩
					Class.forName("com.mysql.jdbc.Driver");
					//디비 연결
					con = DriverManager.getConnection(url,id,password);
					System.out.println("디비 연결 완료");
				} catch (Exception e) {
						e.printStackTrace();
					}
			}
			
			public void disConnect() {
				if (con != null) {
					try {
						con.close();
					}
					catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if(pstmt != null) {
					try {
						pstmt.close();
					}
					catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if(rs != null) {
					try {
						rs.close();
					}
					catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			
			//입력된 데이터 저장 메소드
			public void insertAddr(InfoDo ado) {
				System.out.println("insertAddr() 처리 시작 !!");
				
				//디비 연결
				connect_cp();
				
				//SQL 처리 루틴...
				String sql = "insert into info (name, age, breed, sex, weight, characteristic, place)"
						+ " values (?,?,?,?,?,?,?)";
				//값이 5개니까 values 에 ?도 5개임
				
				try {
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, ado.getName());
					pstmt.setInt(2, ado.getAge());
					pstmt.setString(3, ado.getBreed());
					pstmt.setString(4, ado.getSex());
					pstmt.setString(5, ado.getWeight());
					pstmt.setString(6, ado.getCharacteristic());
					pstmt.setString(7, ado.getPlace());
					
					
					
					//sql문 실행: 테이블에 변화가 있으면 update임
					pstmt.executeUpdate();
					
					System.out.println("insertAddr() 처리 완료 ~~~~~");

					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				//디비 연결 종료
				disConnect();
				
			
			}
			
			//입력된 전체 데이터 가져오는 메소드
			public ArrayList<InfoDo> getAllAddr() {
				System.out.println("getAlladdr() 처리 시작!!");
				
				ArrayList<InfoDo> aList = new ArrayList<>();
				
				connect_cp();
				
				//sql 문 처리
				String sql = "select * from info";
				try {
					pstmt = con.prepareStatement(sql);
					
					rs = pstmt.executeQuery();
					while(rs.next()) {
						InfoDo temp = new InfoDo();
						temp.setNum(rs.getInt(1));
						temp.setName(rs.getString(2));
						temp.setAge(rs.getInt(3));
						temp.setBreed(rs.getString(4));
						temp.setSex(rs.getString(5));
						temp.setWeight(rs.getString(6));
						temp.setCharacteristic(rs.getString(7));
						temp.setPlace(rs.getString(8));
						
						aList.add(temp);
						
						
					}
					System.out.println("getAllAddr() 처리 완료 !!");
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				disConnect();
				
				return aList;
			}

			//전체 데이터에서 하나의 데이터 가져오기 (수정/삭제 위하여)
			public InfoDo getOneAddr(int num) {
				System.out.println("getOneAddr() 처리 시작 !");
				InfoDo ado = new InfoDo();
				connect_cp();
				
				//sql 처리
				String sql = "select * from info where num=?";
				
				try {
					
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					
					rs = pstmt.executeQuery();
					
					while(rs.next()) {
						ado.setNum(rs.getInt(1));
						ado.setName(rs.getString(2));
						ado.setAge(rs.getInt(3));
						ado.setBreed(rs.getString(4));
						ado.setSex(rs.getString(5));
						ado.setWeight(rs.getString(6));
						ado.setCharacteristic(rs.getString(7));	
						ado.setPlace(rs.getString(8));
					}
					
					System.out.println("getOneAddr() 처리 완료!!");
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				disConnect();
				
				return ado;
			}
			
			//선택된 데이터 수정하기
			public void modifyAddr(InfoDo ado) {
				
				System.out.println("modifyAddr() 처리 시작 !!");
				
				connect_cp();
				
				//sql 처리
				String sql = "update info set name=?,age=?,"
						+ "breed=?,sex=?, weight=?, characteristic=?, place=? where num=?";
				
				try {
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, ado.getName());
					pstmt.setInt(2, ado.getAge());
					pstmt.setString(3, ado.getBreed());
					pstmt.setString(4, ado.getSex());
					pstmt.setString(5, ado.getWeight());
					pstmt.setString(6, ado.getCharacteristic());
					pstmt.setString(7, ado.getPlace());
					pstmt.setInt(8, ado.getNum());
					
					pstmt.executeUpdate();
					System.out.println("modifyAddr() 처리 완료 !");
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				
				
				
				
				disConnect();
				
				
				
				
			}

			//선택된 데이터 삭제하기
			public void deleteAddr(int num) {
				System.out.println("deleteAddr() 처리 시작 !!");
				
				connect_cp();
				
				//sql 처리
				String sql = "delete from info where num=?";
				
				try {
					pstmt = con.prepareStatement(sql);				
					pstmt.setInt(1, num);
					
					pstmt.executeUpdate();
					System.out.println("deleteAddr() 처리 완료 !!");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				disConnect();
			}
			
			//검색된 데이터 
			public ArrayList<InfoDo> getSearch(String searchField, String searchText){
				
				//디비 연결
				connect_cp();
				
		        ArrayList<InfoDo> list = new ArrayList<InfoDo>();
		       
		        try{//실행
		           
		            String sql ="select * from info ";
		           
		            if(searchText != null && !searchText.equals("") ){
		                sql +="WHERE "+searchField.trim()+" LIKE '%"+searchText.trim()+"%' order by name";
		            }else{//모든 레코드 검색
		                sql +="order by name";
		            }
		            System.out.println("sql = " + sql);
					
					 vs = con.createStatement(); 
					 rs = vs.executeQuery(sql);
					 
		            
		            while(rs.next()){
		            	InfoDo vo = new InfoDo();
		               
		                vo.setNum(rs.getInt(1));
		                vo.setName(rs.getString(2));
		                vo.setAge(rs.getInt(3));
		                vo.setBreed(rs.getString(4));
		                vo.setSex(rs.getString(5));
		                vo.setWeight(rs.getString(6));
		                vo.setCharacteristic(rs.getString(7));	
		                vo.setPlace(rs.getString(8));
		               
		                list.add(vo);
		            }
		        }catch(Exception e){           
		            System.out.println("검색결과가 없습니다");         
		        }
		              
		        disConnect();
				
				
		        return list;
		    }  
			
			
			//데이터 정렬
			public ArrayList<InfoDo> getRange(String rangeField){
				
				//디비 연결
				connect_cp();
				
		        ArrayList<InfoDo> rlist = new ArrayList<InfoDo>();
		       
		        try{//실행
		           
		            String sql ="select * from info ";
		           
		            if(rangeField != null && !rangeField.equals("") ){
		                sql +="ORDER BY "+rangeField.trim()+"";
		            }else{//모든 레코드 검색
		                sql +="order by breed";
		            }
		            System.out.println("sql = " + sql);
					
					 vs = con.createStatement(); 
					 rs = vs.executeQuery(sql);
					 
		            
		            while(rs.next()){
		            	InfoDo vo = new InfoDo();
		               
		                vo.setNum(rs.getInt(1));
		                vo.setName(rs.getString(2));
		                vo.setAge(rs.getInt(3));
		                vo.setBreed(rs.getString(4));
		                vo.setSex(rs.getString(5));
		                vo.setWeight(rs.getString(6));
		                vo.setCharacteristic(rs.getString(7));	
		                vo.setPlace(rs.getString(8));
		               
		                rlist.add(vo);
		            }
		        }catch(Exception e){           
		            System.out.println("검색결과가 없습니다");         
		        }
		              
		        disConnect();
				
				
		        return rlist;
		    }  
			
			
			//회원가입 처리
			public int join(String userID, String userPassword, String userName, String userEmail) {
				//디비 연결
				connect_cp();
				
				String SQL = "INSERT INTO user VALUES (?,?,?,?)";
				try {
					PreparedStatement pstmt = con.prepareStatement(SQL);
					// 쿼리문의 ?안에 각각의 데이터를 넣어준다.
					pstmt.setString(1, userID);
					pstmt.setString(2, userPassword);
					pstmt.setString(3, userName);
					pstmt.setString(4, userEmail);
					
					return pstmt.executeUpdate();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return -1;
				
				
				
				
			}
			
			
			//로그인 처리
			public int login(String loginID, String loginPassword) {
				//디비 연결
				connect_cp();
				
				String SQL = "SELECT userPassword FROM user WHERE userID=?";
				try {
					pstmt = con.prepareStatement(SQL);
					
					pstmt.setString(1, loginID);
					rs = pstmt.executeQuery();
					System.out.println(SQL);
					
					if(rs.next()) {
						if(rs.getString(1).equals(loginPassword)) {
							return 1;
						}
						else
							return 0;
						
					}
					return -1;
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				return -2;
				
			}
			

			
				
			}
			

