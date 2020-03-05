<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
	"http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="com.jip.dao.BoardDao">

	<select id="getList" resultType="com.jip.dto.BoardDto">
		<![CDATA[
		SELECT * FROM BLIST_1
		WHERE RONUM>=#{pageNum}*10-9
		AND RONUM<=#{pageNum}*10
		]]>
	</select>

	<select id="getContents" parameterType="Integer"
		resultType="com.jip.dto.BoardDto"><!-- resultType 데이터를 담을 곳  -->
		SELECT * FROM BLIST_1 WHERE BNUM=#{bnum}
	</select>
	
	<select id ="getBoardCount" resultType="Integer">
			SELECT COUNT(*) FROM BLIST_1
	</select>
	
	<insert id="boardInsert" parameterType="com.jip.dto.BoardDto"
						useGeneratedKeys="true" keyProperty="bnum">
						<selectKey keyProperty ="bnum"
						resultType="int" order="BEFORE">
						SELECT BOARD_SEQ.NEXTVAL FROM DUAL
						</selectKey>
						INSERT INTO B
						VALUES(${bnum}, #{btitle},  #{bcontents}, #{bid}, DEFAULT, DEFAULT)
						</insert>
						<!-- #과 $의 구분
						# : 파라미터가 String 형태로 들어와서 자동으로 컬럼 타입으로 변경
						숫자 : 10, 문자열 : '10' 
						$ : 파라미터 그대로 사용.
							보안 측면에서 불리함.
							(수정하고 싶은 데이터의)컬럼명을
							파라미터로 받아서 처리할 경우 사용.
						-->

</mapper>
