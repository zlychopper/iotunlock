class BaseEntity {
  int id;
  bool isDeleted = false;
  /** 创建者 */
  String createdBy;
  /** 创建时间 */
  DateTime creationTime;
  /** 更新者 */
  String updatedBy;
  /** 更新时间 */
  DateTime updateTime;
}
