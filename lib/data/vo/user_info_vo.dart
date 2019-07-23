import 'package:iot_unlock/data/entity/base_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_info_vo.g.dart';

@JsonSerializable()
class UserInfoVO extends BaseEntity {
  /** 编码 */
  String userCode;
  /** 中文名称 */
  String nameCn;
  /** 英文名称 */
  String nameEn;
  /** 昵称 */
  String nickname;
  /** 是否离职，0是在职，1是离职 */
  String isDimission;
  /** 学历 */
  String education;
  /**工龄**/
  String seniority;
  /** 性别 */
  int sex;
  /** 年龄 */
  int age;
  /** 国家编码 */
  String countryCode;
  /** 省份编码 */
  String provinceCode;
  /** 城市编码 */
  String cityCode;
  /** 邮箱 */
  String email;
  /** 电话 */
  String phone;
  /** 地址 */
  String address;
  /** 工号 */
  String employeeNum;
  /** 职务 */
  String position;
  /** 职称 */
  String professionalPost;
  /** 公司编码 */
  String companyCode;
  /** 部门编码 */
  String departmentCode;
  /** 来源 */
  String sources;
  /** 描述 */
  String description;

  String telPhone;

  int companyId;
  /** 上级部门编码 */
  String deptParentCode;
  /** 部门中文名称 */
  String deptNameCn;
  /** 部门英文名称 */
  String deptNameEn;
  /** 部门路径（用逗号隔开的部门编码） */
  String deptPath;
  /** 部门路径名称（用逗号隔开的部门名称） */
  String deptPathName;
  /** 公司中文名称  */
  String companyNameCn;
  /** 公司英文名称 */
  String companyNameEn;
  /** 公司地址 */
  String companyAddress;

  /** 片区id */
  String areaId;
  /** 权限 */
  Map<String, Object> permission;

  UserInfoVO(
      this.userCode,
      this.nameCn,
      this.nameEn,
      this.nickname,
      this.isDimission,
      this.education,
      this.seniority,
      this.sex,
      this.age,
      this.countryCode,
      this.provinceCode,
      this.cityCode,
      this.email,
      this.phone,
      this.address,
      this.employeeNum,
      this.position,
      this.professionalPost,
      this.companyCode,
      this.departmentCode,
      this.sources,
      this.description,
      this.telPhone,
      this.companyId,
      this.deptParentCode,
      this.deptNameCn,
      this.deptNameEn,
      this.deptPath,
      this.deptPathName,
      this.companyNameCn,
      this.companyNameEn,
      this.companyAddress,
      this.areaId,
      this.permission); //不同的类使用不同的mixin即可
  factory UserInfoVO.fromJson(Map<String, dynamic> json) =>
      _$UserInfoVOFromJson(json);
  Map<String, dynamic> toJson() => _$UserInfoVOToJson(this);
}
