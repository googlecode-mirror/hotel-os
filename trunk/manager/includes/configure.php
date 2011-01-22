<?php
  define('HTTP_SERVER', 'http://localhost');
  define('HTTP_CATALOG_SERVER', 'http://localhost');
  define('HTTPS_CATALOG_SERVER', 'http://localhost');
  define('ENABLE_SSL_CATALOG', 'false');
  define('DIR_FS_DOCUMENT_ROOT', 'C:/wamp/www/Temp_NuTrang/');
  define('DIR_WS_ADMIN', '/Temp_NuTrang/admin/');
  define('DIR_FS_ADMIN', 'C:/wamp/www/Temp_NuTrang/admin/');
  
  # for manager 
  define('DIR_WS_MANAGER', '/Temp_NuTrang/manager/');
  define('DIR_FS_MANAGER', 'C:/wamp/www/Temp_NuTrang/manager/');
  # 
  define('DIR_WS_CATALOG', '/Temp_NuTrang/');  
  define('DIR_WS_IMAGES', 'images/');
  define('DIR_WS_ICONS', DIR_WS_IMAGES . 'icons/');
  define('DIR_WS_CATALOG_IMAGES', DIR_WS_CATALOG . 'images/');
  define('DIR_WS_CATALOG_IMAGES_HOTEL', DIR_WS_CATALOG_IMAGES . 'phongkhachsan/');
  
  define('DIR_WS_INCLUDES', 'includes/');
  define('DIR_WS_BOXES', DIR_WS_INCLUDES . 'boxes/');
  define('DIR_WS_FUNCTIONS', DIR_WS_INCLUDES . 'functions/');
  define('DIR_WS_CLASSES', DIR_WS_INCLUDES . 'classes/');
  define('DIR_WS_MODULES', DIR_WS_INCLUDES . 'modules/');
  define('DIR_WS_LANGUAGES', DIR_WS_INCLUDES . 'languages/');
  define('DIR_WS_CATALOG_LANGUAGES', DIR_WS_CATALOG . 'includes/languages/');
  define('DIR_FS_CATALOG', 'C:/wamp/www/Temp_NuTrang/');
  define('DIR_FS_CATALOG_LANGUAGES', DIR_FS_CATALOG . 'includes/languages/');
  define('DIR_FS_CATALOG_IMAGES', DIR_FS_CATALOG . 'images/');
  define('DIR_FS_CATALOG_IMAGES_HOTEL', DIR_FS_CATALOG_IMAGES . 'phongkhachsan/');
  define('DIR_FS_CATALOG_MODULES', DIR_FS_CATALOG . 'includes/modules/');
  define('DIR_FS_BACKUP', DIR_FS_MANAGER . 'backups/');

  define('DB_SERVER', 'localhost');
  define('DB_SERVER_USERNAME', 'quangha');
  define('DB_SERVER_PASSWORD', 'quangha');
  define('DB_DATABASE', 'booking');
  define('USE_PCONNECT', 'false');
  define('STORE_SESSIONS', 'mysql');
?>