package org.party.action;

import java.io.*;

import org.apache.commons.io.FileUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.struts2.ServletActionContext;
import org.party.domain.*;
import org.party.utils.*;

public class ManageUserImportAction extends GenericAction {
	
	private User currentUser;
	private File importFile;
	private String importFileContentType;
	private String importFileFileName;
	private Integer partyBranchId;
	
	/*
	 * 用户导入页面
	 */
	public String manageUserImport() throws Exception {
		currentUser = currentUser();
		if(currentUser != null && currentUser.getPermission() == 2) {
			return "success";
		}
		else {
			return "error";
		}
	}
	
	/*
	 * 用户导入（上传文件、解析文件、导入用户）
	 * 
	 * ==== URL
	 *   POST manageUserImportAction
	 *   
	 * ==== Params
	 *   参考struts文件上传实现
	 *   importFile
	 *   importFileContentType
	 *   importFileFileName
	 */
	public String manageUserImportAction() throws Exception {
		currentUser = currentUser();
		if (currentUser != null && currentUser.getPermission() == 2) {
			if (saveUploadFile() &&
				validatePartyBranch() &&
				analysisImportFile()) {
				messages.add("导入成功");
				return "success";
			}
			else {
				messages.add("分析表格失败");
				return "false";
			}
		}
		return "error";
	}
	
	/*
	 * 保存文件到Upload文件夹
	 */
	private boolean saveUploadFile() {
		boolean result = true;
		try {
			String realPath = ServletActionContext.getServletContext().getRealPath("/Upload");
			String realName = currentTimestamp() + importFileFileName;
			logger.debug("上传文件：realpath -> " + realPath);
			if (importFile != null) {
				File saveFile = new File(new File(realPath), realName);
				if (!saveFile.getParentFile().exists()) {
					saveFile.getParentFile().mkdirs();
				}
				FileUtils.copyFile(importFile, saveFile);
			}
			else {
				messages.add("上传文件为空");
				result = false;
			}
		} catch (Exception e) {
			logger.debug("上传文件失败");
			result = false;
			messages.add("上传文件失败");
			e.printStackTrace();
		}
		return result;
	}
	
	/*
	 * 解析xls文件
	 */
	private boolean analysisImportFile() {
		boolean result = true;
		try {
			InputStream inp = new FileInputStream(importFile);
			Workbook book = WorkbookFactory.create(inp);
			Sheet sheet = book.getSheetAt(0);
			
			Integer successCount = 0;
			
			//从第一行开始遍历每行
			for(int rowNum = 1; rowNum < Math.min(1000, sheet.getLastRowNum()); rowNum++) {
				Row row = sheet.getRow(rowNum);
				logger.debug("处理第" + rowNum + "行.");
				if (row != null) {
					//读取这一行的 用户基本信息
					User user = new User();
					//传入的党支部参数
					user.setPartybranchid(partyBranchId);
					//表格中读取的
					user.setName(getCell(row, Constants.NAME));
					user.setStudentid(getCell(row, Constants.STUDENT_ID));
					user.setBirthday(stringToDate(getCell(row, Constants.BIRTHDAY)));
					user.setDormitory(getCell(row, Constants.DORMITORY));
					user.setTelephone(getCell(row, Constants.TELEPHONE));
					user.setUclass(getCell(row, Constants.UCLASS));
					user.setGender(User.generateGender(getCell(row, Constants.GENDER)));
					user.setNation(getCell(row, Constants.NATION));;
					user.setApplydate(stringToDate(getCell(row, Constants.APPLY_DATE)));
					user.setJob(getCell(row, Constants.JOB));
					user.setOrigo(getCell(row, Constants.ORIGO));
					user.setStatus(Constants.STATUS_DESC.indexOf(getCell(row, Constants.STATUS)));
					user.setBe_passpartyclass_date(stringToDate(getCell(row, Constants.BE_PASS_PARTY_CLASS_DATE)));
					user.setBe_activist_date(stringToDate(getCell(row, Constants.BE_ACTIVIST_DATE)));
					user.setBe_target_date(stringToDate(getCell(row, Constants.BE_TARGET_DATE)));
					user.setBe_probationary_date(stringToDate(getCell(row, Constants.BE_PROBATIONARY_DATE)));
					user.setBe_fullmember_date(stringToDate(getCell(row, Constants.BE_FULL_MEMBER_DATE)));
					//表格中没有的
					user.setPasswd(user.getStudentid());
					user.setPermission(Constants.COMMEN);
					user.setNext_status(Constants.STATUS_CAN_NOT);
					user.setIs_complete(Constants.IS_COMPLETE_YES);
					
					//读取这一行 用户档案信息
					Commit commit = new Commit();
					commit.setRudangshenqingshu(getNumCell(row, Constants.RU_DANG_SHEN_QING_SHU));
					commit.setJijifenzikaochabiao(getNumCell(row, Constants.JI_JI_FEN_ZI_KAO_CHA_BIAO));
					commit.setZizhuan(getNumCell(row, Constants.ZI_ZHUAN));
					commit.setSixianghuibao(getNumCell(row, Constants.SI_XIANG_HUI_BAO));
					commit.setZhengshencailiao(getNumCell(row, Constants.ZHENG_SHEN_CAI_LIAO));
					commit.setZhengshenbaogao(getNumCell(row, Constants.ZHENG_SHEN_BAO_GAO));
					commit.setQunzhongyijian(getNumCell(row, Constants.QUN_ZHONG_YI_JIAN));
					commit.setDangxiaojieyezheng(getNumCell(row, Constants.DANG_KE_JIE_YE_ZHENG));
					commit.setTuiyourudang(getNumCell(row, Constants.TUI_YOU_RU_DANG));
					commit.setZhibudahuijilu(getNumCell(row, Constants.FA_ZHAN_DA_HUI_JUE_YI));
					commit.setFazhandangyuangongshi(getNumCell(row, Constants.FA_ZHAN_DANG_YUAN_GONG_SHI));
					commit.setRudangzhiyuanshu(getNumCell(row, Constants.RU_DANG_ZHI_YUAN_SHU));
					commit.setBanqizongjie(getNumCell(row, Constants.BAN_QI_ZONG_JIE));
					commit.setQuannianzongjie(getNumCell(row, Constants.QUAN_NIAN_ZONG_JIE));
					commit.setZhuanzhengshenqing(getNumCell(row, Constants.ZHUAN_ZHENG_SHEN_QING));
					commit.setYubeidangyuankaochabiao(getNumCell(row, Constants.YU_BEI_DANG_YUAN_KAO_CHA_BIAO));
					commit.setZhuanzhenggongshi(getNumCell(row, Constants.ZHUAN_ZHENG_GONG_SHI));
					
					if (user.validate() && User.createUser(user, commit)) {
						successCount++;
						continue;
					}
					else {
						messages.add("第" + rowNum + "行导入失败");
					}
				}
			}
			messages.add("成功导入" + successCount + "条数据");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			result = false;
			e.printStackTrace();
		}
		return result;
	}
	
	/*
	 * 返回单元格内容
	 */
	private String getCell(Row row, Integer colNum) {
		Cell cell = row.getCell(colNum, Row.RETURN_BLANK_AS_NULL);
		if (cell == null) return null;
		return cell.getRichStringCellValue().getString();
	}
	
	private Integer getNumCell(Row row, Integer colNum) {
		String Num = getCell(row, colNum);
		return Integer.parseInt(Num);
	}
	
	/*
	 * 校验是否输入党支部
	 */
	private boolean validatePartyBranch() {
		if (partyBranchId == null || PartyBranch.findById(partyBranchId) == null) {
			messages.add("未选择党支部");
			return false;
		}
		return true;
	}

	public File getImportFile() {
		return importFile;
	}

	public void setImportFile(File importFile) {
		this.importFile = importFile;
	}

	public String getImportFileContentType() {
		return importFileContentType;
	}

	public void setImportFileContentType(String importFileContentType) {
		this.importFileContentType = importFileContentType;
	}

	public String getImportFileFileName() {
		return importFileFileName;
	}

	public void setImportFileFileName(String importFileFileName) {
		this.importFileFileName = importFileFileName;
	}

	public Integer getPartyBranchId() {
		return partyBranchId;
	}

	public void setPartyBranchId(Integer partyBranchId) {
		this.partyBranchId = partyBranchId;
	}
}
