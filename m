Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qAEBMew8000367
	for <linux-lvm@redhat.com>; Wed, 14 Nov 2012 06:22:40 -0500
Received: from awh1.active.ee (alfa.active.ee [194.204.30.36])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qAEBMama021891
	for <linux-lvm@redhat.com>; Wed, 14 Nov 2012 06:22:37 -0500
From: Andres Toomsalu <andres@active.ee>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_80B1973E-BC98-40F1-A406-9FD3DAE71484"
Date: Wed, 14 Nov 2012 13:22:28 +0200
In-Reply-To: <CAM9BRYTk-qAvfaC5H0fObo+btCQrY5zguJicbKA+GVKbGUy11g@mail.gmail.com>
References: <CAM9BRYT4hi_JsnXA4BGzA5=N1FjecM3ECxo9b_FQo=GPMLXBsw@mail.gmail.com>
	<CAM9BRYTk-qAvfaC5H0fObo+btCQrY5zguJicbKA+GVKbGUy11g@mail.gmail.com>
Message-Id: <9ECF78D1-BDB5-44A1-9629-2C24BDC39611@active.ee>
Subject: Re: [linux-lvm] strange usage stats for thin LV
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--Apple-Mail=_80B1973E-BC98-40F1-A406-9FD3DAE71484
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1

Im trying with latest 2.6.32-279.11.1.el6 RHEL6.3 kernel but still no =
luck - FITRIM ioctl failed: Operation not supported.
Is there any way to discard/trim unused blocks with RHEL6.3?
What happens if no cleanup is done and blocks count reaches 100%?=20

Regards,
--=20
----------------------------------------------
Andres Toomsalu
On 11.11.2012, at 10:22, Vitaly Yakovenko wrote:

> Hi,
>=20
> I have the problem with fstrim too.
>=20
> some details:
>=20
> uname -a
> Linux test.local 2.6.32-279.14.1.el6.x86_64 #1 SMP Tue Nov 6 23:43:09 =
UTC 2012 x86_64 x86_64 x86_64 GNU/Linux
>=20
>=20
> mount
> /dev/mapper/VolGroup00-lv_root on / type ext4 (rw)
> proc on /proc type proc (rw)
> sysfs on /sys type sysfs (rw)
> devpts on /dev/pts type devpts (rw,gid=3D5,mode=3D620)
> tmpfs on /dev/shm type tmpfs (rw)
> /dev/md0 on /boot type ext4 (rw)
> none on /proc/sys/fs/binfmt_misc type binfmt_misc (rw)
> /dev/mapper/VolGroup00-lv_test1 on /mnt/test1 type ext4 (rw)
> /dev/mapper/VolGroup00-lv_test2 on /mnt/test2 type ext4 (rw)
> /dev/mapper/VolGroup00-lv_test5 on /mnt/test5 type xfs (rw)
>=20
>=20
> df -h
> Filesystem            Size  Used Avail Use% Mounted on
> /dev/mapper/VolGroup00-lv_root
>                        20G  2.3G   17G  13% /
> tmpfs                 1.6G     0  1.6G   0% /dev/shm
> /dev/md0               99M   27M   67M  29% /boot
> /dev/mapper/VolGroup00-lv_test1
>                        40G  2.6G   35G   7% /mnt/test1
> /dev/mapper/VolGroup00-lv_test2
>                       4.0G  1.2G  2.6G  32% /mnt/test2
> /dev/mapper/VolGroup00-lv_test5
>                       3.0G  725M  2.3G  24% /mnt/test5
>=20
>=20
> lvs -a -o+metadata_percent
>   LV                VG         Attr     LSize   Pool      Origin Data% =
 Move Log Copy%  Convert Meta%=20
>   lv_native         VolGroup00 -wi-a---   5.00g                        =
                              =20
>   lv_root           VolGroup00 -wi-ao--  20.00g                        =
                              =20
>   lv_swap           VolGroup00 -wi-ao--   4.00g                        =
                              =20
>   lv_test1          VolGroup00 Vwi-aotz  40.00g thin_pool         =
27.73                              =20
>   lv_test2          VolGroup00 Vwi-aotz   4.00g thin_pool         =
98.61                              =20
>   lv_test5          VolGroup00 Vwi-aotz   3.00g thin_pool         =
45.40                              =20
>   thin_pool         VolGroup00 twi-a-tz 100.00g                   =
16.40                           8.47
>   [thin_pool_tdata] VolGroup00 Twi-aot- 100.00g                        =
                              =20
>   [thin_pool_tmeta] VolGroup00 ewi-aot- 100.00m
>=20
>=20
> This test server (CentOS 6.3 - not install from scratch). I was =
updated this server from 6.2 version:
>=20
> last | tail -3
> reboot   system boot  2.6.32-220.el6.x Mon Jan 23 16:03 - 16:04  =
(00:01)   =20
> wtmp begins Mon Jan 23 16:03:26 2012
>=20
>=20
> I test only ext4 fs partitions.
> When I used fstrim I had next error:
>=20
> fstrim /mnt/test1
> fstrim: /mnt/test1: FITRIM ioctl failed: Operation not supported
>=20
> I want retrieve free space from the ext4 fs to the total free space of =
thin_pool after delete files on the ext4 fs  (lv_test1).I will have more =
free space for another thin LV.
> Is it possible to get it?
>=20
> Thanks in advance.
>=20
> --=20
> Best regards,
> Vitaly Yakovenko |
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--Apple-Mail=_80B1973E-BC98-40F1-A406-9FD3DAE71484
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=iso-8859-1

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
"><div>Im trying with latest&nbsp;<span style=3D"color: rgb(0, 0, 0); =
font-family: sans-serif; font-size: 12.666666984558105px; font-style: =
normal; font-variant: normal; font-weight: normal; letter-spacing: =
normal; line-height: 19.19999885559082px; orphans: 2; text-align: left; =
text-indent: 0px; text-transform: none; white-space: normal; widows: 2; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); =
display: inline !important; float: none;">2.6.32-279.11.1.el6 RHEL6.3 =
kernel but still no luck -&nbsp;FITRIM ioctl failed: Operation not =
supported.</span></div><div><span style=3D"color: rgb(0, 0, 0); =
font-family: sans-serif; font-size: 12.666666984558105px; font-style: =
normal; font-variant: normal; font-weight: normal; letter-spacing: =
normal; line-height: 19.19999885559082px; orphans: 2; text-align: left; =
text-indent: 0px; text-transform: none; white-space: normal; widows: 2; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); =
display: inline !important; float: none;">Is there any way to =
discard/trim unused blocks with RHEL6.3?</span></div><div><span =
style=3D"color: rgb(0, 0, 0); font-family: sans-serif; font-size: =
12.666666984558105px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: =
19.19999885559082px; orphans: 2; text-align: left; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
background-color: rgb(255, 255, 255); display: inline !important; float: =
none;">What happens if no cleanup is done and blocks count reaches =
100%?&nbsp;</span></div><div><span style=3D"color: rgb(0, 0, 0); =
font-family: sans-serif; font-size: 12.666666984558105px; font-style: =
normal; font-variant: normal; font-weight: normal; letter-spacing: =
normal; line-height: 19.19999885559082px; orphans: 2; text-align: left; =
text-indent: 0px; text-transform: none; white-space: normal; widows: 2; =
word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); =
display: inline !important; float: =
none;"><br></span></div>Regards,<br><div>
<div><div style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: =
0px; margin-left: 0px; font: normal normal normal 12px/normal Helvetica; =
">--&nbsp;</div><div style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font: normal normal normal =
12px/normal Helvetica; =
">----------------------------------------------</div><div =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font: normal normal normal 12px/normal Helvetica; =
">Andres Toomsalu</div></div></div><div><div>On 11.11.2012, at 10:22, =
Vitaly Yakovenko wrote:</div><br =
class=3D"Apple-interchange-newline"><blockquote type=3D"cite"><font =
face=3D"arial, sans-serif">Hi,</font><div =
class=3D"gmail_quote"><div><div><font face=3D"arial, =
sans-serif"><br></font></div><div><font face=3D"arial, sans-serif">I =
have the problem with fstrim too.</font></div><div><font face=3D"arial, =
sans-serif"><br>


</font></div><div><font face=3D"arial, sans-serif">some =
details:</font></div><div><font face=3D"arial, =
sans-serif"><br></font></div><div><font face=3D"arial, =
sans-serif"><div>uname -a</div><div>Linux test.local =
2.6.32-279.14.1.el6.x86_64 #1 SMP Tue Nov 6 23:43:09 UTC 2012 x86_64 =
x86_64 x86_64 GNU/Linux</div>


=
<div><br></div><div><br></div><div><div>mount</div><div>/dev/mapper/VolGro=
up00-lv_root on / type ext4 (rw)</div><div>proc on /proc type proc =
(rw)</div><div>sysfs on /sys type sysfs (rw)</div><div>devpts on =
/dev/pts type devpts (rw,gid=3D5,mode=3D620)</div>


<div>tmpfs on /dev/shm type tmpfs (rw)</div><div>/dev/md0 on /boot type =
ext4 (rw)</div><div>none on /proc/sys/fs/binfmt_misc type binfmt_misc =
(rw)</div><div>/dev/mapper/VolGroup00-lv_test1 on /mnt/test1 type ext4 =
(rw)</div>


<div>/dev/mapper/VolGroup00-lv_test2 on /mnt/test2 type ext4 =
(rw)</div><div>/dev/mapper/VolGroup00-lv_test5 on /mnt/test5 type xfs =
(rw)</div></div><div><br></div><div><br></div><div><div>df =
-h</div><div>Filesystem &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Size =
&nbsp;Used Avail Use% Mounted on</div>


<div>/dev/mapper/VolGroup00-lv_root</div><div>&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;20G =
&nbsp;2.3G &nbsp; 17G &nbsp;13% /</div><div>tmpfs &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 1.6G &nbsp; &nbsp; 0 &nbsp;1.6G =
&nbsp; 0% /dev/shm</div><div>/dev/md0 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; 99M &nbsp; 27M &nbsp; 67M &nbsp;29% /boot</div>

<div>
/dev/mapper/VolGroup00-lv_test1</div><div>&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;40G &nbsp;2.6G =
&nbsp; 35G &nbsp; 7% =
/mnt/test1</div><div>/dev/mapper/VolGroup00-lv_test2</div><div>&nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
4.0G &nbsp;1.2G &nbsp;2.6G &nbsp;32% =
/mnt/test2</div><div>/dev/mapper/VolGroup00-lv_test5</div>


<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; 3.0G &nbsp;725M &nbsp;2.3G &nbsp;24% =
/mnt/test5</div></div><div><br></div><div><br></div><div><div>lvs -a =
-o+metadata_percent</div><div>&nbsp; LV &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;VG &nbsp; &nbsp; &nbsp; &nbsp; Attr &nbsp; =
&nbsp; LSize &nbsp; Pool &nbsp; &nbsp; &nbsp;Origin Data% &nbsp;Move Log =
Copy% &nbsp;Convert Meta%&nbsp;</div>


<div>&nbsp; lv_native &nbsp; &nbsp; &nbsp; &nbsp; VolGroup00 -wi-a--- =
&nbsp; 5.00g &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;</div><div>&nbsp; lv_root &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
VolGroup00 -wi-ao-- &nbsp;20.00g &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;&nbsp;</div>


<div>&nbsp; lv_swap &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; VolGroup00 =
-wi-ao-- &nbsp; 4.00g &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;</div><div>&nbsp; lv_test1 &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;VolGroup00 Vwi-aotz &nbsp;40.00g thin_pool &nbsp; &nbsp; &nbsp; =
&nbsp; 27.73 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>


<div>&nbsp; lv_test2 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;VolGroup00 =
Vwi-aotz &nbsp; 4.00g thin_pool &nbsp; &nbsp; &nbsp; &nbsp; 98.61 &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div><div>&nbsp; lv_test5 &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;VolGroup00 Vwi-aotz &nbsp; 3.00g thin_pool =
&nbsp; &nbsp; &nbsp; &nbsp; 45.40 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;</div>


<div>&nbsp; thin_pool &nbsp; &nbsp; &nbsp; &nbsp; VolGroup00 twi-a-tz =
100.00g &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
16.40 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; 8.47</div><div>&nbsp; [thin_pool_tdata] =
VolGroup00 Twi-aot- 100.00g &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;&nbsp;</div>


<div>&nbsp; [thin_pool_tmeta] VolGroup00 ewi-aot- =
100.00m</div></div><div><br></div><div><br></div></font></div><div><font =
face=3D"arial, sans-serif">This test server (CentOS 6.3 - not install =
from scratch). I was updated this server from 6.2 version:</font></div>


<div><span =
style=3D"font-family:arial,sans-serif"><br></span></div><div><span =
style=3D"font-family:arial,sans-serif">last | tail -3</span></div><span =
style=3D""><div>
<font face=3D"arial, sans-serif"><div>reboot &nbsp; system boot =
&nbsp;2.6.32-220.el6.x Mon Jan 23 16:03 - 16:04 &nbsp;(00:01) &nbsp; =
&nbsp;</div><div>wtmp begins Mon Jan 23 16:03:26 =
2012</div><div><br></div><div><br></div><div>I test only ext4 fs =
partitions.</div>


<div>When I used fstrim I had next =
error:</div><div><br></div><div><div>fstrim /mnt/test1</div><div>fstrim: =
/mnt/test1: FITRIM ioctl failed: Operation not =
supported</div></div><div><br></div><div>I want retrieve free space from =
the ext4 fs to the total free space of thin_pool after delete files on =
the ext4 fs&nbsp;&nbsp;(lv_test1).I will have more free space for =
another&nbsp;thin LV.</div>


<div>Is it possible to get it?</div></font><font face=3D"arial, =
sans-serif"><div><br></div><div>Thanks in advance.</div><span =
class=3D"HOEnZb"><font =
color=3D"#888888"><div><br></div></font></span></font></div><span =
class=3D"HOEnZb"><font color=3D"#888888"><font color=3D"#888888" =
face=3D"arial, sans-serif">--&nbsp;</font></font></span></span><span =
class=3D"HOEnZb"><font color=3D"#888888"><br =
style=3D"color:rgb(136,136,136);font-size:13px;font-family:arial,sans-seri=
f">


<div =
style=3D"color:rgb(136,136,136);font-size:13px;font-family:arial,sans-seri=
f">Best regards,</div><div =
style=3D"color:rgb(136,136,136);font-size:13px;font-family:arial,sans-seri=
f">
<span style=3D"color:rgb(34,34,34)">Vitaly Yakovenko</span><font =
color=3D"#222222">&nbsp;|</font></div></font></span></div>
</div><br>
_______________________________________________<br>linux-lvm mailing =
list<br><a =
href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>https://w=
ww.redhat.com/mailman/listinfo/linux-lvm<br>read the LVM HOW-TO at =
http://tldp.org/HOWTO/LVM-HOWTO/</blockquote></div><br></body></html>=

--Apple-Mail=_80B1973E-BC98-40F1-A406-9FD3DAE71484--
