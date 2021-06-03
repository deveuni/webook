package com.webook.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.webook.domain.GoodsVO;
import com.webook.service.GoodsService;

@Controller
@RequestMapping(value = "/goods/*")
public class GoodsController {

	private static final Logger log =
			LoggerFactory.getLogger(GoodsController.class);
	
	/* 서비스 처리 객체 주입 */
	@Inject
	private GoodsService service;
	
	/* 상품 등록 */
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String goodsRegisterGET() throws Exception {
		
		log.info("get goods register");
		
		return "/goods/goodsRegister";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String goodsRegisterePOST(GoodsVO vo) throws Exception {
		
		// 상품 등록 서비스 
		service.goodsRegister(vo);
		
		System.out.println("C 상품등록완료 : " + vo );
		
		return "redirect:/goods/list";
	}
	
	/* 상품 목록 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String goodsListGET(Model model) throws Exception {
		
		log.info("get goods list");
		
		List<GoodsVO> list = service.goodsList();
		
		model.addAttribute("list", list);
		
		return "/goods/goodsList";
		
	}
	
	/* 상품 상세페이지 */
	@RequestMapping(value = "/detail", method = { RequestMethod.GET, RequestMethod.POST })
	public String goodsDetailGET(@RequestParam("gdsNum") int gdsNum, Model model, HttpSession session) throws Exception {
		
		log.info("get goods detail");
		
		// 아이디 세션값
		model.addAttribute("userId", (String) session.getAttribute("userId"));
		
		GoodsVO goods = service.goodsDetail(gdsNum);
		
		model.addAttribute("goods", goods);
		
		return "/goods/goodsDetail";
	}
	
	/* 상품 수정 */
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String goodsModifyGET(@RequestParam("gdsNum") int gdsNum, Model model, HttpSession session) throws Exception {
		
		log.info("get goods modify");
		
		// 아이디 세션값
		model.addAttribute("userId", (String) session.getAttribute("userId"));
		
		// 상품 수정 페이지 입력된 값 서비스
		model.addAttribute("goods", service.goodsDetail(gdsNum));
		
		return "/goods/goodsModify";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String goodsModifyPOST(GoodsVO vo) throws Exception {
		
		log.info("post goods modify");
		
		// 상품 수정 서비스 호출
		service.goodsModify(vo);
		
		return "redirect:/goods/list";
	}
	
	/* 상품 삭제 */
	@RequestMapping(value = "/delete", method = {RequestMethod.GET, RequestMethod.POST})
	public String goodsDeletePOST(@RequestParam("gdsNum") int gdsNum, Model model, RedirectAttributes rttr) throws Exception {
		
		// 상품 삭제 서비스 호출
		service.goodsDelete(gdsNum);
		
		return "redirect:/goods/list";
	}
	
	/* ck에디터 이미지 업로드 */
	@RequestMapping(value = "/ckUpload", method = RequestMethod.POST)
	public void imageUpload(HttpServletRequest request, HttpServletResponse response,
			MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload) throws Exception {

		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();

		OutputStream out = null;
		PrintWriter printWriter = null;

		// 인코딩
		response.setContentType("text/html;charset=utf-8");

		try {

			// 파일 이름 가져오기
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();

			// 이미지 경로 생성
			String path = "C:\\mp\\file\\";// fileDir는 전역 변수라 그냥 이미지 경로 설정해주면 된다.
			String ckUploadPath = path + uid + "_" + fileName;
			File folder = new File(path);

			// 해당 디렉토리 확인
			if (!folder.exists()) {
				try {
					folder.mkdirs(); // 폴더 생성
				} catch (Exception e) {
					e.getStackTrace();
				}
			}

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

			String callback = request.getParameter("CKEditorFuncNum");
			printWriter = response.getWriter();
			String fileUrl = "ckImgSubmit?uid=" + uid + "&fileName=" + fileName; // 작성화면

			// 업로드시 메시지 출력
			printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
			printWriter.flush();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return;
	}

	@RequestMapping(value = "/ckImgSubmit")
	public void ckSubmit(@RequestParam(value = "uid") String uid, @RequestParam(value = "fileName") String fileName,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 서버에 저장된 이미지 경로
		String path = "C:\\mp\\file\\";

		String sDirPath = path + uid + "_" + fileName;

		File imgFile = new File(sDirPath);

		// 사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
		if (imgFile.isFile()) {
			byte[] buf = new byte[1024];
			int readByte = 0;
			int length = 0;
			byte[] imgBuf = null;

			FileInputStream fileInputStream = null;
			ByteArrayOutputStream outputStream = null;
			ServletOutputStream out = null;

			try {
				fileInputStream = new FileInputStream(imgFile);
				outputStream = new ByteArrayOutputStream();
				out = response.getOutputStream();

				while ((readByte = fileInputStream.read(buf)) != -1) {
					outputStream.write(buf, 0, readByte);
				}

				imgBuf = outputStream.toByteArray();
				length = imgBuf.length;
				out.write(imgBuf, 0, length);
				out.flush();

			} catch (IOException e) {
				System.out.println(e);
			}
		}
	}
	// ck 이미지 업로드
	

	/**/
	/**/
	/**/
	/**/
	/**/
	/**/
	/**/
	
	
}
