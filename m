Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m384oueJ023233
	for <linux-lvm@redhat.com>; Tue, 8 Apr 2008 00:50:56 -0400
Received: from rediffmail.com (f4mail-235-129.rediffmail.com [202.137.235.129])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id m384oehJ014171
	for <linux-lvm@redhat.com>; Tue, 8 Apr 2008 00:50:41 -0400
Date: 8 Apr 2008 04:52:21 -0000
Message-ID: <20080408045221.6115.qmail@f4mail-235-129.rediffmail.com>
MIME-Version: 1.0
From: "umesh susvirkar" <susvirkar_3616@rediffmail.com>
Content-type: multipart/alternative;
	boundary="Next_1207630341---0-202.137.235.129-6113"
Subject: [linux-lvm] Problem in mounting LVM1 filesystem on RHEL AS 4.4
Reply-To: umesh susvirkar <susvirkar_3616@rediffmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

 This is a multipart mime message


--Next_1207630341---0-202.137.235.129-6113
Content-type: text/plain;
	charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

  =0Awe have two server connected to same storage.=0A=0Aserver app1 version=
 RHEL AS 3.4=0Aserver app2 version RHEL AS 4.4=0A=0AI have created a filesy=
stem on  app1 and same filesystem i am mounting on app2,but its giving me f=
ollowing error.=0A=0A  LV lvol1: inconsistent LE count 96 !=3D 192=0A  Inte=
rnal error: LV segments corrupted in lvol1.=0A  PV /dev/sdi   VG app_vg02  =
 lvm1 [15.66 GB / 0    free]=0A  PV /dev/sdj   VG app_vg02   lvm1 [15.66 GB=
 / 0    free]=0A  Total: 2 [31.31 GB] / in use: 2 [31.31 GB] / in no VG: 0 =
[0   ]=0A=0ABut i am able to mount this vg on other server with RHEL AS 3.4=
 verion.=0A=0AOnly diff is that LVM version.=0A
--Next_1207630341---0-202.137.235.129-6113
Content-type: text/html;
	charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<P>=0A&nbsp; <BR>=0Awe have two server connected to same storage.<BR>=0A<BR=
>=0Aserver app1 version RHEL AS 3.4<BR>=0Aserver app2 version RHEL AS 4.4<B=
R>=0A<BR>=0AI have created a filesystem on&nbsp; app1 and same filesystem i=
 am mounting on app2,but its giving me following error.<BR>=0A<BR>=0A&nbsp;=
 LV lvol1: inconsistent LE count 96 !=3D 192<BR>=0A&nbsp; Internal error: L=
V segments corrupted in lvol1.<BR>=0A&nbsp; PV /dev/sdi&nbsp;  VG app_vg02&=
nbsp;  lvm1 [15.66 GB / 0&nbsp; &nbsp; free]<BR>=0A&nbsp; PV /dev/sdj&nbsp;=
  VG app_vg02&nbsp;  lvm1 [15.66 GB / 0&nbsp; &nbsp; free]<BR>=0A&nbsp; Tot=
al: 2 [31.31 GB] / in use: 2 [31.31 GB] / in no VG: 0 [0&nbsp;  ]<BR>=0A<BR=
>=0ABut i am able to mount this vg on other server with RHEL AS 3.4 verion.=
<BR>=0A<BR>=0AOnly diff is that LVM version.<BR>=0A=0A</P>=0A<br><br>=0A<Ta=
ble border=3D0 Width=3D644 Height=3D57 cellspacing=3D0 cellpadding=3D0 styl=
e=3D'font-family:Verdana;font-size:11px;line-height:15px;'><TR><td><a href=
=3D'http://adworks.rediff.com/cgi-bin/AdWorks/click.cgi/www.rediff.com/sign=
ature-home.htm/1050715198@Middle5/2083980_2076545/2084124/1?PARTNER=3D3&OAS=
_QUERY=3Dnull' target=3Dnew ><img src =3D'http://imadworks.rediff.com/cgi-b=
in/AdWorks/adimage.cgi/2083980_2076545/creative_2084124.gif'  alt=3D'TJ Mat=
rix'  border=3D0></a></td></TR></Table>
--Next_1207630341---0-202.137.235.129-6113--
