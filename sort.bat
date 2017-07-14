@ECHO OFF
REM macro for printing special characters
set "print=for /f %%^" in ("""") do echo(%%~""

(

%print% <?php
%print% /** Rename files in actual folder with prefix to be newest first in alphabetical order **/ 
%print% $files = array();
%print% foreach (glob('*.*') as $filename) {
%print% 	$index = filectime($filename);
%print% 	while (isset($files[$index])) $index--;
%print% 	$files[$index] = $filename ;
%print% }
%print% krsort($files);
%print% $i= 0;
%print% foreach ($files as $file){
%print% 	if (in_array($file, array(basename(__FILE__), 'sort.bat', 'sort.php')))  continue;
%print% 	if ($i<10) $prefix = '000'.$i;
%print% 	if ($i>=10 && $i<100) $prefix = '00'.$i;
%print% 	if ($i>=100 && $i<1000) $prefix = '0'.$i;
%print% 	if ($i>=1000) $prefix = $i;
%print% 	$filename = preg_replace('/^\d+_/', '', $file);
%print% 	$filename =  $prefix.'_'.$filename;
%print% 	echo date('Y.m.d H:i:s', filectime($file))."\t".$filename	. PHP_EOL;		
%print% 	rename ($file, $filename);
%print% 	$i++;
%print% }
%print% ?>

) > 'sort.php' & php -f 'sort.php' & del 'sort.php'