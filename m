Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7BGmmuK009241
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 12:48:48 -0400
Received: from exchange2k.lims.com (exchange2k.lims.com [65.119.219.231])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7BGmlXe003941
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 12:48:47 -0400
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C6BD66.00C81040"
Date: Fri, 11 Aug 2006 12:48:42 -0400
Message-ID: <73A8ABE78537AE4E9DB1D70863B8275F0330CD7C@exchange2k.lims.com>
From: "Musil, William" <wmusil@labvantage.com>
Subject: [linux-lvm] LVM2 on hardware RAID
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

------_=_NextPart_001_01C6BD66.00C81040
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_002_01C6BD66.00C81040"


------_=_NextPart_002_01C6BD66.00C81040
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello all.

I have an issue, that I am not sure how to address.

How can I resize the physical volume if I change the geometry of the =
disk
(non-destructive resize of RAID volume at the hardware level)=20
I can see that the OS has picked up the new size of the disk and I would =
like
to resize the existing pv. I don't know how.

I started with a hardware raid 5 (400GB), linux automatically recognizes =
disk
as /dev/sdb

a simplistic representation of the setup is as follows

pvcreate /dev/sdb
vgcreate VolGroup10 /dev/sdb
lvcreate -n LogVol10 VolGroup10
mkfs.ext3 /dev/mapper/VolGroup10-LogVol10

I have added a disk and expand the array to 600GB I can still see every =
thing
but I don't know how to extend the PV.

filesystems OK
logical volumes OK
volume groups OK

linux sees /dev/sdb as 600GB
pvs shows pv /dev/sdb is 400GB. I wish to, non-destructively, =
reinitialize
/dev/sdb so that pvs shows 600GB. how?


William T. Musil
Manager, Technical Services

LabVantage Solutions, Inc.
1160 US Highway 22 East, Bridgewater, NJ 08807
p| 908.333.0111
f | 908.707.1179=20
e| wmusil@labvantage.com
i | www.labvantage.com

The information in this e-mail is confidential and may contain legally
privileged information. It is intended solely for the person or entity =
to
which it is addressed. Access to this e-mail by anyone else is =
unauthorized.
If you are not the intended recipient, any disclosure, copying, =
distribution,
action taken, or action omitted to be taken in reliance on it, is =
prohibited
and may be unlawful. If you received this e-mail in error, please =
contact the
sender and delete the material from any computer.

 <<Musil, William.vcf>>=20

------_=_NextPart_002_01C6BD66.00C81040
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.6618.4">
<TITLE>LVM2 on hardware RAID</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT SIZE=3D2 FACE=3D"Arial">Hello all.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I have an issue, that I am not sure how =
to address.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">How can I resize the physical volume if =
I change the geometry of the disk (non-destructive resize of RAID volume =
at the hardware level) </FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I can see that the OS has picked up the =
new size of the disk and I would like to resize the existing pv. I don't =
know how.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I started with a hardware raid 5 =
(400GB), linux automatically recognizes disk as /dev/sdb</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">a simplistic representation of the =
setup is as follows</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">pvcreate /dev/sdb</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">vgcreate VolGroup10 /dev/sdb</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">lvcreate -n LogVol10 VolGroup10</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">mkfs.ext3 =
/dev/mapper/VolGroup10-LogVol10</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I have added a disk and expand the =
array to 600GB I can still see every thing but I don't know how to =
extend the PV.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">filesystems OK</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">logical volumes OK</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">volume groups OK</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">linux sees /dev/sdb as 600GB</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">pvs shows pv /dev/sdb is 400GB. I wish =
to, non-destructively, reinitialize /dev/sdb so that pvs shows 600GB. =
how?</FONT>
</P>
<BR>

<P><B><FONT COLOR=3D"#000000" FACE=3D"Arial">William T. Musil</FONT></B>

<BR><FONT COLOR=3D"#000000" SIZE=3D2 FACE=3D"Arial">Manager, Technical =
Services</FONT>
</P>

<P><FONT COLOR=3D"#000000" SIZE=3D2 FACE=3D"Arial">LabVantage Solutions, =
Inc.</FONT>

<BR><FONT COLOR=3D"#000000" SIZE=3D2 FACE=3D"Arial">1160 US Highway 22 =
East, Bridgewater, NJ 08807</FONT>

<BR><B><FONT COLOR=3D"#000000" SIZE=3D2 =
FACE=3D"Arial">p|</FONT></B><FONT COLOR=3D"#000000" SIZE=3D2 =
FACE=3D"Arial"> 908.333.0111</FONT>

<BR><B><FONT COLOR=3D"#000000" SIZE=3D2 FACE=3D"Arial">f =
|</FONT></B><FONT COLOR=3D"#000000" SIZE=3D2 FACE=3D"Arial"> =
908.707.1179 </FONT>

<BR><B><FONT COLOR=3D"#000000" SIZE=3D2 =
FACE=3D"Arial">e|</FONT></B><FONT COLOR=3D"#000000" SIZE=3D2 =
FACE=3D"Arial"></FONT><U> <FONT COLOR=3D"#0000FF" SIZE=3D2 =
FACE=3D"Arial">wmusil@labvantage.com</FONT></U>

<BR><B><FONT COLOR=3D"#000000" SIZE=3D2 FACE=3D"Arial">i =
|</FONT></B><FONT COLOR=3D"#000000" SIZE=3D2 FACE=3D"Arial"> =
www.labvantage.com</FONT><U></U>
</P>

<P><FONT COLOR=3D"#000000" SIZE=3D1 FACE=3D"Arial">The information in =
this e-mail is confidential and may contain legally privileged =
information. It is intended solely for the person or entity to which it =
is addressed. Access to this e-mail by anyone else is unauthorized. If =
you are not the intended recipient, any disclosure, copying, =
distribution, action taken, or action omitted to be taken in reliance on =
it, is prohibited and may be unlawful. If you received this e-mail in =
error, please contact the sender and delete the material from any =
computer.</FONT></P>

<P><FONT FACE=3D"Arial" SIZE=3D2 COLOR=3D"#000000"> &lt;&lt;Musil, =
William.vcf&gt;&gt; </FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_002_01C6BD66.00C81040--

------_=_NextPart_001_01C6BD66.00C81040
Content-Type: text/x-vcard;
	name="Musil, William.vcf"
Content-Transfer-Encoding: base64
Content-Description: Musil, William.vcf
Content-Disposition: attachment;
	filename="Musil, William.vcf"

QkVHSU46VkNBUkQNClZFUlNJT046Mi4xDQpOOk11c2lsO1dpbGxpYW0NCkZOOk11c2lsLCBXaWxs
aWFtDQpBRFI7V09SSzo7QnJpZGdld2F0ZXINCkxBQkVMO1dPUks6QnJpZGdld2F0ZXINCkVNQUlM
O1BSRUY7SU5URVJORVQ6V011c2lsQGxhYnZhbnRhZ2UuY29tDQpSRVY6MjAwNDAzMDNUMTg1MjI0
Wg0KRU5EOlZDQVJEDQo=

------_=_NextPart_001_01C6BD66.00C81040--
