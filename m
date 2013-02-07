Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r17CgJ7Q012360
	for <linux-lvm@redhat.com>; Thu, 7 Feb 2013 07:42:20 -0500
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r17CgGRZ022110
	for <linux-lvm@redhat.com>; Thu, 7 Feb 2013 07:42:17 -0500
Received: by mail-lb0-f169.google.com with SMTP id m4so2088878lbo.28
	for <linux-lvm@redhat.com>; Thu, 07 Feb 2013 04:42:15 -0800 (PST)
Sender: Andres Toomsalu <andres.toomsalu@activesys.org>
From: Andres Toomsalu <andres@opennodecloud.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_0EA72255-0C19-44E8-A6E1-80CE9A164FE5"
Date: Thu, 7 Feb 2013 14:42:12 +0200
Message-Id: <AF6C40D9-3087-4B95-97A3-8E056C2497A0@opennodecloud.com>
Mime-Version: 1.0 (Apple Message framework v1283)
Subject: [linux-lvm] Slow boot with large number of thin snapshots
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


--Apple-Mail=_0EA72255-0C19-44E8-A6E1-80CE9A164FE5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi,

We have experienced a situation where we are left with large number of =
thin snapshots (around 500) and snapshot removal wont work anymore (we =
suspect a lock-up situation caused by trying to remove thin snapshots =
that is still mounted - thou  its not verified yet - just a =
speculation).  The only path to recover seems to be disabling all thin =
volumes from fstab and booting into single-user mode - where lvremove -f =
usually succeeds on these thin snapshots. But LVM init and lvremove take =
a huge amount of time with large number of snapshots  - initial LVM =
activation is going on about 6-8 minutes at least and every lvremove =
takes ca 20-50 sec - depending on snapshot count left. After snapshots =
are removed thin volumes can be enabled again and fsck-ed and resuming =
normal operations.

Althou we are not yet sure what is causing the lockup - so that =
snapshots cant be removed anymore without reboot - its also problematic =
that with large numbers of snapshots all LVM device operations are dead =
slow.  I hope this issue can be addressed somehow in the future.

Kind regards,
--=20
----------------------------------------------
Andres Toomsalu, andres@opennodecloud.com
http://www.opennodecloud.com


--Apple-Mail=_0EA72255-0C19-44E8-A6E1-80CE9A164FE5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
">Hi,<div><br></div><div>We have experienced a situation where we are =
left with large number of thin snapshots (around 500) and snapshot =
removal wont work anymore (we suspect a lock-up situation caused by =
trying to remove thin snapshots that is still mounted - thou &nbsp;its =
not verified yet - just a speculation). &nbsp;The only path to recover =
seems to be disabling all thin volumes from fstab and booting into =
single-user mode - where lvremove -f usually succeeds on these thin =
snapshots. But LVM init and lvremove take a huge amount of time with =
large number of snapshots &nbsp;- initial LVM activation is going on =
about 6-8 minutes at least and every lvremove takes ca 20-50 sec - =
depending on snapshot count left. After snapshots are removed thin =
volumes can be enabled again and fsck-ed and resuming normal =
operations.</div><div><br></div><div>Althou we are not yet sure what is =
causing the lockup - so that snapshots cant be removed anymore without =
reboot - its also problematic that with large numbers of snapshots all =
LVM device operations are dead slow. &nbsp;I hope this issue can be =
addressed somehow in the future.</div><div><br></div><div>Kind =
regards,<br><div><div apple-content-edited=3D"true">
<span class=3D"Apple-style-span" style=3D"border-collapse: separate; =
color: rgb(0, 0, 0); font-family: Helvetica; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: 2; text-align: -webkit-auto; text-indent: =
0px; text-transform: none; white-space: normal; widows: 2; word-spacing: =
0px; -webkit-border-horizontal-spacing: 0px; =
-webkit-border-vertical-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; font-size: medium; "><span =
class=3D"Apple-style-span" style=3D"border-collapse: separate; color: =
rgb(0, 0, 0); font-family: Helvetica; font-style: normal; font-variant: =
normal; font-weight: normal; letter-spacing: normal; line-height: =
normal; orphans: 2; text-align: -webkit-auto; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: =
0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; font-size: medium; "><div =
style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; "><div><div style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; font: =
normal normal normal 12px/normal Helvetica; ">--&nbsp;</div><div =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font: normal normal normal 12px/normal Helvetica; =
">----------------------------------------------</div><div =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font: normal normal normal 12px/normal Helvetica; =
">Andres Toomsalu, <a =
href=3D"mailto:andres@opennodecloud.com">andres@opennodecloud.com</a></div=
><div style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font: normal normal normal 12px/normal Helvetica; "><a =
href=3D"http://www.opennodecloud.com">http://www.opennodecloud.com</a></di=
v></div></div></span></span>
</div>
<br></div></div></body></html>=

--Apple-Mail=_0EA72255-0C19-44E8-A6E1-80CE9A164FE5--
