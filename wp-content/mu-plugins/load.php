<?php
// will load all plugins in the folder
foreach (glob(WPMU_PLUGIN_DIR . '/*', GLOB_ONLYDIR) as $folder) {
    // some-plugin folder will trigger loading of some-plugin/some-plugin.php
    $path = $folder . '/' . basename($folder) . '.php';
    require $path;
}
