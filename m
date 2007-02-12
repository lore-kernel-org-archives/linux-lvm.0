Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1CKBhtK013089
	for <linux-lvm@redhat.com>; Mon, 12 Feb 2007 15:11:43 -0500
Received: from web38214.mail.mud.yahoo.com (web38214.mail.mud.yahoo.com
	[209.191.124.157])
	by mx1.redhat.com (8.13.1/8.13.1) with SMTP id l1CKBaw1020674
	for <linux-lvm@redhat.com>; Mon, 12 Feb 2007 15:11:36 -0500
Date: Mon, 12 Feb 2007 12:11:30 -0800 (PST)
From: Sean McGlynn <sean_mcglynn@yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-360077062-1171311090=:73875"
Message-ID: <682963.73875.qm@web38214.mail.mud.yahoo.com>
Subject: [linux-lvm] Extending the Root Volume with LVM
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
To: linux-lvm@redhat.com

--0-360077062-1171311090=:73875
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

=0A=0AI am working with =0ARHEL 4 Update 4.  When initially installing the =
OS I allowed the installation to =0Aautomatically partition the disk, and i=
t used LVM to create a logical volume to =0Amount the root file system.  Th=
e only other logical volume it created was for =0Athe swap file.=0A=0A =0A=
=0ANow, as an =0Aexperiment, I am attempting to extend the volume group and=
 logical volume on =0Awhich root is mounted.  Everything appeared to be goi=
ng smoothly (extending the =0AVG, extending the LV, doing a vgchange, and t=
hen a lvm lvchange), but I am now =0Aat the point where I want to run e2fsc=
k to check the file system and resize2fs =0Ato resize the files system to r=
ealize the added space, and I can't do either =0Abecause the volume is moun=
ted, and cannot be unmounted.=0A=0A =0A=0AI've read a few =0Asuggestions su=
ch as using the installation media to go in in rescue mode, but =0Anothing =
seems to do the trick.  I also read something that said that you cannot =0A=
extend the root volume, and that you shouldn't have to.  This appears to be=
 more =0Aaccurate than anything else I've read.=0A=0A =0A=0AIs it the case =
that =0Ayou cannot extent the root volume, and if so, why would RHEL config=
ure the root =0Avolume using LVM if you can't?  If I am missing something, =
I would greatly =0Aappreciate someone pointing out what I'm missing.=0A=0A =
=0A=0AThank =0Ayou.=0A=0A=0A=0A=0A=0A =0A__________________________________=
__________________________________________________=0ADon't pick lemons.=0AS=
ee all the new 2007 cars at Yahoo! Autos.=0Ahttp://autos.yahoo.com/new_cars=
.html 
--0-360077062-1171311090=:73875
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<html><head><style type=3D"text/css"><!-- DIV {margin:0px;} --></style></he=
ad><body><div style=3D"font-family:times new roman, new york, times, serif;=
font-size:12pt"><div>=0A<p><font face=3D"Arial" size=3D"2">=0A<div><span cl=
ass=3D"984012114-09022007"><font face=3D"Arial" size=3D"2">I am working wit=
h =0ARHEL 4 Update 4.&nbsp; When initially installing the OS I allowed the =
installation to =0Aautomatically partition the disk, and it used LVM to cre=
ate a logical volume to =0Amount the root file system.&nbsp; The only other=
 logical volume it created was for =0Athe swap file.</font></span></div>=0A=
<div><span class=3D"984012114-09022007"></span>&nbsp;</div>=0A<div><span cl=
ass=3D"984012114-09022007"><font face=3D"Arial" size=3D"2">Now, as an =0Aex=
periment, I am attempting to extend the volume group and logical volume on =
=0Awhich root is mounted.&nbsp; Everything appeared to be&nbsp;going smooth=
ly (extending the =0AVG, extending the LV, doing a vgchange, and then a lvm=
 lvchange), but I am now =0Aat the point where I want to run e2fsck to chec=
k the file system and resize2fs =0Ato resize the files system to realize th=
e added space, and I can't do either =0Abecause the volume is mounted, and =
cannot be unmounted.</font></span></div>=0A<div><span class=3D"984012114-09=
022007"></span>&nbsp;</div>=0A<div><span class=3D"984012114-09022007"><font=
 face=3D"Arial" size=3D"2">I've read a few =0Asuggestions such as using the=
 installation media to go in in rescue mode, but =0Anothing seems to do the=
 trick.&nbsp; I also read something that said that you cannot =0Aextend the=
 root volume, and that you shouldn't have to.&nbsp; This appears to be more=
 =0Aaccurate than anything else I've read.</font></span></div>=0A<div><span=
 class=3D"984012114-09022007"></span>&nbsp;</div>=0A<div><span class=3D"984=
012114-09022007"><font face=3D"Arial" size=3D"2">Is it the case that =0Ayou=
 cannot extent the root volume, and if so, why would RHEL configure the roo=
t =0Avolume using LVM if you can't?&nbsp; If I am missing something, I woul=
d greatly =0Aappreciate someone pointing out what I'm missing.</font></span=
></div>=0A<div><span class=3D"984012114-09022007"></span>&nbsp;</div>=0A<di=
v><span class=3D"984012114-09022007"><font face=3D"Arial" size=3D"2">Thank =
=0Ayou.</font></span></div></font></p></div></div><br>=0A=0A=0A <hr size=3D=
1>Looking for earth-friendly autos? <br> <a href=3D"http://autos.yahoo.com/=
green_center/;_ylc=3DX3oDMTE4MGw4Z2hlBF9TAzk3MTA3MDc2BHNlYwNtYWlsdGFncwRzbG=
sDZ3JlZW5jZW50ZXI-">Browse Top Cars by "Green Rating"</a> at Yahoo! Autos' =
Green Center.  </body></html>
--0-360077062-1171311090=:73875--
