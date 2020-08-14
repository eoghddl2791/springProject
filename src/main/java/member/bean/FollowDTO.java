package member.bean;

import lombok.Data;

@Data
public class FollowDTO {
	
	private String id;
	private String nickname;
	private String follow_img;
	private String follow_nickname;
	private int follow_check;

}
