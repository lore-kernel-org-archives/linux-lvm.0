Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3DHsrc1016298
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 13:54:53 -0400
Received: from mckesson.com (mail5.mckesson.com [143.112.68.14])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3DHscgU000985
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 13:54:38 -0400
From: "Allen, Jack" <Jack.Allen@mckesson.com>
Content-class: urn:content-classes:message
In-Reply-To: <OFD63B0567.C7959B66-ON48257704.0016C2D2-48257704.0017140B@db.com>
References: <4BC34F78.8040301@cfl.rr.com>
	<OFD63B0567.C7959B66-ON48257704.0016C2D2-48257704.0017140B@db.com>
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01CADB32.4F8BB99A"
Date: Tue, 13 Apr 2010 13:54:05 -0400
Message-ID: <230ED15F81AFD3409345FFA4E565F0E50926625F@NDHV3000.na.corp.mckesson.com>
In-Reply-To: <OFD63B0567.C7959B66-ON48257704.0016C2D2-48257704.0017140B@db.com>
References: <4BC34F78.8040301@cfl.rr.com>
	<OFD63B0567.C7959B66-ON48257704.0016C2D2-48257704.0017140B@db.com>
Subject: Re: [linux-lvm] How do I properly backup and restore / on LVM2
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

This is a multi-part message in MIME format.

------_=_NextPart_001_01CADB32.4F8BB99A
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

=20


  _____ =20

From: linux-lvm-bounces@redhat.com =
[mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Alan Pek
Sent: Tuesday, April 13, 2010 12:12 AM
To: linux-lvm@redhat.com
Subject: Re: [linux-lvm] How do I properly backup and restore / on LVM2



Hi=20

dump does not come with standard Suse.=20

Where can I get the rpm.=20

Have not used dump before and how do I create a snapshot ?=20

How do I recreate my existing LVM2 structure if my root disk is gone ?=20

Appreciate as we are using tsm which is tedious/problematic to restore. =


One will have pxe build and then install tsm and then restore.=20

Appreciate your reply.=20

Regards
Alan=20

[Jack Allen] I believe TSM has a Bare Metal Restore option. If not =
there
is Storix which is not very expensive.
=20

------_=_NextPart_001_01CADB32.4F8BB99A
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>

<META content=3D"MSHTML 6.00.2900.5921" name=3DGENERATOR></HEAD>
<BODY>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#800000=20
size=3D2></FONT>&nbsp;</DIV><FONT face=3DArial color=3D#800000 =
size=3D2></FONT><BR>
<DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr align=3Dleft>
<HR tabIndex=3D-1>
<FONT face=3DTahoma size=3D2><B>From:</B> linux-lvm-bounces@redhat.com=20
[mailto:linux-lvm-bounces@redhat.com] <B>On Behalf Of </B>Alan=20
Pek<BR><B>Sent:</B> Tuesday, April 13, 2010 12:12 AM<BR><B>To:</B>=20
linux-lvm@redhat.com<BR><B>Subject:</B> Re: [linux-lvm] How do I =
properly backup=20
and restore / on LVM2<BR></FONT><BR></DIV>
<DIV></DIV><FONT face=3DArial color=3D#800000 size=3D2></FONT>
<DIV><BR><FONT face=3Dsans-serif size=3D2>Hi </FONT><BR><BR><FONT =
face=3Dsans-serif=20
size=3D2>dump does not come with standard Suse.</FONT> <BR><FONT =
face=3Dsans-serif=20
size=3D2><BR>Where can I get the rpm.</FONT> <BR><BR><FONT =
face=3Dsans-serif=20
size=3D2>Have not used dump before and how do I create a snapshot =
?</FONT>=20
<BR><BR><FONT face=3Dsans-serif size=3D2>How do I recreate my existing =
LVM2=20
structure if my root disk is gone ?</FONT> <BR><BR><FONT =
face=3Dsans-serif=20
size=3D2>Appreciate as we are using tsm which is tedious/problematic to =

restore.</FONT> <BR><BR><FONT face=3Dsans-serif size=3D2>One will have =
pxe build and=20
then install tsm and then restore.</FONT> <BR><BR><FONT =
face=3Dsans-serif=20
size=3D2>Appreciate your reply.</FONT> <BR><BR><FONT face=3Dsans-serif=20
size=3D2>Regards<BR>Alan</FONT> <BR><BR><SPAN =
class=3D266475217-13042010><FONT=20
face=3DArial color=3D#800000 size=3D2>[Jack Allen]&nbsp;I believe TSM =
has a Bare Metal=20
Restore option. If not there is Storix which is not very=20
expensive.</FONT></SPAN></DIV>
<DIV><SPAN class=3D266475217-13042010>&nbsp;</SPAN></DIV></BODY></HTML>

------_=_NextPart_001_01CADB32.4F8BB99A--
