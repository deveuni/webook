package com.webook.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.webook.domain.CartListVO;
import com.webook.domain.CartVO;
import com.webook.domain.Criteria;
import com.webook.domain.GoodsVO;
import com.webook.domain.MemberVO;
import com.webook.domain.OrderDetailVO;
import com.webook.domain.OrderListVO;
import com.webook.domain.OrderVO;
import com.webook.domain.PageMaker;
import com.webook.domain.ReplyListVO;
import com.webook.domain.ReplyVO;
import com.webook.service.ShopService;

@Controller
@RequestMapping("/shop/*")
public class ShopController {
	
	@Inject
	private ShopService service;
	@Inject
	private static final Logger log = LoggerFactory.getLogger(ShopController.class);

	
	/* 상품 목록 + 카테고리 분류 + 페이징처리 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String getGoodsList(Model model, HttpSession session, @ModelAttribute("cri") Criteria cri, String category) throws Exception {
		
		log.info("get goods list");
		
		// id 세션값
		model.addAttribute("userId", (String) session.getAttribute("userId"));
		
		// 상품 목록
		//List<GoodsVO> list = service.goodsList();
		//model.addAttribute("list", list);
		
		// 페이징 처리된 카테고리 목록
		model.addAttribute("categoryList", service.goodsCategoryList(category, cri));
		
		// 카테고리
		model.addAttribute("category", category);
		
		// 페이징처리
		PageMaker pm = new PageMaker(cri);
		//pm.setCri(cri);
		pm.setTotalCount(service.CategoryCount(category));
		model.addAttribute("pm", pm);
		
		
		return "/shop/goodsList";
		
	}
	
	/* 상품 상세페이지 */
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String getGoodsDetail(@RequestParam("n") int gdsNum, Model model, HttpSession session) throws Exception {
		
		log.info("get goods detail");
		
		// 아이디 세션값
		model.addAttribute("userId", (String) session.getAttribute("userId"));
		
		// 상세페이지 출력
		GoodsVO goods = service.goodsDetail(gdsNum);
		model.addAttribute("goods", goods);
		
		// 리뷰 리스트
		List<ReplyListVO> reply = service.replyList(gdsNum);
		model.addAttribute("reply", reply);
		
		return "/shop/goodsDetail";
	}
	
	/* 상품 상세페이지 - 리뷰 작성 */
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public String regisReply(ReplyVO reply, HttpSession session) throws Exception {
		log.info("regist reply");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		reply.setUserId(member.getUserId());
		
		service.registReply(reply);
		
		return "redirect:/shop/detail?n=" + reply.getGdsNum();
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
	
	
	
	/* 카트담기 */
	@ResponseBody
	@RequestMapping(value = "/detail/addCart", method = RequestMethod.POST)
	public int addCart(CartVO cart, HttpSession session) throws Exception {
		
		int result = 0;
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		//MemberVO member = (MemberVO)session.getAttribute("userId");
		
		
		 if(member != null) { 
			cart.setUserId(member.getUserId());
			service.addCart(cart);
			 result = 1; 
		 }
			 
		return result;
	}
	
	/* 카트 목록 */
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public void getCartList(HttpSession session, Model model) throws Exception {
		
		log.info("get cart list");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		List<CartListVO> cartList = service.cartList(userId);
		
		model.addAttribute("cartList", cartList);
	}
	
	/* 카트 삭제 */
	@ResponseBody 
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session, 
				@RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) throws Exception {
		
		log.info("delete cart");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		int result = 0;
		int cartNum = 0;
		
		if(member != null) {
			cart.setUserId(userId);
			
			for(String i : chArr) {
				cartNum = Integer.parseInt(i);
				cart.setCartNum(cartNum);
				service.deleteCart(cart);
			}
			result = 1;
		}
		return result;
	}
	
	/* 주문 */
	@RequestMapping(value = "/cartList", method = RequestMethod.POST)
	public String order(HttpSession session, OrderVO order, OrderDetailVO orderDetail) throws Exception {
		log.info("order");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		
		for(int i = 1; i <= 6; i++) {
			subNum += (int)(Math.random() * 10);
		}

		String orderId = ymd + "_" + subNum;
		
		order.setOrderId(orderId);
		order.setUserId(userId);
		
		// 주문 정보
		service.orderInfo(order);
		
		// 주문 상세 정보
		orderDetail.setOrderId(orderId);
		service.orderInfo_Details(orderDetail);
		
		// 카트비우기
		service.cartAllDelete(userId);
		
		return "redirect:/orderList";
	}
	
	/* 주문 목록 */
	@RequestMapping(value = "/orderList", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, OrderVO order, Model model) throws Exception {
		log.info("get order list");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		order.setUserId(userId);
		
		List<OrderVO> orderList = service.orderList(order);
		
		model.addAttribute("orderList", orderList);
	}
	
	/* 주문 상세 목록 */
	@RequestMapping(value = "/orderView", method = RequestMethod.GET)
	public void getOrderList(HttpSession session, 
					@RequestParam("n") String orderId, OrderVO order, Model model) throws Exception {
		log.info("get order view");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		order.setUserId(userId);
		order.setOrderId(orderId);
		
		List<OrderListVO> orderView = service.orderView(order);
		
		model.addAttribute("orderView", orderView);
	}
	
	/* 주문 상세 목록 - 상태 변경 */
	@RequestMapping(value = "/orderView", method = RequestMethod.POST)
	public String delivery(OrderVO order) throws Exception {
		log.info("post order view");
		
		service.delivery(order);
		
		return "redirect:/goods/orderView?n=" + order.getOrderId();
	}
	
	/*  */
	/*  */
	
}
