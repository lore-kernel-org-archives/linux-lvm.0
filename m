Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p0C6eglY017240
	for <linux-lvm@redhat.com>; Wed, 12 Jan 2011 01:40:42 -0500
Received: from mail-yw0-f46.google.com (mail-yw0-f46.google.com
	[209.85.213.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id p0C6eUej002038
	for <linux-lvm@redhat.com>; Wed, 12 Jan 2011 01:40:31 -0500
Received: by ywl5 with SMTP id 5so95112ywl.33
	for <linux-lvm@redhat.com>; Tue, 11 Jan 2011 22:40:30 -0800 (PST)
Message-ID: <0C2E8649F1F840098A27CCB946FA8DD0@netdom.loc>
From: "Avinash Gaonkar" <agaonkar@gmail.com>
Date: Wed, 12 Jan 2011 12:10:13 +0530
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001D_01CBB251.AAEDD700"
Subject: [linux-lvm] Sharing Volume Group between systems
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

------=_NextPart_000_001D_01CBB251.AAEDD700
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear Team,

Can we share a Volume group between systems?
I have a virtualized setup using Vmware Hypervisor, I am using Openfiler =
as an alternate to storage (NAS) on virtualization.
As I need tenant isolation, I am using different Openfiler instances to =
provide storage.

My scenario: I have 1TB of LUN from a NetApp SAN configured on 6 =
Openfilers, and all Openfilers has R/W access to the VolumeGroup =
created.
All these Openfilers are creating Logical Volumes on the Shared Volume =
Group.=20
Till now All my Openfiler are able to R/W access the Volume Group and =
create Logical volumes/Shares and serve the clients as NFS and CIFS =
share.

My Question is can I put this setup into production, what challenges =
will I face.

Awaiting your valuable response on this.

Regards,
Avinash=20





------=_NextPart_000_001D_01CBB251.AAEDD700
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3Dtext/html;charset=3Diso-8859-1 =
http-equiv=3DContent-Type>
<META name=3DGENERATOR content=3D"MSHTML 8.00.7600.16700"></HEAD>
<BODY style=3D"PADDING-LEFT: 10px; PADDING-RIGHT: 10px; PADDING-TOP: =
15px"=20
id=3DMailContainerBody leftMargin=3D0 topMargin=3D0 =
CanvasTabStop=3D"true"=20
name=3D"Compose message area">
<DIV><FONT size=3D2 face=3DArial>Dear Team,</FONT></DIV>
<DIV><FONT size=3D2 face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2 face=3DArial>Can we share a Volume group between=20
systems?</FONT></DIV>
<DIV><FONT size=3D2 face=3DArial>I have a virtualized setup using Vmware =
Hypervisor,=20
I am using Openfiler as an alternate to storage (NAS) on=20
virtualization.</FONT></DIV>
<DIV><FONT size=3D2 face=3DArial>As&nbsp;I&nbsp;need tenant =
isolation,&nbsp;I=20
am&nbsp;using different Openfiler instances to provide =
storage.</FONT></DIV>
<DIV><FONT size=3D2 face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2 face=3DArial>My scenario: I have 1TB of LUN from a =
NetApp SAN=20
configured on 6 Openfilers, and all Openfilers has R/W access to the =
VolumeGroup=20
created.</FONT></DIV>
<DIV><FONT size=3D2 face=3DArial>All these Openfilers are creating =
Logical Volumes=20
on the Shared Volume Group. </FONT></DIV>
<DIV><FONT size=3D2 face=3DArial>Till now All my Openfiler are able to =
R/W access=20
the Volume Group and create Logical volumes/Shares and serve the clients =
as NFS=20
and CIFS share.</FONT><FONT size=3D2 face=3DArial></FONT></DIV>
<DIV><FONT size=3D2 face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2 face=3DArial>My Question is&nbsp;can I&nbsp;put this =
setup into=20
production, what challenges will I face.</FONT></DIV>
<DIV><FONT size=3D2 face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2 face=3DArial>Awaiting your valuable response on=20
this.</FONT></DIV>
<DIV><FONT size=3D2 face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2 face=3DArial>Regards,</FONT></DIV>
<DIV><FONT size=3D2 face=3DArial>Avinash </FONT></DIV>
<DIV><FONT size=3D2 face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2 face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2 face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2 face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2 face=3DArial></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_001D_01CBB251.AAEDD700--
