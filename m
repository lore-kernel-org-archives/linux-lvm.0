Received: from jerry.gold (vpn-231-76.phx2.redhat.com [10.3.231.76])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s4UCjFZk027261
	for <linux-lvm@redhat.com>; Fri, 30 May 2014 08:45:15 -0400
Message-ID: <53887D5B.2050903@redhat.com>
Date: Fri, 30 May 2014 14:45:15 +0200
From: Werner Gold <wgold@redhat.com>
MIME-Version: 1.0
References: <20140522101837.GB14236@redhat.com>
	<537E0D25.7010108@redhat.com>	<20140522152232.GC14236@redhat.com>	<20140522154946.GD14236@redhat.com>	<20140522180405.GA6361@redhat.com>	<20140522181334.GE1302@redhat.com>	<20140529135246.GA31293@redhat.com>	<20140529203410.GG1954@redhat.com>	<20140529204719.GD1302@redhat.com>	<20140530113859.GB29705@agk-dp.fab.redhat.com>
	<20140530114518.GC29705@agk-dp.fab.redhat.com>
In-Reply-To: <20140530114518.GC29705@agk-dp.fab.redhat.com>
Content-Type: multipart/mixed; boundary="------------010606000101080706000803"
Subject: Re: [linux-lvm] Testing the new LVM cache feature
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.
--------------010606000101080706000803
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Many thanks to Alasdair and Heinz for the hint with the tagging feature.
More convenient than dealing with UUIDs.

I also stumbled across the "same VG" issue when I tried to set up the
test environment. Thanks to Richard for that hint. :-)

I ran bonnie++ on my X230 (RHEL7) here where I used an external USB3
SSD. Attached you find the results.

With cache, there is a significant difference in random create. That's
what I would expect from an SSD cache.

Werner
-- 
Werner Gold                                    wgold@redhat.com
Partner Enablement / EMEA                phone: 49.9331.803 855
Steinbachweg 23                          fax:     +49.9331.4407
97252 Frickenhausen/Main, Germany        cell: +49.172.764 4633
Key fingerprint =  FF91B07C 6F3D340E A71791AC 5E3A6CB4 D44CBC37

Reg. Adresse: Red Hat GmbH, Werner-von-Siemens-Ring 14, D-85630 Grasbrunn
Handelsregister: Amtsgericht Muenchen HRB 153243
Geschaeftsfuehrer: Mark Hegarty, Charlie Peters, Michael Cunningham,
Charles Cachera


--------------010606000101080706000803
Content-Type: text/html;
 name="bonnie-dm-cache.html"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="bonnie-dm-cache.html"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/RE=
C-html40/strict.dtd"><HTML><HEAD><TITLE>Bonnie++ Benchmark results</TITLE=
>
<STYLE type=3D"text/css">TD.header {text-align: center; backgroundcolor: =
"#CCFFFF" }TD.rowheader {text-align: center; backgroundcolor: "#CCCFFF" }=
TD.size {text-align: center; backgroundcolor: "#CCCFFF" }TD.ksec {text-al=
ign: center; fontstyle: italic }</STYLE>
<BODY>
<H2> Bonnie dm-cache first run without cache </h2>
<p>
<TABLE ALIGN=3Dcenter BORDER=3D3 CELLPADDING=3D2 CELLSPACING=3D1><TR><TD =
COLSPAN=3D2 class=3D"header"><FONT SIZE=3D+1><B>Version 1.96</B></FONT></=
TD><TD COLSPAN=3D6 class=3D"header"><FONT SIZE=3D+2><B>Sequential Output<=
/B></FONT></TD><TD COLSPAN=3D4 class=3D"header"><FONT SIZE=3D+2><B>Sequen=
tial Input</B></FONT></TD><TD COLSPAN=3D2 ROWSPAN=3D2 class=3D"header"><F=
ONT SIZE=3D+2><B>Random<BR>Seeks</B></FONT></TD><TD COLSPAN=3D1 class=3D"=
header"></TD><TD COLSPAN=3D6 class=3D"header"><FONT SIZE=3D+2><B>Sequenti=
al Create</B></FONT></TD><TD COLSPAN=3D6 class=3D"header"><FONT SIZE=3D+2=
><B>Random Create</B></FONT></TD></TR>
<TR><TD></TD><TD>Size</TD><TD COLSPAN=3D2>Per Char</TD><TD COLSPAN=3D2>Bl=
ock</TD><TD COLSPAN=3D2>Rewrite</TD><TD COLSPAN=3D2>Per Char</TD><TD COLS=
PAN=3D2>Block</TD><TD>Num Files</TD><TD COLSPAN=3D2>Create</TD><TD COLSPA=
N=3D2>Read</TD><TD COLSPAN=3D2>Delete</TD><TD COLSPAN=3D2>Create</TD><TD =
COLSPAN=3D2>Read</TD><TD COLSPAN=3D2>Delete</TD></TR><TR><TD COLSPAN=3D2>=
</TD><TD class=3D"ksec"><FONT SIZE=3D-2>K/sec</FONT></TD><TD class=3D"kse=
c"><FONT SIZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>K/=
sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD cl=
ass=3D"ksec"><FONT SIZE=3D-2>K/sec</FONT></TD><TD class=3D"ksec"><FONT SI=
ZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>K/sec</FONT><=
/TD><TD class=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec=
"><FONT SIZE=3D-2>K/sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>% C=
PU</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>/sec</FONT></TD><TD clas=
s=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD COLSPAN=3D1></TD><TD clas=
s=3D"ksec"><FONT SIZE=3D-2>/sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D=
-2>% CPU</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>/sec</FONT></TD><T=
D class=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec"><FON=
T SIZE=3D-2>/sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>% CPU</FON=
T></TD><TD class=3D"ksec"><FONT SIZE=3D-2>/sec</FONT></TD><TD class=3D"ks=
ec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>/=
sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD cl=
ass=3D"ksec"><FONT SIZE=3D-2>/sec</FONT></TD><TD class=3D"ksec"><FONT SIZ=
E=3D-2>% CPU</FONT></TD></TR>
<TR><TD rowspan=3D2 bgcolor=3D"#FFFFFF" class=3D"rowheader"><FONT SIZE=3D=
+1>dhcp86.gold</TD><TD class=3D"size" bgcolor=3D"#FFFFFF">31176M</TD><TD>=
1888</TD><TD>94</TD><TD>79527</TD><TD>3</TD><TD>32969</TD><TD>2</TD><TD>4=
071</TD><TD>98</TD><TD>88300</TD><TD>3</TD><TD>179.3</TD><TD>6</TD><TD cl=
ass=3D"size" bgcolor=3D"#FFFFFF">16</TD><TD>13345</TD><TD>35</TD><TD>++++=
+</TD><TD>+++</TD><TD>25022</TD><TD>30</TD><TD>13021</TD><TD>34</TD><TD>+=
++++</TD><TD>+++</TD><TD>25950</TD><TD>34</TD></TR>
<TR><TD class=3D"size" bgcolor=3D"#FFFFFF" COLSPAN=3D1>Latency</TD><TD CO=
LSPAN=3D2>5022us</TD><TD COLSPAN=3D2>282ms</TD><TD COLSPAN=3D2>223ms</TD>=
<TD COLSPAN=3D2>3349us</TD><TD COLSPAN=3D2>258ms</TD><TD COLSPAN=3D2>686m=
s</TD><TD class=3D"size" bgcolor=3D"#FFFFFF" COLSPAN=3D1>Latency</TD><TD =
COLSPAN=3D2>26160us</TD><TD COLSPAN=3D2>82us</TD><TD COLSPAN=3D2>86us</TD=
><TD COLSPAN=3D2>11553us</TD><TD COLSPAN=3D2>97us</TD><TD COLSPAN=3D2>123=
2us</TD></TR>
</TABLE>
</P>
<H2> Bonnie second Run without cache </H2>
<P>
<TABLE ALIGN=3Dcenter BORDER=3D3 CELLPADDING=3D2 CELLSPACING=3D1><TR><TD =
COLSPAN=3D2 class=3D"header"><FONT SIZE=3D+1><B>Version 1.96</B></FONT></=
TD><TD COLSPAN=3D6 class=3D"header"><FONT SIZE=3D+2><B>Sequential Output<=
/B></FONT></TD><TD COLSPAN=3D4 class=3D"header"><FONT SIZE=3D+2><B>Sequen=
tial Input</B></FONT></TD><TD COLSPAN=3D2 ROWSPAN=3D2 class=3D"header"><F=
ONT SIZE=3D+2><B>Random<BR>Seeks</B></FONT></TD><TD COLSPAN=3D1 class=3D"=
header"></TD><TD COLSPAN=3D6 class=3D"header"><FONT SIZE=3D+2><B>Sequenti=
al Create</B></FONT></TD><TD COLSPAN=3D6 class=3D"header"><FONT SIZE=3D+2=
><B>Random Create</B></FONT></TD></TR>
<TR><TD></TD><TD>Size</TD><TD COLSPAN=3D2>Per Char</TD><TD COLSPAN=3D2>Bl=
ock</TD><TD COLSPAN=3D2>Rewrite</TD><TD COLSPAN=3D2>Per Char</TD><TD COLS=
PAN=3D2>Block</TD><TD>Num Files</TD><TD COLSPAN=3D2>Create</TD><TD COLSPA=
N=3D2>Read</TD><TD COLSPAN=3D2>Delete</TD><TD COLSPAN=3D2>Create</TD><TD =
COLSPAN=3D2>Read</TD><TD COLSPAN=3D2>Delete</TD></TR><TR><TD COLSPAN=3D2>=
</TD><TD class=3D"ksec"><FONT SIZE=3D-2>K/sec</FONT></TD><TD class=3D"kse=
c"><FONT SIZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>K/=
sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD cl=
ass=3D"ksec"><FONT SIZE=3D-2>K/sec</FONT></TD><TD class=3D"ksec"><FONT SI=
ZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>K/sec</FONT><=
/TD><TD class=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec=
"><FONT SIZE=3D-2>K/sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>% C=
PU</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>/sec</FONT></TD><TD clas=
s=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD COLSPAN=3D1></TD><TD clas=
s=3D"ksec"><FONT SIZE=3D-2>/sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D=
-2>% CPU</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>/sec</FONT></TD><T=
D class=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec"><FON=
T SIZE=3D-2>/sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>% CPU</FON=
T></TD><TD class=3D"ksec"><FONT SIZE=3D-2>/sec</FONT></TD><TD class=3D"ks=
ec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>/=
sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD cl=
ass=3D"ksec"><FONT SIZE=3D-2>/sec</FONT></TD><TD class=3D"ksec"><FONT SIZ=
E=3D-2>% CPU</FONT></TD></TR>
<TR><TD rowspan=3D2 bgcolor=3D"#FFFFFF" class=3D"rowheader"><FONT SIZE=3D=
+1>dhcp86.gold</TD><TD class=3D"size" bgcolor=3D"#FFFFFF">31176M</TD><TD>=
1912</TD><TD>93</TD><TD>80326</TD><TD>3</TD><TD>32887</TD><TD>2</TD><TD>4=
128</TD><TD>98</TD><TD>88336</TD><TD>3</TD><TD>187.0</TD><TD>6</TD><TD cl=
ass=3D"size" bgcolor=3D"#FFFFFF">16</TD><TD>13414</TD><TD>35</TD><TD>++++=
+</TD><TD>+++</TD><TD>29374</TD><TD>36</TD><TD>17368</TD><TD>45</TD><TD>+=
++++</TD><TD>+++</TD><TD>23683</TD><TD>30</TD></TR>
<TR><TD class=3D"size" bgcolor=3D"#FFFFFF" COLSPAN=3D1>Latency</TD><TD CO=
LSPAN=3D2>4963us</TD><TD COLSPAN=3D2>100ms</TD><TD COLSPAN=3D2>227ms</TD>=
<TD COLSPAN=3D2>6850us</TD><TD COLSPAN=3D2>227ms</TD><TD COLSPAN=3D2>310m=
s</TD><TD class=3D"size" bgcolor=3D"#FFFFFF" COLSPAN=3D1>Latency</TD><TD =
COLSPAN=3D2>1006us</TD><TD COLSPAN=3D2>89us</TD><TD COLSPAN=3D2>80us</TD>=
<TD COLSPAN=3D2>7576us</TD><TD COLSPAN=3D2>7us</TD><TD COLSPAN=3D2>2120us=
</TD></TR>
</TABLE></P>
<H2> Bonnie with cache 20 GB SSD USB3 </H2>
<P>
<TABLE ALIGN=3Dcenter BORDER=3D3 CELLPADDING=3D2 CELLSPACING=3D1><TR><TD =
COLSPAN=3D2 class=3D"header"><FONT SIZE=3D+1><B>Version 1.96</B></FONT></=
TD><TD COLSPAN=3D6 class=3D"header"><FONT SIZE=3D+2><B>Sequential Output<=
/B></FONT></TD><TD COLSPAN=3D4 class=3D"header"><FONT SIZE=3D+2><B>Sequen=
tial Input</B></FONT></TD><TD COLSPAN=3D2 ROWSPAN=3D2 class=3D"header"><F=
ONT SIZE=3D+2><B>Random<BR>Seeks</B></FONT></TD><TD COLSPAN=3D1 class=3D"=
header"></TD><TD COLSPAN=3D6 class=3D"header"><FONT SIZE=3D+2><B>Sequenti=
al Create</B></FONT></TD><TD COLSPAN=3D6 class=3D"header"><FONT SIZE=3D+2=
><B>Random Create</B></FONT></TD></TR>
<TR><TD></TD><TD>Size</TD><TD COLSPAN=3D2>Per Char</TD><TD COLSPAN=3D2>Bl=
ock</TD><TD COLSPAN=3D2>Rewrite</TD><TD COLSPAN=3D2>Per Char</TD><TD COLS=
PAN=3D2>Block</TD><TD>Num Files</TD><TD COLSPAN=3D2>Create</TD><TD COLSPA=
N=3D2>Read</TD><TD COLSPAN=3D2>Delete</TD><TD COLSPAN=3D2>Create</TD><TD =
COLSPAN=3D2>Read</TD><TD COLSPAN=3D2>Delete</TD></TR><TR><TD COLSPAN=3D2>=
</TD><TD class=3D"ksec"><FONT SIZE=3D-2>K/sec</FONT></TD><TD class=3D"kse=
c"><FONT SIZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>K/=
sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD cl=
ass=3D"ksec"><FONT SIZE=3D-2>K/sec</FONT></TD><TD class=3D"ksec"><FONT SI=
ZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>K/sec</FONT><=
/TD><TD class=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec=
"><FONT SIZE=3D-2>K/sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>% C=
PU</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>/sec</FONT></TD><TD clas=
s=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD COLSPAN=3D1></TD><TD clas=
s=3D"ksec"><FONT SIZE=3D-2>/sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D=
-2>% CPU</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>/sec</FONT></TD><T=
D class=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec"><FON=
T SIZE=3D-2>/sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>% CPU</FON=
T></TD><TD class=3D"ksec"><FONT SIZE=3D-2>/sec</FONT></TD><TD class=3D"ks=
ec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>/=
sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD cl=
ass=3D"ksec"><FONT SIZE=3D-2>/sec</FONT></TD><TD class=3D"ksec"><FONT SIZ=
E=3D-2>% CPU</FONT></TD></TR>
<TR><TD rowspan=3D2 bgcolor=3D"#FFFFFF" class=3D"rowheader"><FONT SIZE=3D=
+1>dhcp86.gold</TD><TD class=3D"size" bgcolor=3D"#FFFFFF">31176M</TD><TD>=
1874</TD><TD>94</TD><TD>79317</TD><TD>3</TD><TD>33381</TD><TD>3</TD><TD>3=
492</TD><TD>90</TD><TD>89812</TD><TD>4</TD><TD>175.4</TD><TD>6</TD><TD cl=
ass=3D"size" bgcolor=3D"#FFFFFF">16</TD><TD>11373</TD><TD>30</TD><TD>++++=
+</TD><TD>+++</TD><TD>22227</TD><TD>27</TD><TD>12312</TD><TD>32</TD><TD>+=
++++</TD><TD>+++</TD><TD>27129</TD><TD>35</TD></TR>
<TR><TD class=3D"size" bgcolor=3D"#FFFFFF" COLSPAN=3D1>Latency</TD><TD CO=
LSPAN=3D2>4787us</TD><TD COLSPAN=3D2>99756us</TD><TD COLSPAN=3D2>1725ms</=
TD><TD COLSPAN=3D2>66649us</TD><TD COLSPAN=3D2>247ms</TD><TD COLSPAN=3D2>=
421ms</TD><TD class=3D"size" bgcolor=3D"#FFFFFF" COLSPAN=3D1>Latency</TD>=
<TD COLSPAN=3D2>9701us</TD><TD COLSPAN=3D2>99us</TD><TD COLSPAN=3D2>440us=
</TD><TD COLSPAN=3D2>957us</TD><TD COLSPAN=3D2>9us</TD><TD COLSPAN=3D2>21=
39us</TD></TR>
</TABLE>
</P>
<H2> 50 GB SSD USB3 Volume </h2>
<P>
<TABLE ALIGN=3Dcenter BORDER=3D3 CELLPADDING=3D2 CELLSPACING=3D1><TR><TD =
COLSPAN=3D2 class=3D"header"><FONT SIZE=3D+1><B>Version 1.96</B></FONT></=
TD><TD COLSPAN=3D6 class=3D"header"><FONT SIZE=3D+2><B>Sequential Output<=
/B></FONT></TD><TD COLSPAN=3D4 class=3D"header"><FONT SIZE=3D+2><B>Sequen=
tial Input</B></FONT></TD><TD COLSPAN=3D2 ROWSPAN=3D2 class=3D"header"><F=
ONT SIZE=3D+2><B>Random<BR>Seeks</B></FONT></TD><TD COLSPAN=3D1 class=3D"=
header"></TD><TD COLSPAN=3D6 class=3D"header"><FONT SIZE=3D+2><B>Sequenti=
al Create</B></FONT></TD><TD COLSPAN=3D6 class=3D"header"><FONT SIZE=3D+2=
><B>Random Create</B></FONT></TD></TR>
<TR><TD></TD><TD>Size</TD><TD COLSPAN=3D2>Per Char</TD><TD COLSPAN=3D2>Bl=
ock</TD><TD COLSPAN=3D2>Rewrite</TD><TD COLSPAN=3D2>Per Char</TD><TD COLS=
PAN=3D2>Block</TD><TD>Num Files</TD><TD COLSPAN=3D2>Create</TD><TD COLSPA=
N=3D2>Read</TD><TD COLSPAN=3D2>Delete</TD><TD COLSPAN=3D2>Create</TD><TD =
COLSPAN=3D2>Read</TD><TD COLSPAN=3D2>Delete</TD></TR><TR><TD COLSPAN=3D2>=
</TD><TD class=3D"ksec"><FONT SIZE=3D-2>K/sec</FONT></TD><TD class=3D"kse=
c"><FONT SIZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>K/=
sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD cl=
ass=3D"ksec"><FONT SIZE=3D-2>K/sec</FONT></TD><TD class=3D"ksec"><FONT SI=
ZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>K/sec</FONT><=
/TD><TD class=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec=
"><FONT SIZE=3D-2>K/sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>% C=
PU</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>/sec</FONT></TD><TD clas=
s=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD COLSPAN=3D1></TD><TD clas=
s=3D"ksec"><FONT SIZE=3D-2>/sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D=
-2>% CPU</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>/sec</FONT></TD><T=
D class=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec"><FON=
T SIZE=3D-2>/sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>% CPU</FON=
T></TD><TD class=3D"ksec"><FONT SIZE=3D-2>/sec</FONT></TD><TD class=3D"ks=
ec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>/=
sec</FONT></TD><TD class=3D"ksec"><FONT SIZE=3D-2>% CPU</FONT></TD><TD cl=
ass=3D"ksec"><FONT SIZE=3D-2>/sec</FONT></TD><TD class=3D"ksec"><FONT SIZ=
E=3D-2>% CPU</FONT></TD></TR>
<TR><TD rowspan=3D2 bgcolor=3D"#FFFFFF" class=3D"rowheader"><FONT SIZE=3D=
+1>dhcp86.gold</TD><TD class=3D"size" bgcolor=3D"#FFFFFF">31176M</TD><TD>=
2009</TD><TD>99</TD><TD>222798</TD><TD>9</TD><TD>75933</TD><TD>5</TD><TD>=
4182</TD><TD>99</TD><TD>259103</TD><TD>8</TD><TD>3231</TD><TD>83</TD><TD =
class=3D"size" bgcolor=3D"#FFFFFF">16</TD><TD>+++++</TD><TD>+++</TD><TD>+=
++++</TD><TD>+++</TD><TD>+++++</TD><TD>+++</TD><TD>+++++</TD><TD>+++</TD>=
<TD>+++++</TD><TD>+++</TD><TD>+++++</TD><TD>+++</TD></TR>
<TR><TD class=3D"size" bgcolor=3D"#FFFFFF" COLSPAN=3D1>Latency</TD><TD CO=
LSPAN=3D2>6191us</TD><TD COLSPAN=3D2>99859us</TD><TD COLSPAN=3D2>21786us<=
/TD><TD COLSPAN=3D2>2753us</TD><TD COLSPAN=3D2>5604us</TD><TD COLSPAN=3D2=
>7597us</TD><TD class=3D"size" bgcolor=3D"#FFFFFF" COLSPAN=3D1>Latency</T=
D><TD COLSPAN=3D2>1157us</TD><TD COLSPAN=3D2>83us</TD><TD COLSPAN=3D2>72u=
s</TD><TD COLSPAN=3D2>1069us</TD><TD COLSPAN=3D2>8us</TD><TD COLSPAN=3D2>=
2128us</TD></TR>
</TABLE>
</BODY></HTML>

--------------010606000101080706000803--
