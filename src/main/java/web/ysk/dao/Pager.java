package web.ysk.dao;

import web.ysk.vo.PageVO;

public class Pager {
	//pager
	//한테이블당 게시물 갯수
	private static final int displayRow = 7;
	//한번에 나타낼 페이저의 수 예) 12345
	private static final int pageCount = 5;
	int rowCount = 0;
	public Pager(int rowCount) {
		this.rowCount= rowCount;
	}
	//계산
	public PageVO pageCal(){
		//특정 ROW 기준으로하는 현재 페이지
		// ex) 19/7 >>2 5/7 >> 3페이지의 위에서 5번째의 게시물이 되어야함
		// 2.xxxx 올림 3
		// 이게지금 문제
		int currentPage = (int)Math.ceil((double)rowCount/displayRow);
		
		// 현재페이지에서의 게시물 시작위치
		// ex) 19/7 >> 2.xxxx >> (3-1)*7 >> 14가 0값
		int offset = (currentPage - 1) * displayRow;
		
		
		// 13페이지면 11페이지가 시작페이지가 되고 15페이지가 마지막이되게함
		int startPage = (currentPage - 1) / pageCount * pageCount + 1; 
		int endPage  = startPage + pageCount - 1;	
		
		//마지막 페이지 = 7 -> (33 / 5) + 1 = 6 + 1 = 7
		// 총 리스트 개수를 화면에 보여줄 개수로 mod 연산했을때 딱 맞아떨어진다면 마지막 페이지에서 -1 해줌 딱맞아 떨어지는 경우 마지막에 빈페이지가 나오기 때문
		int lastPage = (rowCount / displayRow) + 1;
		if(rowCount % displayRow == 0){
			lastPage--;
		}
		//현재 페이징 구간의 마지막 페이지가 실제 마지막 페이지보다 크다면 실제 마지막 페이지로 치환 시켜줌
		//실제 데이터는 7페이지까지 있으나 pageCount를 5로 설정했다면 최초 계산시 마지막 페이지는 5의 배수로 나오기 때문에 (6 ~ 10페이지) 6 7 8 9 10
		//실제 데이터가 있는 마지막 페이지로 치환하기 위함 10 -> 7 치환
		if(endPage > lastPage){
			endPage = lastPage;
		}
		
		int indexOfPage = endPage / pageCount ;
		
		PageVO pagerData = new PageVO();
		pagerData.setCurrentPage(currentPage);
		pagerData.setEndPage(endPage);
		pagerData.setStartPage(startPage);
		pagerData.setLastPage(lastPage);
		pagerData.setPageCount(pageCount);
		pagerData.setRowCount(rowCount);
		pagerData.setDisplayRow(displayRow);
		pagerData.setOffset(offset);
		pagerData.setIndexOfPage(indexOfPage);
		return pagerData;
		
		//13/5
	}
}
