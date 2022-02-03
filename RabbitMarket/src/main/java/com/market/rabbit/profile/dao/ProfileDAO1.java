package com.market.rabbit.profile.dao;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.market.rabbit.dto.MannerQuestionDTO;
import com.market.rabbit.dto.MemberDTO;
import com.market.rabbit.dto.ProfileFileDTO;
import com.market.rabbit.dto.ReviewDTO;
import com.market.rabbit.dto.SaleDTO;
import com.market.rabbit.dto.SaleFileDTO;
import com.market.rabbit.dto.TradingDTO;
import com.market.rabbit.dto.WishDTO;

public interface ProfileDAO1 {

	ArrayList<WishDTO> wishlist();

//	SaleDTO sale(String loginId);
//	
//	SaleFileDTO salefile(String loginId);

	int wishdelete(String wish_idx);

	int allCount();

	ArrayList<WishDTO> wishlist(int start, int end);

	MemberDTO profile(String loginId);

	ProfileFileDTO fileList(String loginId);

	ReviewDTO review(String loginId);

	SaleDTO sale(String loginId);

	SaleFileDTO salefile(String loginId);

	SaleDTO mysale(String loginId);

	SaleFileDTO salelistFile(String loginId);

	SaleDTO salelistlist(String loginId);

	SaleDTO saledetail(String loginId);

	TradingDTO tradedetail(String loginId);

	ArrayList<SaleDTO> callProfileSaleList(String loginId, int start, int end);

	ArrayList<ReviewDTO> callProfileReviewList(String member_id, int start, int end);

	int countAllSale(String member_id);

	int countAllReview(String member_id);

	int allCountMySaleList(String member_id, String code_num);

	ArrayList<SaleDTO> mySaleList(String member_id, String code_num, int start, int end);

	int findTradeIdxThisProduct(int product_idx);

	SaleDTO findSaleInfoThis(int product_idx);

	TradingDTO findTradeInfoThis(int trade_idx);

	SaleFileDTO findSaleFileFirstThis(int product_idx);

	int blockMember(String loginId, String member_id);
	
	int unblockMember(String loginId, String member_id);

	int confirmMyBlocking(String loginId, String member_id);

	ArrayList<MannerQuestionDTO> getMannerQuestion(String target, String trade_type);

	int setTrading(int trade_idx);

	String getMannerSellerId(int trade_idx);

	int setMemberManner(String seller_id, int point);

	int setMemberMannerCnt(String seller_id);

	int getmannerScore(String seller_id);

	void setMannerPercent(String seller_id, double mannerPercent);

	String getMannerBuyerId(int trade_idx);

	int registTrackingNum(int trade_idx, String package_company, String tracking_number);



}
