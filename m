Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4SK0duB028683
	for <linux-lvm@redhat.com>; Sun, 28 May 2006 16:00:39 -0400
Received: from etm.pdx.edu (etm.pdx.edu [131.252.211.136])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4SK0XUr000824
	for <linux-lvm@redhat.com>; Sun, 28 May 2006 16:00:33 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C68291.D5F533C2"
Date: Sun, 28 May 2006 13:03:49 -0700
Message-ID: <E76E8912F5D429498113299F9F706255032910@etm1.ds.etm.pdx.edu>
From: "Lane Inman" <lanei@etm.pdx.edu>
Subject: [linux-lvm] Recovery of vg after forceful pv remove
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

This is a multi-part message in MIME format.

------_=_NextPart_001_01C68291.D5F533C2
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hello;
  I forcefully removed a pv from a vg due to the fact that it was dead; =
I now get the error:
 Couldn't find device with uuid 'fjy6M1-haN0-AyXS-6D2t-0yz1-f3kB-1NjX44'
when perform pvscan's.  All the information is contiguous on the disks, =
I just need to recover it without the dying disk, can someone help me =
with this?

-Lane

------_=_NextPart_001_01C68291.D5F533C2
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.5.7226.0">
<TITLE>Recovery of vg after forceful pv remove</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->
<BR>

<P><FONT SIZE=3D2>Hello;<BR>
&nbsp; I forcefully removed a pv from a vg due to the fact that it was =
dead; I now get the error:<BR>
&nbsp;Couldn't find device with uuid =
'fjy6M1-haN0-AyXS-6D2t-0yz1-f3kB-1NjX44'<BR>
when perform pvscan's.&nbsp; All the information is contiguous on the =
disks, I just need to recover it without the dying disk, can someone =
help me with this?<BR>
<BR>
-Lane<BR>
</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C68291.D5F533C2--
