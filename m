Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1NBEhHq017416
	for <linux-lvm@redhat.com>; Fri, 23 Feb 2007 06:14:43 -0500
Received: from mail-out.sbs.be (mail-out.sbs.be [193.109.72.176])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1NBEe90026046
	for <linux-lvm@redhat.com>; Fri, 23 Feb 2007 06:14:41 -0500
Received: from bruc001x.sbs.be (bruc001x.sbs.be [193.210.175.38])
	by mail-out.sbs.be (8.13.3/8.12.10/SuSE Linux 0.7) with ESMTP id
	l1NBEYcs027160
	for <linux-lvm@redhat.com>; Fri, 23 Feb 2007 12:14:34 +0100
Received: from bru0032a.ww018.siemens.net (bru0032a.ww018.siemens.net
	[193.210.175.90])
	by bruc001x.sbs.be (8.12.10/8.12.10/SuSE Linux 0.7) with ESMTP id
	l1NBEYxF004700
	for <linux-lvm@redhat.com>; Fri, 23 Feb 2007 12:14:34 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C7573B.CC0FBCE3"
Date: Fri, 23 Feb 2007 12:14:34 +0100
Message-ID: <DC5A897E4168AA4BA3608A6C09106A55997FFE@BRU0038A.ww018.siemens.net>
From: "Degrendele Dieter \(EXT\)" <dieter.degrendele.ext@siemens.com>
Subject: [linux-lvm] Stale file
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

------_=_NextPart_001_01C7573B.CC0FBCE3
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Hi,

Since a few days we have a problem with our backups.
The reason is an oracle audit file without owner, timestamp, permissions
and so on.

# ls -l=20
-rw-r-----  1 onosapp  dba    637 Jan 21 19:45 ora_20243.aud
?---------  ? ?        ?        ?            ? ora_20406.aud
-rw-r-----  1 onosapp  dba    776 Nov 21 14:44 ora_2053.aud

We are using lvm2-2.02.06-6.0.RHEL4 (64-bit) and
device-mapper-multipath-0.4.5-16.1.RHEL4..
Our storage is a Fujitsu-Siemens CX300 box.

Any idea if this is caused by LVM errors?


Kind regards,
Dieter Degrendele

------_=_NextPart_001_01C7573B.CC0FBCE3
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.5.7650.28">
<TITLE>Stale file</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">Hi,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Since a few days we have a problem with =
our backups.</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">The reason is an oracle audit file =
without owner, timestamp, permissions and so on.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial"># ls -l </FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">-rw-r-----&nbsp; 1 onosapp&nbsp; =
dba&nbsp;&nbsp;&nbsp; 637 Jan 21 19:45 ora_20243.aud</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">?---------&nbsp; ? =
?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ? =
ora_20406.aud</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">-rw-r-----&nbsp; 1 onosapp&nbsp; =
dba&nbsp;&nbsp;&nbsp; 776 Nov 21 14:44 ora_2053.aud</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">We are using lvm2-2.02.06-6.0.RHEL4 =
(64-bit) and device-mapper-multipath-0.4.5-16.1.RHEL4..</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Our storage is a Fujitsu-Siemens CX300 =
box.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Any idea if this is caused by LVM =
errors?</FONT>
</P>
<BR>

<P><FONT SIZE=3D2 FACE=3D"Arial">Kind regards,</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Dieter Degrendele</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C7573B.CC0FBCE3--
