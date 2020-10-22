package me.zw.mvc.controller;

import lombok.extern.slf4j.Slf4j;
import me.zw.mvc.board.BoardVO;
import me.zw.mvc.board.impl.BoardDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
public class InsertBoardController implements Controller{

    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
        log.info("글 등록 처리");

        // 1. 사용자 입력 정보 추출
        String title = request.getParameter("title");
        String writer = request.getParameter("writer");
        String content = request.getParameter("content");

        // 2. DB 연동 처리
        BoardVO vo = new BoardVO();
        vo.setTitle(title);
        vo.setWriter(writer);
        vo.setContent(content);
        BoardDAO boardDAO = new BoardDAO();
        boardDAO.insertBoard(vo);

        return "getBoardList.do";
    }
}