Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1Q7pMtb024459
	for <linux-lvm@redhat.com>; Tue, 26 Feb 2008 02:51:22 -0500
Received: from relais-inet.francetelecom.com (relais-ias92.francetelecom.com
	[193.251.215.92])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m1Q7okRu007238
	for <linux-lvm@redhat.com>; Tue, 26 Feb 2008 02:50:46 -0500
Received: from omfedm07.si.francetelecom.fr (unknown [xx.xx.xx.3])
	by omfedm09.si.francetelecom.fr (ESMTP service) with ESMTP id
	D446F740EB
	for <linux-lvm@redhat.com>; Tue, 26 Feb 2008 08:50:40 +0100 (CET)
Received: from fr-ces-dms4.domino.globalone.net (unknown [10.238.3.38])
	by omfedm07.si.francetelecom.fr (ESMTP service) with ESMTP id
	9D9DC68003
	for <linux-lvm@redhat.com>; Tue, 26 Feb 2008 08:50:40 +0100 (CET)
Subject: Re: [linux-lvm] add mirror to already existing LV?
MIME-Version: 1.0
Message-ID: <OFDFC20B98.D16B7BD4-ONC12573FB.002AECFE-C12573FB.002B17BE@domino.globalone.net>
From: laurent.nicol@orange-ftgroup.com
Date: Tue, 26 Feb 2008 08:50:23 +0100
Content-Type: multipart/alternative;
	boundary="=_alternative 002B17BAC12573FB_="
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multipart message in MIME format.
--=_alternative 002B17BAC12573FB_=
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

I think that for each existing Lv you have to make lvconvert -m1 /dev/
vg00/lv00=5Froot and so on. at the end you have fully mirrored your existin=
g=20
LV.

Cdlt / Regards,
Laurent NICOL
Orange Business Services
MHS Engineering&Tools - Server Management
BP80 rue de la Touche LAMBERT
35512 Cesson S=E9vign=E9 cedex FRANCE
Phone:             +33.2.23.28.62.52
Mobile Phone:     +33 6 08 99 45 70
http://www.equant.com






Don Buchholz <buchholz@easystreet.net>
Sent by: linux-lvm-bounces@redhat.com
25/02/2008 22:46
Please respond to LVM general discussion and development
=20
        To:     linux-lvm@redhat.com
        cc:=20
        bcc:=20
        Subject:        [linux-lvm] add mirror to already existing LV?




I have Fedora 8 system with operating system installed on a small
(18GB) hard disk.  A second disk (320GB) is being added to hold
user data.  Now that there is a second disk, I would like to alter
the existing LVs so they have mirrors.  Is this possible?
I couldn't find anything that looked promising on the lvchange(8)
man page.

- Don


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Some of the gory details:
-------------------------
# lvmdiskscan
/dev/sda1 [      196.08 MB]
/dev/sda2 [       16.75 GB] LVM physical volume
/dev/sdb1 [      196.08 MB]
/dev/sdb2 [      297.90 GB] LVM physical volume
0 disks
2 partitions
0 LVM physical volume whole disks
2 LVM physical volumes

# pvscan
PV /dev/sda2   VG vg00   lvm2 [16.75 GB / 32.00 MB free]
PV /dev/sdb2   VG vg00   lvm2 [297.88 GB / 297.88 GB free]
Total: 2 [314.62 GB] / in use: 2 [314.62 GB] / in no VG: 0 [0   ]

# vgs
VG   #PV #LV #SN Attr   VSize   VFree
vg00   2   5   0 wz--n- 314.62G 297.91G

# lvscan
ACTIVE            '/dev/vg00/lv00=5Froot' [8.00 GB] inherit
ACTIVE            '/dev/vg00/lv04=5Fhome' [4.22 GB] inherit
ACTIVE            '/dev/vg00/lv02=5Fvar' [1.50 GB] inherit
ACTIVE            '/dev/vg00/lv03=5Fvarlog' [2.00 GB] inherit
ACTIVE            '/dev/vg00/lv01=5Fswap' [1.00 GB] inherit




--
- Don Buchholz, Sr. Systems Admin.             <buchholz@imoveinc.com>
- iMove, Inc., 1732 NW Quimby St., Suite #200, Portland, Oregon  97209
- 503.273.2926 (phone)                              503.221.2172 (fax)


=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--=_alternative 002B17BAC12573FB_=
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable


<br><font size=3D2 face=3D"sans-serif">I think that for each existing Lv you
have to make lvconvert -m1 /dev/</font><font size=3D2><tt>vg00/lv00=5Froot<=
/tt></font><font size=3D2 face=3D"sans-serif">
and so on. at the end you have fully mirrored your existing LV.</font>
<br><font size=3D2 face=3D"sans-serif"><br>
Cdlt / Regards,<br>
Laurent NICOL<br>
Orange Business Services<br>
MHS Engineering&amp;Tools - Server Management<br>
BP80 rue de la Touche LAMBERT<br>
35512 Cesson S=E9vign=E9 cedex FRANCE<br>
Phone: &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; +33.2.23.28.62.52<br>
Mobile Phone: &nbsp; &nbsp; +33 6 08 99 45 70<br>
http://www.equant.com<br>
<br>
</font>
<br>
<br>
<br>
<table width=3D100%>
<tr valign=3Dtop>
<td>
<td><font size=3D1 face=3D"sans-serif"><b>Don Buchholz &lt;buchholz@easystr=
eet.net&gt;</b></font>
<br><font size=3D1 color=3Dred face=3D"sans-serif">Sent by: linux-lvm-bounc=
es@redhat.com</font>
<br><font size=3D1 face=3D"sans-serif">25/02/2008 22:46</font>
<br><font size=3D1 face=3D"sans-serif">Please respond to LVM general discus=
sion
and development</font>
<td><font size=3D1 face=3D"Arial">&nbsp; &nbsp; &nbsp; &nbsp; </font>
<p><font size=3D1 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; To:
&nbsp; &nbsp; &nbsp; &nbsp;linux-lvm@redhat.com</font>
<br><font size=3D1 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; cc:
&nbsp; &nbsp; &nbsp; &nbsp;</font>
<br><font size=3D1 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; bcc:
&nbsp; &nbsp; &nbsp; &nbsp;</font>
<br><font size=3D1 face=3D"sans-serif">&nbsp; &nbsp; &nbsp; &nbsp; Subject:
&nbsp; &nbsp; &nbsp; &nbsp;[linux-lvm] add mirror to already existing
LV?</font>
<br></table>
<br>
<br>
<br>
<br><font size=3D2><tt>I have Fedora 8 system with operating system install=
ed
on a small<br>
(18GB) hard disk. &nbsp;A second disk (320GB) is being added to hold<br>
user data. &nbsp;Now that there is a second disk, I would like to alter<br>
the existing LVs so they have mirrors. &nbsp;Is this possible?</tt></font>
<br><font size=3D2><tt>I couldn't find anything that looked promising on
the lvchange(8)<br>
man page.<br>
</tt></font>
<br><font size=3D2><tt>- Don<br>
</tt></font>
<br>
<br><font size=3D2><tt>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
Some of the gory details:<br>
-------------------------<br>
# lvmdiskscan</tt></font>
<br><font size=3D2><tt>/dev/sda1 [ &nbsp; &nbsp; &nbsp;196.08 MB]<br>
/dev/sda2 [ &nbsp; &nbsp; &nbsp; 16.75 GB] LVM physical volume<br>
/dev/sdb1 [ &nbsp; &nbsp; &nbsp;196.08 MB]<br>
/dev/sdb2 [ &nbsp; &nbsp; &nbsp;297.90 GB] LVM physical volume<br>
0 disks<br>
2 partitions<br>
0 LVM physical volume whole disks<br>
2 LVM physical volumes</tt></font>
<br>
<br><font size=3D2><tt># pvscan<br>
PV /dev/sda2 &nbsp; VG vg00 &nbsp; lvm2 [16.75 GB / 32.00 MB free]<br>
PV /dev/sdb2 &nbsp; VG vg00 &nbsp; lvm2 [297.88 GB / 297.88 GB free]<br>
Total: 2 [314.62 GB] / in use: 2 [314.62 GB] / in no VG: 0 [0 &nbsp; ]</tt>=
</font>
<br>
<br><font size=3D2><tt># vgs<br>
VG &nbsp; #PV #LV #SN Attr &nbsp; VSize &nbsp; VFree<br>
vg00 &nbsp; 2 &nbsp; 5 &nbsp; 0 wz--n- 314.62G 297.91G</tt></font>
<br>
<br><font size=3D2><tt># lvscan<br>
ACTIVE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'/dev/vg00/lv00=5Froot' [8.=
00
GB] inherit<br>
ACTIVE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'/dev/vg00/lv04=5Fhome' [4.=
22
GB] inherit<br>
ACTIVE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'/dev/vg00/lv02=5Fvar' [1.50
GB] inherit<br>
ACTIVE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'/dev/vg00/lv03=5Fvarlog'
[2.00 GB] inherit<br>
ACTIVE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;'/dev/vg00/lv01=5Fswap' [1.=
00
GB] inherit</tt></font>
<br>
<br>
<br>
<br>
<br><font size=3D2><tt>--<br>
- Don Buchholz, Sr. Systems Admin. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&lt;buchholz@imoveinc.com&gt;<br>
- iMove, Inc., 1732 NW Quimby St., Suite #200, Portland, Oregon &nbsp;97209=
<br>
- 503.273.2926 (phone) &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;503.221.2172 (fax)<b=
r>
</tt></font>
<br>
<br><font size=3D2><tt>=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F=5F<br>
linux-lvm mailing list<br>
linux-lvm@redhat.com<br>
https://www.redhat.com/mailman/listinfo/linux-lvm</tt></font>
<br><font size=3D2><tt>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOW=
TO/</tt></font>
<br>
--=_alternative 002B17BAC12573FB_=--
