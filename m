Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r3QD0fRp021158
	for <linux-lvm@redhat.com>; Fri, 26 Apr 2013 09:00:41 -0400
Received: from nm21.bullet.mail.bf1.yahoo.com (nm21.bullet.mail.bf1.yahoo.com
	[98.139.212.180])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r3QD0ZIF025893
	for <linux-lvm@redhat.com>; Fri, 26 Apr 2013 09:00:35 -0400
References: <CAJbV6UOaAHcrP8272Jtbb2Yo8edk7P4=Evr4iHxVY3hM2J-Psg@mail.gmail.com>
Message-ID: <1366981234.50550.YahooMailNeo@web142605.mail.bf1.yahoo.com>
Date: Fri, 26 Apr 2013 06:00:34 -0700 (PDT)
From: Venkata rama krishna Boddu <venkat.boddu@ymail.com>
In-Reply-To: <CAJbV6UOaAHcrP8272Jtbb2Yo8edk7P4=Evr4iHxVY3hM2J-Psg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="1082104826-1543189253-1366981234=:50550"
Subject: Re: [linux-lvm] determining boot disk name(/dev/sd...) on RHEL LVM
Reply-To: Venkata rama krishna Boddu <venkat.boddu@ymail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

--1082104826-1543189253-1366981234=:50550
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Following two command worked for me.=0A=0A$ dmsetup ls --tree=0Avg_node-lv_=
swap (253:1)=0A=C2=A0=E2=94=94=E2=94=80 (8:2)=0Avg_node-lv_root (253:0)=0A=
=C2=A0=E2=94=94=E2=94=80 (8:2)=0A$ ls -la /dev/ | grep "8,=C2=A0=C2=A0 2"=
=0Abrw-rw----=C2=A0=C2=A0 1 root disk=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8,=C2=
=A0=C2=A0 2 Apr 24 15:42 sda2=0A=0A=C2=A0=0AThanks=0AVenkat=0AMobile: +91-9=
503043606=0A=0A=0A________________________________=0A From: siva krishna <h=
isivakrishna@gmail.com>=0ATo: linux-lvm@redhat.com =0ASent: Friday, 26 Apri=
l 2013 2:49 PM=0ASubject: [linux-lvm] determining boot disk name(/dev/sd...=
) on RHEL LVM=0A =0A=0A=0AHi all,=0A=C2=A0=0Ais there a way to determine th=
e device name (eg: /dev/sda, /dev/sdb)=0Aon lvm partitioned disks, =C2=A0wh=
en the os is booted from the lvm partitioned disk=0Aand there are also mult=
iple disks connected which are having lvm partions with same volume group n=
ames as the primary disk.=0A=C2=A0=0Ai tried doing vgdisplay=0A=C2=A0and th=
en correlating it's output with cat /etc/fstab, cat /etc/cmdline=0A=C2=A0=
=0Abut there are multiple volume groups having the same name so can't find =
from which volume the RHEL is booting=0A=C2=A0=0AThanks=0Asiva=0A__________=
_____________________________________=0Alinux-lvm mailing list=0Alinux-lvm@=
redhat.com=0Ahttps://www.redhat.com/mailman/listinfo/linux-lvm=0Aread the L=
VM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
--1082104826-1543189253-1366981234=:50550
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"color:#000; background-color:#fff; font-family:Co=
urier New, courier, monaco, monospace, sans-serif;font-size:10pt">Following=
 two command worked for me.<br><br>$ dmsetup ls --tree<br>vg_node-lv_swap (=
253:1)<br>&nbsp;=E2=94=94=E2=94=80 (8:2)<br>vg_node-lv_root (253:0)<br>&nbs=
p;=E2=94=94=E2=94=80 (8:2)<br>$ ls -la /dev/ | grep "8,&nbsp;&nbsp; 2"<br>b=
rw-rw----&nbsp;&nbsp; 1 root disk&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 8,&nbsp;&nb=
sp; 2 Apr 24 15:42 sda2<div><span></span></div><div>&nbsp;</div><div>Thanks=
<br>Venkat<br>Mobile: +91-9503043606</div><div><br></div>  <div style=3D"fo=
nt-family: Courier New, courier, monaco, monospace, sans-serif; font-size: =
10pt;"> <div style=3D"font-family: times new roman, new york, times, serif;=
 font-size: 12pt;"> <div dir=3D"ltr"> <hr size=3D"1">  <font face=3D"Arial"=
 size=3D"2"> <b><span style=3D"font-weight:bold;">From:</span></b> siva kri=
shna &lt;hisivakrishna@gmail.com&gt;<br> <b><span style=3D"font-weight: bol=
d;">To:</span></b>
 linux-lvm@redhat.com <br> <b><span style=3D"font-weight: bold;">Sent:</spa=
n></b> Friday, 26 April 2013 2:49 PM<br> <b><span style=3D"font-weight: bol=
d;">Subject:</span></b> [linux-lvm] determining boot disk name(/dev/sd...) =
on RHEL LVM<br> </font> </div> <div class=3D"y_msg_container"><br><div id=
=3D"yiv9591538455"><div>Hi all,</div>=0A<div>&nbsp;</div>=0A<div>is there a=
 way to determine the device name (eg: /dev/sda, /dev/sdb)</div>=0A<div>on =
lvm partitioned disks, &nbsp;when the os is booted from the lvm partitioned=
 disk</div>=0A<div>and there are also multiple disks connected which are ha=
ving lvm partions with same volume group names as the primary disk.</div>=
=0A<div>&nbsp;</div>=0A<div>i tried doing vgdisplay</div>=0A<div>&nbsp;and =
then correlating it's output with cat /etc/fstab, cat /etc/cmdline</div>=0A=
<div>&nbsp;</div>=0A<div>but there are multiple volume groups having the sa=
me name so can't find from which volume the RHEL is booting</div>=0A<div>&n=
bsp;</div>=0A<div>Thanks</div>=0A<div>siva</div></div><br>_________________=
______________________________<br>linux-lvm mailing list<br><a ymailto=3D"m=
ailto:linux-lvm@redhat.com" href=3D"mailto:linux-lvm@redhat.com">linux-lvm@=
redhat.com</a><br><a href=3D"https://www.redhat.com/mailman/listinfo/linux-=
lvm" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a=
><br>read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" ta=
rget=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br><br></div> </div> <=
/div>  </div></body></html>
--1082104826-1543189253-1366981234=:50550--
