package com.ten.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;

import com.ten.conn.Conn;
import com.ten.user.QueryResult;

public class DaoQuery {

	public List<QueryResult> selectSno(int sno){
		List<QueryResult> list = null;
		try{
			list = new ArrayList<QueryResult>();
			String sql = "select * from student " +
					"where student.sno=?;";
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, sno);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				QueryResult qrs = new QueryResult();
				qrs.setSNo(rs.getInt("sno"));
				qrs.setSname(rs.getString("sname"));
				qrs.setSclass(rs.getString("sclass"));
				qrs.setSsex(rs.getString("ssex"));
				list.add(qrs);
			}
			
		}catch(Exception e){e.printStackTrace();}
		return list;
	}
	/*
	 * */
	public List<QueryResult> selectSname(String name){
		List<QueryResult> list = null;
		try{
			list = new ArrayList<QueryResult>();
			String sql = "select * from student " +
					"where student.sname=?;";
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, name);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				QueryResult qrs = new QueryResult();
				qrs.setSNo(rs.getInt("sno"));
				qrs.setSname(rs.getString("sname"));
				qrs.setSclass(rs.getString("sclass"));
				qrs.setSsex(rs.getString("ssex"));
				list.add(qrs);
			}
		}catch(Exception e){e.printStackTrace();}
		return list;
	}
	/*
	 * */
	public List<QueryResult> selectSclass(String _class){
		List<QueryResult> list = null;
		try{
			list = new ArrayList<QueryResult>();
			String sql = "select student.sno,sname,sclass,course.cno,cname,classroom from student,sc,course " +
					"where student.sno=sc.sno and sc.cno=course.cno and student.sclass=?;";
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, _class);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				QueryResult qrs = new QueryResult();
				qrs.setSNo(rs.getInt("sno"));
				qrs.setCNo(rs.getInt("cno"));
				qrs.setSname(rs.getString("sname"));
				qrs.setCname(rs.getString("cname"));
				qrs.setSclass(rs.getString("sclass"));
				qrs.setClassroom(rs.getString("classroom"));
				list.add(qrs);
			}
			
		}catch(Exception e){e.printStackTrace();}
		return list;
	}
	/*
	 * */
	public List<QueryResult> selectCno(int cno){
		List<QueryResult> list = null;
		try{
			list = new ArrayList<QueryResult>();
			String sql = "select * from student " +
					"where student.sno=?;";
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, cno);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				QueryResult qrs = new QueryResult();
				qrs.setSNo(rs.getInt("sno"));
				qrs.setCNo(rs.getInt("cno"));
				qrs.setSname(rs.getString("sname"));
				qrs.setCname(rs.getString("cname"));
				qrs.setSclass(rs.getString("sclass"));
				qrs.setClassroom(rs.getString("classroom"));
				qrs.setSsex("ssex");
				list.add(qrs);
			}
			
		}catch(Exception e){e.printStackTrace();}
		return list;
	}
	/*
	 * */
	public List<QueryResult> selectCname(String cname){
		List<QueryResult> list = null;
		try{
			list = new ArrayList<QueryResult>();
			String sql = "select * from student " +
					"where cname=?;";
			Connection conn = new Conn().getConn();
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, cname);
			ResultSet rs = pst.executeQuery();
			while(rs.next()){
				QueryResult qrs = new QueryResult();
				qrs.setSNo(rs.getInt("sno"));
				qrs.setCNo(rs.getInt("cno"));
				qrs.setSname(rs.getString("sname"));
				qrs.setCname(rs.getString("cname"));
				qrs.setSclass(rs.getString("sclass"));
				qrs.setClassroom(rs.getString("classroom"));
				list.add(qrs);
			}
			
		}catch(Exception e){e.printStackTrace();}
		return list;
	}

}
