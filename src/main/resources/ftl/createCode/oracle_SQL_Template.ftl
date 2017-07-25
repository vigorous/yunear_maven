-- ----------------------------
-- Table structure for "C##NEWO"."SYS_${objectNameUpper}"
-- ----------------------------
-- DROP TABLE "C##NEWO"."SYS_${objectNameUpper}";
CREATE TABLE "C##NEWO"."SYS_${objectNameUpper}" (
<#list fieldList as var>
	<#if var[1] == 'Integer'>
	"${var[0]}" NUMBER(10) NULL ,
	<#else>
	"${var[0]}" VARCHAR2(255 BYTE) NULL ,
	</#if>
</#list>
	"${objectNameUpper}_ID" VARCHAR2(100 BYTE) NOT NULL 
)
LOGGING
NOCOMPRESS
NOCACHE
;

<#list fieldList as var>
COMMENT ON COLUMN "C##NEWO"."SYS_${objectNameUpper}"."${var[0]}" IS '${var[2]}';
</#list>
COMMENT ON COLUMN "C##NEWO"."SYS_${objectNameUpper}"."${objectNameUpper}_ID" IS 'ID';

-- ----------------------------
-- Indexes structure for table SYS_${objectNameUpper}
-- ----------------------------

-- ----------------------------
-- Checks structure for table "C##NEWO"."SYS_${objectNameUpper}"

-- ----------------------------

ALTER TABLE "C##NEWO"."SYS_${objectNameUpper}" ADD CHECK ("${objectNameUpper}_ID" IS NOT NULL);

-- ----------------------------
-- Primary Key structure for table "C##NEWO"."SYS_${objectNameUpper}"
-- ----------------------------
ALTER TABLE "C##NEWO"."SYS_${objectNameUpper}" ADD PRIMARY KEY ("${objectNameUpper}_ID");
