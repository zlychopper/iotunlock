class Ids {
  static const String titleHome = 'title_home';
  static const String titleContacts = 'title_contacts';
  static const String titleMine = 'title_mine';
  static const String titleRepos = 'title_repos';
  static const String titleEvents = 'title_events';
  static const String titleSystem = 'title_system';

  static const String titleBookmarks = 'title_bookmarks';
  static const String titleCollection = 'title_collection';
  static const String titleSetting = 'title_setting';
  static const String titleAbout = 'title_about';
  static const String titleShare = 'title_share';
  static const String titleSignOut = 'title_signout';
  static const String titleLanguage = 'title_language';
  static const String titleTheme = 'title_theme';
  static const String titleAuthor = 'title_author';
  static const String titleOther = 'title_other';
  static const String titleForgetPwd = 'title_forget_pwd';
  static const String titleReg = 'title_reg';
  static const String titleGroup = 'title_group';
  static const String titleModifyPwd = 'modify_pwd';
  static const String titleCreateGroup = 'create_group';

  static const String languageAuto = 'language_auto';
  static const String languageZH = 'language_zh';
  static const String languageTW = 'language_tw';
  static const String languageHK = 'language_hk';
  static const String languageEN = 'language_en';

  static const String save = 'save';
  static const String more = 'more';

  static const String recRepos = 'rec_repos';
  static const String recWxArticle = 'rec_wxarticle';

  static const String titleReposTree = 'title_repos_tree';
  static const String titleWxArticleTree = 'title_wxarticle_tree';
  static const String titleSystemTree = 'title_system_tree';

  static const String user_name = 'user_name';
  static const String user_pwd = 'user_pwd';
  static const String user_re_pwd = 'user_re_pwd';
  static const String user_login = 'user_login';
  static const String user_register = 'user_register';
  static const String user_forget_pwd = 'user_forget_pwd';
  static const String user_new_user_hint = 'user_new_user_hint';
  static const String input_user_name_hint = 'input_user_name_hint';
  static const String input_pwd_hint = 'input_pwd_hint';
  static const String input_repwd_hint = 'input_repwd_hint';
  static const String input_new_pwd_hint = 'input_new_pwd_hint';
  static const String input_new_repwd_hint = 'input_new_repwd_hint';
  static const String input_group_name_hint = 'input_group_name_hint';
  static const String group_name_exist_hint = 'group_name_exist_hint';

  static const String open_in_browser = 'open_in_browser';

  static const String confirm = 'confirm';
  static const String cancel = 'cancel';

  static const String jump_count = 'jump_count';

  static const String input_phone_no = 'input_phone_no';
  static const String input_check_code = 'input_check_code';
  static const String get_check_code = 'get_check_code';
  static const String next_step = 'next_step';
  static const String modify = 'modify';
  static const String submit = 'submit';
  static const String create = 'create';

  static const String label_phone = 'label_phone';
  static const String label_check_code = 'label_check_code';
  static const String label_account = 'label_account';
  static const String label_pwd = 'label_pwd';
  static const String label_re_pwd = 'label_re_pwd';
  static const String label_group_name = 'label_group_name';

  static const String about_phone_no = 'about_phone_no';
  static const String about_modify_pwd = 'about_modify_pwd';
  static const String about_sys_version = 'about_sys_version';
  static const String about_share = 'about_share';
  static const String about_logout = 'about_logout';
  static const String about_logout_confirm = 'about_logout_confirm';
}

Map<String, Map<String, String>> localizedSimpleValues = {
  'en': {
    Ids.titleHome: 'Home',
    Ids.titleRepos: 'Repos',
    Ids.titleEvents: 'Events',
    Ids.titleSystem: 'System',
    Ids.titleBookmarks: 'Bookmarks',
    Ids.titleSetting: 'Setting',
    Ids.titleAbout: 'About',
    Ids.titleShare: 'Share',
    Ids.titleSignOut: 'Sign Out',
    Ids.titleLanguage: 'Language',
    Ids.languageAuto: 'Auto',
  },
  'zh': {
    Ids.titleHome: '主页',
    Ids.titleRepos: '项目',
    Ids.titleEvents: '动态',
    Ids.titleSystem: '体系',
    Ids.titleBookmarks: '书签',
    Ids.titleSetting: '设置',
    Ids.titleAbout: '关于',
    Ids.titleShare: '分享',
    Ids.titleSignOut: '注销',
    Ids.titleLanguage: '多语言',
    Ids.languageAuto: '跟随系统',
  },
};

Map<String, Map<String, Map<String, String>>> localizedValues = {
  'en': {
    'US': {
      Ids.titleHome: 'Home',
      Ids.titleContacts: 'Contacts',
      Ids.titleMine: 'Mine',
      Ids.titleRepos: 'Repos',
      Ids.titleEvents: 'Events',
      Ids.titleSystem: 'System',
      Ids.titleBookmarks: 'Bookmarks',
      Ids.titleCollection: 'Collection',
      Ids.titleSetting: 'Setting',
      Ids.titleAbout: 'About',
      Ids.titleShare: 'Share',
      Ids.titleSignOut: 'Sign Out',
      Ids.titleLanguage: 'Language',
      Ids.titleGroup: 'Group',
      Ids.titleCreateGroup: 'Create Group',
      Ids.languageAuto: 'Auto',
      Ids.save: 'Save',
      Ids.more: 'More',
      Ids.recRepos: 'Reco Repos',
      Ids.recWxArticle: 'Reco WxArticle',
      Ids.titleReposTree: 'Repos Tree',
      Ids.titleWxArticleTree: 'Wx Article',
      Ids.titleTheme: 'Theme',
      Ids.user_name: 'user name',
      Ids.user_pwd: 'password',
      Ids.user_re_pwd: 'confirm password',
      Ids.user_login: 'Login',
      Ids.user_register: 'Register',
      Ids.user_forget_pwd: 'Forget the password?',
      Ids.user_new_user_hint: 'New users? ',
      Ids.confirm: 'Confirm',
      Ids.cancel: 'Cancel',
      Ids.jump_count: 'Jump %\$0\$s',
      Ids.input_pwd_hint: 'please input password',
      Ids.input_repwd_hint: 'please input password again',
      Ids.input_new_pwd_hint: 'input new password',
      Ids.input_new_repwd_hint: 'input new password again',
      Ids.input_group_name_hint: 'input group name',
      Ids.group_name_exist_hint: 'group name exists',
      Ids.input_user_name_hint: 'please input user name',
      Ids.open_in_browser: 'open in browser',
      Ids.input_phone_no: 'please input phone No',
      Ids.input_check_code: 'please input check code',
      Ids.get_check_code: 'get check code',
      Ids.next_step: 'Next',
      Ids.titleForgetPwd: 'Forget pwd',
      Ids.titleReg: 'register',
      Ids.titleModifyPwd: 'modify pwd',
      Ids.modify: 'modify',
      Ids.submit: 'submit',
      Ids.create: 'create',
      Ids.label_account: 'user name',
      Ids.label_check_code: 'check code',
      Ids.label_phone: 'phone NO',
      Ids.label_pwd: 'password',
      Ids.label_re_pwd: 'password again',
      Ids.about_modify_pwd: 'modify pwd',
      Ids.about_phone_no: 'phone',
      Ids.about_sys_version: 'version',
      Ids.about_share: 'share',
      Ids.about_logout: 'logout',
      Ids.about_logout_confirm: 'are you sure logout?',
    }
  },
  'zh': {
    'CN': {
      Ids.titleHome: '首页',
      Ids.titleContacts: '通讯录',
      Ids.titleMine: '我的',
      Ids.titleRepos: '项目',
      Ids.titleEvents: '动态',
      Ids.titleSystem: '体系',
      Ids.titleBookmarks: '书签',
      Ids.titleCollection: '收藏',
      Ids.titleSetting: '设置',
      Ids.titleAbout: '关于',
      Ids.titleShare: '分享',
      Ids.titleSignOut: '注销',
      Ids.titleLanguage: '多语言',
      Ids.titleGroup: '群组',
      Ids.titleCreateGroup: '新建群组',
      Ids.languageAuto: '跟随系统',
      Ids.languageZH: '简体中文',
      Ids.languageTW: '繁體中文（台灣）',
      Ids.languageHK: '繁體中文（香港）',
      Ids.languageEN: 'English',
      Ids.save: '保存',
      Ids.more: '更多',
      Ids.recRepos: '推荐项目',
      Ids.recWxArticle: '推荐公众号',
      Ids.titleReposTree: '项目分类',
      Ids.titleWxArticleTree: '公众号',
      Ids.titleTheme: '主题',
      Ids.user_name: '账号',
      Ids.user_pwd: '密码',
      Ids.user_re_pwd: '确认密码',
      Ids.user_login: '登录',
      Ids.user_register: '注册',
      Ids.user_forget_pwd: '忘记密码？',
      Ids.user_new_user_hint: '新用户？',
      Ids.confirm: '确认',
      Ids.cancel: '取消',
      Ids.jump_count: '跳过 %\$0\$s',
      Ids.input_pwd_hint: '输入密码',
      Ids.input_repwd_hint: '再次输入密码',
      Ids.input_new_pwd_hint: '输入新密码',
      Ids.input_new_repwd_hint: '再次输入新密码',
      Ids.input_group_name_hint: '输入群组名称',
      Ids.group_name_exist_hint: '群组名已存在',
      Ids.input_user_name_hint: '输入账号',
      Ids.open_in_browser: '浏览器打开',
      Ids.input_phone_no: '输入手机号码',
      Ids.input_check_code: '输入验证码',
      Ids.get_check_code: '获取验证码',
      Ids.next_step: '下一步',
      Ids.titleForgetPwd: '忘记密码',
      Ids.titleReg: '注册',
      Ids.titleModifyPwd: '修改密码',
      Ids.modify: '修改',
      Ids.submit: '提交',
      Ids.create: '创建',
      Ids.label_account: '账号',
      Ids.label_check_code: '验证码',
      Ids.label_phone: '手机号码',
      Ids.label_pwd: '密码',
      Ids.label_group_name: '名称',
      Ids.label_re_pwd: '确认密码',
      Ids.about_modify_pwd: '修改密码',
      Ids.about_phone_no: '手机号码',
      Ids.about_sys_version: '系统版本',
      Ids.about_share: '分享',
      Ids.about_logout: '退出登录',
      Ids.about_logout_confirm: '确定退出吗？',
    },
    'HK': {
      Ids.titleHome: '主頁',
      Ids.titleRepos: '項目',
      Ids.titleEvents: '動態',
      Ids.titleSystem: '體系',
      Ids.titleBookmarks: '書簽',
      Ids.titleCollection: '收藏',
      Ids.titleSetting: '設置',
      Ids.titleAbout: '關於',
      Ids.titleShare: '分享',
      Ids.titleSignOut: '註銷',
      Ids.titleLanguage: '語言',
      Ids.languageAuto: '與系統同步',
      Ids.save: '儲存',
      Ids.more: '更多',
      Ids.recRepos: '推荐项目',
      Ids.recWxArticle: '推荐公众号',
      Ids.titleReposTree: '项目分类',
      Ids.titleWxArticleTree: '公众号',
      Ids.titleTheme: '主題',
      Ids.user_name: '賬號',
      Ids.user_pwd: '密码',
      Ids.user_re_pwd: '确认密码',
      Ids.user_login: '登录',
      Ids.user_register: '注册',
      Ids.user_forget_pwd: '忘记密码？',
      Ids.user_new_user_hint: '新用户？',
      Ids.confirm: '确认',
      Ids.cancel: '取消',
      Ids.jump_count: '跳过 %\$0\$s',
      Ids.input_pwd_hint: '輸入密碼',
      Ids.input_user_name_hint: '輸入賬號',
      Ids.open_in_browser: '浏覽器打開',
    },
    'TW': {
      Ids.titleHome: '主頁',
      Ids.titleRepos: '項目',
      Ids.titleEvents: '動態',
      Ids.titleSystem: '體系',
      Ids.titleBookmarks: '書簽',
      Ids.titleCollection: '收藏',
      Ids.titleSetting: '設置',
      Ids.titleAbout: '關於',
      Ids.titleShare: '分享',
      Ids.titleSignOut: '註銷',
      Ids.titleLanguage: '語言',
      Ids.languageAuto: '與系統同步',
      Ids.save: '儲存',
      Ids.more: '更多',
      Ids.recRepos: '推荐项目',
      Ids.recWxArticle: '推荐公众号',
      Ids.titleReposTree: '项目分类',
      Ids.titleWxArticleTree: '公众号',
      Ids.titleTheme: '主題',
      Ids.user_name: '賬號',
      Ids.user_pwd: '密码',
      Ids.user_re_pwd: '确认密码',
      Ids.user_login: '登录',
      Ids.user_register: '注册',
      Ids.user_forget_pwd: '忘记密码？',
      Ids.user_new_user_hint: '新用户？',
      Ids.confirm: '确认',
      Ids.cancel: '取消',
      Ids.jump_count: '跳过 %\$0\$s',
      Ids.input_pwd_hint: '輸入密碼',
      Ids.input_user_name_hint: '輸入賬號',
      Ids.open_in_browser: '浏覽器打開',
    }
  }
};
