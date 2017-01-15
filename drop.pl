$linecounter = 0;
if (open DROPLIST,"droplist.txt")
{
	while ($line = <DROPLIST>)
	{
		chomp($line);
		$linelist[$linecounter] = $line;
		++$linecounter;
		#print $line."\n";
	}
	close DROPLIST;
}
#print "here\n";
while ($line = <>)
{
	chomp($line);
	#print $line;
	$foundit=0;
	for ($itr = 0;$foundit==0 && $itr < $linecounter; ++$itr)
	{
		#print $linelist[$itr];
		$thistest = $linelist[$itr];
		if ( ( $line =~ /$thistest/ )  )
		{
			$foundit=1;
		}
	}
	if ($foundit == 0)
	{
		print $line."\n";
	}
}
