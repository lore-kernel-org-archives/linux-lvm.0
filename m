Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q9HKcCm7019151
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2012 16:38:12 -0400
Received: from nm14-vm4.bullet.mail.sg3.yahoo.com
	(nm14-vm4.bullet.mail.sg3.yahoo.com [106.10.149.35])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q9HKc8nK002492
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2012 16:38:10 -0400
References: <CAHz-cgENGWywiMqcooivu28tRM1TTzMAP-GKQit6ysH9HLOzbg@mail.gmail.com>
Message-ID: <1350506288.52574.YahooMailNeo@web192304.mail.sg3.yahoo.com>
Date: Thu, 18 Oct 2012 04:38:08 +0800 (SGT)
From: Tinni <t_inni@yahoo.co.in>
In-Reply-To: <CAHz-cgENGWywiMqcooivu28tRM1TTzMAP-GKQit6ysH9HLOzbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="798208272-1872970080-1350506288=:52574"
Subject: [linux-lvm] Need help with lvm
Reply-To: Tinni <t_inni@yahoo.co.in>,
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

--798208272-1872970080-1350506288=:52574
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

=0A=0AHi ,=0A=0AI have one server=A0 rhel4 42 bit.=0A=0Aone lvm file system=
=A0 is=A0 mounted=A0 ..=0A=0ABut not getting the=A0 volume group=A0 neither=
 the lvm while checking with=0Avgdisplay .. only getting the pv name..=0A=
=0AThe existence of the volume group there=A0 in the=A0 /etc/lvm/backup and=
=0A/etc/lvm/archive directory..=0A=0ANot sure how come the lvm=A0 is mounte=
d when the vol. group is not in=0Athe active state..=0A=0AHEre are the moun=
ted file system:=0A=0A=0A=0A/dev/mapper/back2-apps1=A0=A0 50G 553M 47G 2% /=
apps/apps1=0A/dev/mapper/back2-apps2=A0=A0 9.9G 480M 8.9G 6% /apps/apps2=0A=
=0A=0Awhen applying vgscan /lvscan command ,not getting=A0 any result of th=
e volume group back2=0Aat all..=0A=0AThe behavior is , kind of somebody dea=
ctivated the volume group and it is not activating=0Awhile the=A0 lvms are =
mounted.=A0 But the question is how come a volume group will be=0Ade activa=
ted=A0 when the lvm is mounted=A0 Not sure it is the behavior of=A0 rhel4 3=
2 bit or not.=0A=0AKindly give me some advice..=0AThanks again=0A=0A=0A=0A=
=0A________________________________
--798208272-1872970080-1350506288=:52574
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"color:#000; background-color:#fff; font-family:ti=
mes new roman, new york, times, serif;font-size:12pt"><br><div><span>Hi ,<b=
r><br>I have one server&nbsp; rhel4 42 bit.<br><br>one lvm file system&nbsp=
; is&nbsp; mounted&nbsp; ..<br><br>But not getting the&nbsp; volume group&n=
bsp; neither the lvm while checking with<br>vgdisplay .. only getting the p=
v name..<br><br>The existence of the volume group there&nbsp; in the&nbsp; =
/etc/lvm/backup and<br>/etc/lvm/archive directory..<br><br>Not sure how com=
e the lvm&nbsp; is mounted when the vol. group is not in<br>the active stat=
e..<br><br>HEre are the mounted file system:<br><br><br><br>/dev/mapper/bac=
k2-apps1&nbsp;&nbsp; 50G 553M 47G 2% /apps/apps1<br>/dev/mapper/back2-apps2=
&nbsp;&nbsp; 9.9G 480M 8.9G 6% /apps/apps2<br><br><br>when applying vgscan =
/lvscan command ,not getting&nbsp; any result of the volume group back2<br>=
at all..<br><br>The behavior is , kind of somebody deactivated the
 volume group and it is not activating<br>while the&nbsp; lvms are mounted.=
&nbsp; But the question is how come a volume group will be<br>de activated&=
nbsp; when the lvm is mounted&nbsp; Not sure it is the behavior of&nbsp; rh=
el4 32 bit or not.<br><br>Kindly give me some advice..<br>Thanks again<br><=
br></span></div><div><br></div>  <div style=3D"font-family: times new roman=
, new york, times, serif; font-size: 12pt;"> <div style=3D"font-family: tim=
es new roman, new york, times, serif; font-size: 12pt;"> <div dir=3D"ltr"> =
<font face=3D"Arial" size=3D"2"> <hr size=3D"1"><b><span style=3D"font-weig=
ht:bold;"></span></b></font><br> </div></div> </div>  </div></body></html>
--798208272-1872970080-1350506288=:52574--
