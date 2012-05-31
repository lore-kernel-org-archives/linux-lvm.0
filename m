Received: from [10.11.9.7] (vpn-9-7.rdu.redhat.com [10.11.9.7])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q4VJcrdB019406
	for <linux-lvm@redhat.com>; Thu, 31 May 2012 15:38:54 -0400
From: Brassow Jonathan <jbrassow@redhat.com>
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: multipart/alternative; boundary=Apple-Mail-2--591319156
Date: Thu, 31 May 2012 14:38:53 -0500
In-Reply-To: <BAY166-W60B477669A8522D41C708D86050@phx.gbl>
References: <BAY166-W60B477669A8522D41C708D86050@phx.gbl>
Message-Id: <170BBF64-BA01-4301-B81D-65DB9E0CC95D@redhat.com>
Subject: Re: [linux-lvm] LVM disappeared
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


--Apple-Mail-2--591319156
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Perhaps 'vgcfgrestore' would work to solve your problem.  You would need =
access to the backup files (/etc/lvm/backup).

 brassow

On May 29, 2012, at 6:59 AM, abdul jabbar wrote:

> Hi,
>=20
> I am going trough a peculiar problem after Linux server reboot.
>=20
> I had rebooted RHEL-5.3 server and found /var filesystem got corrupted =
and i was able to restore /var from Mondorescue image which was  taken 1 =
month back.
>=20
> I had 2 VGs with a LV configured under each VG.=20
> After reboot i lost one of my Lvs ,VG under which Lv is created =
showing " 0 logical volume(s) in volume group "VGGLOTAM-BLD8" now active =
"
> If i run pvscan i am able to see PVs under VG.
>=20
>  PV /dev/sdai        VG VGGLOTAM-BLD8   lvm2 [100.00 GB / 100.00 GB =
free]
>   PV /dev/sdah        VG VGGLOTAM-BLD8   lvm2 [100.00 GB / 100.00 GB =
free]
>   PV /dev/sdag        VG VGGLOTAM-BLD8   lvm2 [100.00 GB / 100.00 GB =
free]
>   PV /dev/sdaf        VG VGGLOTAM-BLD8   lvm2 [100.00 GB / 100.00 GB =
free]
>   PV /dev/sdae        VG VGGLOTAM-BLD8   lvm2 [100.00 GB / 100.00 GB =
free]
>=20
>=20
>=20
> Is  there any possibilty to recover my LV as it contains very critical =
data?
>=20
>=20
> Thanks in advance
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


--Apple-Mail-2--591319156
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><base href=3D"x-msg://34/"></head><body style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space; ">Perhaps 'vgcfgrestore' would work to solve your =
problem. &nbsp;You would need access to the backup files =
(/etc/lvm/backup).<div><br></div><div>&nbsp;brassow</div><div><br><div><di=
v>On May 29, 2012, at 6:59 AM, abdul jabbar wrote:</div><br =
class=3D"Apple-interchange-newline"><blockquote type=3D"cite"><span =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
font-family: Helvetica; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: 2; text-align: -webkit-auto; text-indent: 0px; text-transform: =
none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: =
0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; font-size: medium; "><div =
class=3D"hmmessage" style=3D"font-size: 10pt; font-family: Tahoma; =
"><div dir=3D"ltr">Hi,<br><br>I am going trough a peculiar problem after =
Linux server reboot.<br><br>I had rebooted RHEL-5.3 server and found =
/var filesystem got corrupted and i was able to restore /var from =
Mondorescue image which was&nbsp; taken 1 month back.<br><br>I had 2 VGs =
with a LV configured under each VG.<span =
class=3D"Apple-converted-space">&nbsp;</span><br>After reboot i lost one =
of my Lvs ,VG under which Lv is created showing " 0 logical volume(s) in =
volume group "VGGLOTAM-BLD8" now active "<br>If i run pvscan i am able =
to see PVs under VG.<br><br>&nbsp;PV =
/dev/sdai&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG =
VGGLOTAM-BLD8&nbsp;&nbsp; lvm2 [100.00 GB / 100.00 GB free]<br>&nbsp; PV =
/dev/sdah&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG =
VGGLOTAM-BLD8&nbsp;&nbsp; lvm2 [100.00 GB / 100.00 GB free]<br>&nbsp; PV =
/dev/sdag&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG =
VGGLOTAM-BLD8&nbsp;&nbsp; lvm2 [100.00 GB / 100.00 GB free]<br>&nbsp; PV =
/dev/sdaf&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG =
VGGLOTAM-BLD8&nbsp;&nbsp; lvm2 [100.00 GB / 100.00 GB free]<br>&nbsp; PV =
/dev/sdae&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG =
VGGLOTAM-BLD8&nbsp;&nbsp; lvm2 [100.00 GB / 100.00 GB =
free]<br><br><br><br>Is&nbsp; there any possibilty to recover my LV as =
it contains very critical data?<br><br><br>Thanks in =
advance<br></div>_______________________________________________<br>linux-=
lvm mailing list<br><a =
href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a =
href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.red=
hat.com/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/=
</a></div></span></blockquote></div><br></div></body></html>=

--Apple-Mail-2--591319156--
