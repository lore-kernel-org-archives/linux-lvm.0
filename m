Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
    boundary="----_=_NextPart_001_01C19D35.BFA62B76"
Message-Id: <5E34D857F6BB704CA3369B7553233A81651ACA@ntsviemxs0152.connect.at-work.ent>
From: "Csuk, Ferenc" <Ferenc.Csuk@one.at>
Subject: [linux-lvm] pvcreate error
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Jan 14 14:00:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------_=_NextPart_001_01C19D35.BFA62B76
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Dear All,

I just installed a new system and I installed the latest 2.4.16 kernel
and the latest LVM tool 1.0.1-rc4. I established a software RAID-5
device(md) and wanted to create a logical volume group on it(as I did
with 2.4.7 kernel on another system). However, when I issued the command
I got the following error:

# pvcreate -v /dev/md2
pvcreate -- locking logical volume manager
> pvcreate -- checking physical volume name "/dev/md2"
> pvcreate -- getting physical volume size
> pvcreate -- checking partition type
> pvcreate -- creating new physical volume
> pvcreate -- setting up physical volume for /dev/md7 with 0 sectors
> pvcreate -- ERROR "parameter error" setting up  physical volume
"/dev/md2"

I checked the archives where I saw suggestion to patch the LVM tool, but
I don=B4t think that is related to the latest version.

What is the problem? Should I downgrade to 2.4.7?

Thanks in advance,
Ferenc


------_=_NextPart_001_01C19D35.BFA62B76
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.4712.0">
<TITLE>pvcreate error</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/rtf format -->

<P><FONT SIZE=3D2 FACE=3D"Arial">Dear All,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I just installed a new system and I =
installed the latest 2.4.16 kernel and the latest LVM tool 1.0.1-rc4. I =
established a software RAID-5 device(md) and wanted to create a logical =
volume group on it(as I did with 2.4.7 kernel on another system). =
However, when I issued the command I got the following error:</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial"># pvcreate -v /dev/md2</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">pvcreate -- locking logical volume =
manager</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&gt; pvcreate -- checking physical =
volume name &quot;/dev/md2&quot;</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&gt; pvcreate -- getting physical =
volume size</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&gt; pvcreate -- checking partition =
type</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&gt; pvcreate -- creating new physical =
volume</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&gt; pvcreate -- setting up physical =
volume for /dev/md7 with 0 sectors</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">&gt; pvcreate -- ERROR &quot;parameter =
error&quot; setting up&nbsp; physical volume &quot;/dev/md2&quot;</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I checked the archives where I saw =
suggestion to patch the LVM tool, but I don=B4t think that is related to =
the latest version.</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">What is the problem? Should I downgrade =
to 2.4.7?</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Thanks in advance,</FONT>

<BR><FONT SIZE=3D2 FACE=3D"Arial">Ferenc</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C19D35.BFA62B76--
