package kosta.forrest.model.board.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class VideoDTO
{
	private String videoName;
	private String videoSrc;
	private String videoLength;
}
