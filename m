Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nA5FaxVn003961
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 10:36:59 -0500
Received: from mail-pw0-f52.google.com (mail-pw0-f52.google.com
	[209.85.160.52])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nA5Fafmt019727
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 10:36:41 -0500
Received: by pwi6 with SMTP id 6so53932pwi.11
	for <linux-lvm@redhat.com>; Thu, 05 Nov 2009 07:36:41 -0800 (PST)
From: Adam Mooz <adam.mooz@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1076)
Content-Type: multipart/alternative; boundary=Apple-Mail-1--44678827
Subject: Re: [linux-lvm] PFree is 0 on a drive with nothing on it
Date: Thu, 5 Nov 2009 10:36:35 -0500
In-Reply-To: <1257433818.17792.30@raydesk1.bettercgi.com>
References: <C613C4C4-17B6-48A0-A5CD-36A89F815198@gmail.com>
	<1257433818.17792.30@raydesk1.bettercgi.com>
Message-Id: <E6AFA4E4-A03C-4D1D-8A78-5DF2110EFA2E@gmail.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--Apple-Mail-1--44678827
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii;
	format=flowed;
	delsp=yes

Here it is for both SDA and SDB:

#pvdisplay -m /dev/mapper/cryptsda
File descriptor 4 left open
   --- Physical volume ---
   PV Name               /dev/mapper/cryptsda
   VG Name               fileshare
   PV Size               931.04 GB / not usable 3.87 MB
   Allocatable           yes (but full)
   PE Size (KByte)       4096
   Total PE              238344
   Free PE               0
   Allocated PE          238344
   PV UUID               6OfRxC-R59i-CVjX-igtB-pg4e-2qAw-OdiPSc

   --- Physical Segments ---
   Physical extent 0 to 238343:
     Logical volume	/dev/fileshare/lv_fileshare
     Logical extents	0 to 238343

#pvdisplay -m /dev/mapper/cryptsdb
File descriptor 4 left open
   --- Physical volume ---
   PV Name               /dev/mapper/cryptsdb
   VG Name               fileshare
   PV Size               931.04 GB / not usable 3.87 MB
   Allocatable           yes (but full)
   PE Size (KByte)       4096
   Total PE              238344
   Free PE               0
   Allocated PE          238344
   PV UUID               zCLder-PF5b-fQpy-RdMS-Ayc0-caWh-LA2Esm

   --- Physical Segments ---
   Physical extent 0 to 238343:
     Logical volume	/dev/fileshare/lv_fileshare
     Logical extents	238344 to 476687



On 2009-11-05, at 10:10 AM, Ray Morris wrote:

> What is the output of?:
>
> pvdisplay -m /dev/mapper/cryptsda
>
>
> --
> Ray Morris
> support@bettercgi.com
>
> Strongbox - The next generation in site security:
> http://www.bettercgi.com/strongbox/
>
> Throttlebox - Intelligent Bandwidth Control
> http://www.bettercgi.com/throttlebox/
>
> Strongbox / Throttlebox affiliate program:
> http://www.bettercgi.com/affiliates/user/register.php
>
>
> On 11/05/2009 01:57:53 AM, Adam Mooz wrote:
>> Hello List,
>> I have a fileserver that is driving me nuts at the moment.  Setup:
>> 4x 1TB HDD's
>> 1x 320GB HDD
>> They all have the same partition layout:
>> 512MB Swap, rest is LVM data.
>> The LVM only contains ~400GB of data, but 2 of the TB drives report  
>> having 0 free PFree's:
>>  PV                   VG        Fmt  Attr PSize   PFree
>>  /dev/mapper/cryptsda fileshare lvm2 a-   931.03G      0
>>  /dev/mapper/cryptsdb fileshare lvm2 a-   931.03G      0
>>  /dev/mapper/cryptsdc fileshare lvm2 a-   297.61G 297.61G
>>  /dev/mapper/cryptsdd fileshare lvm2 a-   931.03G 633.42G
>>  /dev/mapper/cryptsde           lvm2 --   931.04G 931.04G
>> I've successfully managed to remove SDE from the LVM, but I need to  
>> move the data off SDD onto either SDA or SDB.  When the whole  
>> system is mounted it properly reports having 2.1TB of free space  
>> (931 * 2 + 297). Is there an easy way to fix this issue?
>
> ------quoted attachment------
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--Apple-Mail-1--44678827
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
"><div>Here it is for both SDA and SDB:</div><div><br></div><div><span =
class=3D"Apple-style-span" style=3D"border-collapse: separate; color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: medium; font-style: =
normal; font-variant: normal; font-weight: normal; letter-spacing: =
normal; line-height: normal; orphans: 2; text-align: auto; text-indent: =
0px; text-transform: none; white-space: normal; widows: 2; word-spacing: =
0px; -webkit-border-horizontal-spacing: 0px; =
-webkit-border-vertical-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; "><span class=3D"Apple-style-span" =
style=3D"border-collapse: separate; color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: medium; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; =
widows: 2; word-spacing: 0px; -webkit-border-horizontal-spacing: 0px; =
-webkit-border-vertical-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; "><div style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space; "><span class=3D"Apple-style-span" =
style=3D"border-collapse: separate; color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: medium; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; =
widows: 2; word-spacing: 0px; -webkit-border-horizontal-spacing: 0px; =
-webkit-border-vertical-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; "><div style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space; "><span class=3D"Apple-style-span" =
style=3D"border-collapse: separate; color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: medium; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; =
widows: 2; word-spacing: 0px; -webkit-border-horizontal-spacing: 0px; =
-webkit-border-vertical-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; "><div style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space; "><font class=3D"Apple-style-span" =
color=3D"#929292"><div><font class=3D"Apple-style-span" =
color=3D"#000000">#pvdisplay -m =
/dev/mapper/cryptsda</font></div><div><font class=3D"Apple-style-span" =
color=3D"#000000">File descriptor 4 left open</font></div><div><font =
class=3D"Apple-style-span" color=3D"#000000">&nbsp;&nbsp;--- Physical =
volume ---</font></div><div><font class=3D"Apple-style-span" =
color=3D"#000000">&nbsp;&nbsp;PV Name &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; /dev/mapper/cryptsda</font></div><div><font =
class=3D"Apple-style-span" color=3D"#000000">&nbsp;&nbsp;VG Name &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
fileshare</font></div><div><font class=3D"Apple-style-span" =
color=3D"#000000">&nbsp;&nbsp;PV Size &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; 931.04 GB / not usable 3.87 MB</font></div><div><font =
class=3D"Apple-style-span" color=3D"#000000">&nbsp;&nbsp;Allocatable =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; yes (but full)</font></div><div><font =
class=3D"Apple-style-span" color=3D"#000000">&nbsp;&nbsp;PE Size (KByte) =
&nbsp; &nbsp; &nbsp; 4096</font></div><div><font =
class=3D"Apple-style-span" color=3D"#000000">&nbsp;&nbsp;Total PE &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;238344</font></div><div><font =
class=3D"Apple-style-span" color=3D"#000000">&nbsp;&nbsp;Free PE &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0</font></div><div><font =
class=3D"Apple-style-span" color=3D"#000000">&nbsp;&nbsp;Allocated PE =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;238344</font></div><div><font =
class=3D"Apple-style-span" color=3D"#000000">&nbsp;&nbsp;PV UUID &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
6OfRxC-R59i-CVjX-igtB-pg4e-2qAw-OdiPSc</font></div><div><font =
class=3D"Apple-style-span" =
color=3D"#000000">&nbsp;&nbsp;&nbsp;</font></div><div><font =
class=3D"Apple-style-span" color=3D"#000000">&nbsp;&nbsp;--- Physical =
Segments ---</font></div><div><font class=3D"Apple-style-span" =
color=3D"#000000">&nbsp;&nbsp;Physical extent 0 to =
238343:</font></div><div><font class=3D"Apple-style-span" =
color=3D"#000000">&nbsp;&nbsp; &nbsp;Logical volume</font><span =
class=3D"Apple-tab-span" style=3D"white-space:pre"><font =
class=3D"Apple-style-span" color=3D"#000000">	</font></span><font =
class=3D"Apple-style-span" =
color=3D"#000000">/dev/fileshare/lv_fileshare</font></div><div><font =
class=3D"Apple-style-span" color=3D"#000000">&nbsp;&nbsp; &nbsp;Logical =
extents</font><span class=3D"Apple-tab-span" =
style=3D"white-space:pre"><font class=3D"Apple-style-span" =
color=3D"#000000">	</font></span><font class=3D"Apple-style-span" =
color=3D"#000000">0 to 238343</font></div><div><br></div></font><div =
style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; ">#pvdisplay -m =
/dev/mapper/cryptsdb</div><div style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; ">File =
descriptor 4 left open</div><div style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
">&nbsp;&nbsp;--- Physical volume ---</div><div style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space; ">&nbsp;&nbsp;PV Name &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; /dev/mapper/cryptsdb</div><div style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space; ">&nbsp;&nbsp;VG Name &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; fileshare</div><div style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
">&nbsp;&nbsp;PV Size &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
931.04 GB / not usable 3.87 MB</div><div style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
">&nbsp;&nbsp;Allocatable &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; yes (but =
full)</div><div style=3D"word-wrap: break-word; -webkit-nbsp-mode: =
space; -webkit-line-break: after-white-space; ">&nbsp;&nbsp;PE Size =
(KByte) &nbsp; &nbsp; &nbsp; 4096</div><div style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space; ">&nbsp;&nbsp;Total PE &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;238344</div><div style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
">&nbsp;&nbsp;Free PE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
0</div><div style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; ">&nbsp;&nbsp;Allocated PE &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;238344</div><div style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space; ">&nbsp;&nbsp;PV UUID &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; zCLder-PF5b-fQpy-RdMS-Ayc0-caWh-LA2Esm</div><div =
style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; ">&nbsp;&nbsp;&nbsp;</div><div =
style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; ">&nbsp;&nbsp;--- Physical =
Segments ---</div><div style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
">&nbsp;&nbsp;Physical extent 0 to 238343:</div><div style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space; ">&nbsp;&nbsp; &nbsp;Logical volume<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>/dev/fileshare/lv_fileshare</div><div style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space; ">&nbsp;&nbsp; &nbsp;Logical extents<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>238344 to =
476687</div><div><br></div><br></div></span></div></span></div></span></sp=
an>
</div>
<br><div><div>On 2009-11-05, at 10:10 AM, Ray Morris wrote:</div><br =
class=3D"Apple-interchange-newline"><blockquote type=3D"cite"><div>What =
is the output of?:<br><br>pvdisplay -m =
/dev/mapper/cryptsda<br><br><br>--<br>Ray Morris<br><a =
href=3D"mailto:support@bettercgi.com">support@bettercgi.com</a><br><br>Str=
ongbox - The next generation in site =
security:<br>http://www.bettercgi.com/strongbox/<br><br>Throttlebox - =
Intelligent Bandwidth =
Control<br>http://www.bettercgi.com/throttlebox/<br><br>Strongbox / =
Throttlebox affiliate =
program:<br>http://www.bettercgi.com/affiliates/user/register.php<br><br><=
br>On 11/05/2009 01:57:53 AM, Adam Mooz wrote:<br><blockquote =
type=3D"cite">Hello List,<br></blockquote><blockquote type=3D"cite">I =
have a fileserver that is driving me nuts at the moment. =
&nbsp;Setup:<br></blockquote><blockquote type=3D"cite">4x 1TB =
HDD's<br></blockquote><blockquote type=3D"cite">1x 320GB =
HDD<br></blockquote><blockquote type=3D"cite">They all have the same =
partition layout:<br></blockquote><blockquote type=3D"cite">512MB Swap, =
rest is LVM data.<br></blockquote><blockquote type=3D"cite">The LVM only =
contains ~400GB of data, but 2 of the TB drives report having 0 free =
PFree's:<br></blockquote><blockquote type=3D"cite"> &nbsp;PV =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VG =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fmt &nbsp;Attr PSize =
&nbsp;&nbsp;PFree<br></blockquote><blockquote type=3D"cite"> =
&nbsp;/dev/mapper/cryptsda fileshare lvm2 a- &nbsp;&nbsp;931.03G =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0<br></blockquote><blockquote type=3D"cite">=
 &nbsp;/dev/mapper/cryptsdb fileshare lvm2 a- &nbsp;&nbsp;931.03G =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0<br></blockquote><blockquote type=3D"cite">=
 &nbsp;/dev/mapper/cryptsdc fileshare lvm2 a- &nbsp;&nbsp;297.61G =
297.61G<br></blockquote><blockquote type=3D"cite"> =
&nbsp;/dev/mapper/cryptsdd fileshare lvm2 a- &nbsp;&nbsp;931.03G =
633.42G<br></blockquote><blockquote type=3D"cite"> =
&nbsp;/dev/mapper/cryptsde =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;lvm2 -- =
&nbsp;&nbsp;931.04G 931.04G<br></blockquote><blockquote type=3D"cite">I've=
 successfully managed to remove SDE from the LVM, but I need to move the =
data off SDD onto either SDA or SDB. &nbsp;When the whole system is =
mounted it properly reports having 2.1TB of free space (931 * 2 + 297). =
Is there an easy way to fix this issue?<br></blockquote><br>------quoted =
attachment------<br><blockquote =
type=3D"cite">_______________________________________________<br></blockqu=
ote><blockquote type=3D"cite">linux-lvm mailing =
list<br></blockquote><blockquote =
type=3D"cite">linux-lvm@redhat.com<br></blockquote><blockquote =
type=3D"cite">https://www.redhat.com/mailman/listinfo/linux-lvm<br></block=
quote><blockquote type=3D"cite">read the LVM HOW-TO at =
http://tldp.org/HOWTO/LVM-HOWTO/<br></blockquote><br><br>_________________=
______________________________<br>linux-lvm mailing =
list<br>linux-lvm@redhat.com<br>https://www.redhat.com/mailman/listinfo/li=
nux-lvm<br>read the LVM HOW-TO at =
http://tldp.org/HOWTO/LVM-HOWTO/<br></div></blockquote></div><br></body></=
html>=

--Apple-Mail-1--44678827--
