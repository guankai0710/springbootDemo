------------------------------------
---表名：DEMO_PERSON（人员信息）
------------------------------------
--表结构
CREATE TABLE DEMO_PERSON
(
	ID         		  NUMBER(10,0) NOT NULL,
	NAME       		  VARCHAR2(32),
	ACCOUNT         VARCHAR2(64) NOT NULL,
	PASSWORD        VARCHAR2(64) NOT NULL,
	AGE        		  NUMBER(3,0),
	SEX        		  VARCHAR2(1),
	TEL        		  VARCHAR2(20),
	EMAIL        		VARCHAR2(35),
	ADDRESS    		  VARCHAR2(20),
	DELETED         VARCHAR2(1) DEFAULT ('0'),
	CREATE_TIME     TIMESTAMP,
	PRIMARY KEY (ID)
);
--表注释
COMMENT ON TABLE DEMO_PERSON IS '人员信息';
COMMENT ON COLUMN DEMO_PERSON.ID IS '人员编号';
COMMENT ON COLUMN DEMO_PERSON.NAME IS '姓名';
COMMENT ON COLUMN DEMO_PERSON.ACCOUNT IS '账号';
COMMENT ON COLUMN DEMO_PERSON.PASSWORD IS '密码';
COMMENT ON COLUMN DEMO_PERSON.AGE IS '年龄';
COMMENT ON COLUMN DEMO_PERSON.SEX IS '性别（0：女，1：男）';
COMMENT ON COLUMN DEMO_PERSON.TEL IS '电话';
COMMENT ON COLUMN DEMO_PERSON.EMAIL IS '邮箱';
COMMENT ON COLUMN DEMO_PERSON.ADDRESS IS '地址';
COMMENT ON COLUMN DEMO_PERSON.DELETED IS '是否已删除（0：未删除；1：已删除）';
COMMENT ON COLUMN DEMO_PERSON.CREATE_TIME IS '创建时间';
--序列
CREATE SEQUENCE "S_person_id"
MINVALUE 1
MAXVALUE 999999999
INCREMENT BY 1
START WITH 1
CACHE 20;
--触发器
CREATE OR REPLACE TRIGGER "TG_person_id"
BEFORE INSERT ON "DEMO_PERSON" FOR EACH ROW WHEN (NEW.ID IS NULL)
BEGIN
  SELECT "S_person_id".NEXTVAL INTO:NEW.ID FROM DUAL;
END;
/


------------------------------------
---表名：DEMO_DEPARTMENT（部门信息）
------------------------------------
--表结构
CREATE TABLE DEMO_DEPARTMENT
(
	ID         		  NUMBER(10,0) NOT NULL,
	PARENT_ID       NUMBER(10,0) NOT NULL,
	NAME       		  VARCHAR2(10),
	DELETED         VARCHAR2(1) DEFAULT ('0'),
	CREATE_TIME     TIMESTAMP,
	PRIMARY KEY (ID)
);
--表注释
COMMENT ON TABLE DEMO_DEPARTMENT IS '部门信息';
COMMENT ON COLUMN DEMO_DEPARTMENT.ID IS '部门编号';
COMMENT ON COLUMN DEMO_DEPARTMENT.PARENT_ID IS '父级编号';
COMMENT ON COLUMN DEMO_DEPARTMENT.NAME IS '部门名称';
COMMENT ON COLUMN DEMO_DEPARTMENT.DELETED IS '是否已删除（0：未删除；1：已删除）';
COMMENT ON COLUMN DEMO_DEPARTMENT.CREATE_TIME IS '创建时间';
--序列
CREATE SEQUENCE "S_department_id"
MINVALUE 1
MAXVALUE 999999999
INCREMENT BY 1
START WITH 1
CACHE 20;
--触发器
CREATE OR REPLACE TRIGGER "TG_department_id"
BEFORE INSERT ON "DEMO_DEPARTMENT" FOR EACH ROW WHEN (NEW.ID IS NULL)
BEGIN
  SELECT "S_department_id".NEXTVAL INTO:NEW.ID FROM DUAL;
END;
/


------------------------------------
---表名：DEMO_CATEGORY（类别信息）
------------------------------------
--表结构
CREATE TABLE DEMO_CATEGORY
(
	ID         		  NUMBER(10,0) NOT NULL,
	PARENT_ID       NUMBER(10,0) NOT NULL,
	NAME       		  VARCHAR2(10),
	DELETED         VARCHAR2(1) DEFAULT ('0'),
	CREATE_TIME     TIMESTAMP,
	PRIMARY KEY (ID)
);
--表注释
COMMENT ON TABLE DEMO_CATEGORY IS '类别信息';
COMMENT ON COLUMN DEMO_CATEGORY.ID IS '类别编号';
COMMENT ON COLUMN DEMO_CATEGORY.PARENT_ID IS '父级编号';
COMMENT ON COLUMN DEMO_CATEGORY.NAME IS '类别名称';
COMMENT ON COLUMN DEMO_CATEGORY.DELETED IS '是否已删除（0：未删除；1：已删除）';
COMMENT ON COLUMN DEMO_CATEGORY.CREATE_TIME IS '创建时间';
--序列
CREATE SEQUENCE "S_category_id"
MINVALUE 1
MAXVALUE 999999999
INCREMENT BY 1
START WITH 1
CACHE 20;
--触发器
CREATE OR REPLACE TRIGGER "TG_category_id"
BEFORE INSERT ON "DEMO_CATEGORY" FOR EACH ROW WHEN (NEW.ID IS NULL)
BEGIN
  SELECT "S_category_id".NEXTVAL INTO:NEW.ID FROM DUAL;
END;
/


