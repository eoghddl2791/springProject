package member.bean;

import lombok.Data;

@Data
public class LikeDTO {

	private String seq;
	private String board_seq;
	private String member_id;
	private int like_check;
	private String id_boardseq;
	
}
