Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q498NGqR021156
	for <linux-lvm@redhat.com>; Wed, 9 May 2012 04:23:16 -0400
Received: from nm28.bullet.mail.ne1.yahoo.com (nm28.bullet.mail.ne1.yahoo.com
	[98.138.90.91])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id q498NFww022559
	for <linux-lvm@redhat.com>; Wed, 9 May 2012 04:23:15 -0400
Message-ID: <1336551794.47045.YahooMailNeo@web120604.mail.ne1.yahoo.com>
Date: Wed, 9 May 2012 01:23:14 -0700 (PDT)
From: Venkata rama krishna Boddu <venkat.boddu@ymail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="708812334-907748350-1336551794=:47045"
Subject: [linux-lvm] LVM: device-mapper: resume ioctl failed
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

--708812334-907748350-1336551794=:47045
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi All.,=0A=0ASometimes(very rarely), I'm receiving the following error mes=
sage from the lvm, when I'm creating the Logical Volumes=0A=0AAny Idea, why=
 these error messages are generating.=0A=0A=0A[root@sfqalinux4 ~]# date; lv=
create -L 3g rhel62_multipv =0AWed May=A0 9 13:14:04 IST 2012=0A=A0 device-=
mapper: resume ioctl failed: Invalid argument=0A=A0 Unable to resume rhel62=
_multipv-lvol0 (253:0)=0A=A0 Failed to activate new LV.=0A=A0root@sfqalinux=
4 ~]# =0A=0A=0AThanks=0AVenkat=0AMobile: +91-9503043606
--708812334-907748350-1336551794=:47045
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"color:#000; background-color:#fff; font-family:Co=
urier New, courier, monaco, monospace, sans-serif;font-size:10pt"><div>Hi A=
ll.,</div><div><br></div><div>Sometimes(very rarely), I'm receiving the fol=
lowing error message from the lvm, when I'm creating the Logical Volumes<br=
></div><div>Any Idea, why these error messages are generating.<br></div><di=
v><br></div><div>[root@sfqalinux4 ~]# date; lvcreate -L 3g rhel62_multipv <=
br>Wed May&nbsp; 9 13:14:04 IST 2012<br>&nbsp; device-mapper: resume ioctl =
failed: Invalid argument<br>&nbsp; Unable to resume rhel62_multipv-lvol0 (2=
53:0)<br>&nbsp; Failed to activate new LV.<br>&nbsp;root@sfqalinux4 ~]# <br=
><br><span></span></div><div>Thanks<br>Venkat<br>Mobile: +91-9503043606</di=
v></div></body></html>
--708812334-907748350-1336551794=:47045--
