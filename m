Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8MMiOr13236
	for <linux-lvm@redhat.com>; Wed, 22 Sep 2004 18:44:25 -0400
Received: from mailhub.lss.emc.com (mailhub.lss.emc.com [168.159.2.31])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8MMiOWv016439
	for <linux-lvm@redhat.com>; Wed, 22 Sep 2004 18:44:24 -0400
Received: from srexchimc2.eng.emc.com (srexchimg2.eng.emc.com [168.159.100.11]
	(may be forged))
	by mailhub.lss.emc.com (Switch-3.1.6/Switch-3.1.6) with ESMTP id
	i8MMiLN0019381
	for <linux-lvm@redhat.com>; Wed, 22 Sep 2004 18:44:22 -0400 (EDT)
Message-ID: <979569CD80E7EB4C94F72433A9A4C679067FFF62@srstarr.eng.emc.com>
From: "lin, jie" <lin_jie@emc.com>
Date: Wed, 22 Sep 2004 18:44:20 -0400
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C4A0F5.B32779C8"
Subject: [linux-lvm] How to import a mirror of a volume group
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: "'linux-lvm@redhat.com'" <linux-lvm@redhat.com>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C4A0F5.B32779C8
Content-Type: text/plain

Hi,

I am trying to figure out how to import a mirror of a volume group to a host
where the mirror is visible.
I am new to LVM. Any help will be appreciated.

The system is RedHat Enterprise Linux 3.0. The kernel is 2.4.21-4. The LVM
version 1.0.3-15.

Let me explain what I am trying to do.
1. I created a volume group which consists of 2 physical volumes (2 full
hard disks) and 2 logical volumes. 
    I created two ext3 file systems off the two logical volumes.
    I mounted the two file systems. Everything was ok.
2. I created mirror disks of the two original physical volumes, which should
be the exact copy of the original 
    two physical volumes, using our own array technology.
3. Now I want to import the volume group from the two mirror disks on the
same host (The two mirror 
    disks are visible on the same host). I got the following error:
    "vgimport -- ERROR "pv_read(): read" reading physical volume
"/dev/sdbm""
    Importing to a different host where the mirror disks are visible does
not work either. Same error. 
    I have attached the vgimport output with debug option turned on at the
end of this email.
   
Since the mirror disks are the exact copy of the originals, I would assume
that VGDA should be copied
to the mirror disks as well. Why import does not work?  Did I miss anything
here? 
Is there other workaround that can help me achieve this? 

Thanks,

Jie

Below is the output with debug option turned on.
<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 10
vgimport -- locking logical volume manager
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_lock -- LEAVING with ret: 0
vgimport -- checking volume group name
<1> vg_check_name -- CALLED with VG: jlin_vg2
<22> lvm_check_chars -- CALLED with name: "jlin_vg2"
<22> lvm_check_chars -- LEAVING with ret: 0
<1> vg_check_name -- LEAVING with ret: 0
vgimport -- checking volume group "jlin_vg2" existence
<1> lvm_tab_vg_check_exist -- CALLED with vg_name: "jlin_vg2"
<22> vg_check_name -- CALLED with VG: jlin_vg2
<333> lvm_check_chars -- CALLED with name: "jlin_vg2"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> lvm_tab_read -- CALLED
<22> lvm_tab_read -- LEAVING with ret: 0  data: 804CA98  size: 9
<1> lvm_tab_vg_check_exist -- LEAVING with ret: 0
vgimport -- trying to read physical volumes
vgimport -- checking for duplicate physical volumes
vgimport -- checking physical volume name "/dev/sdbm"
<1> pv_check_name -- CALLED with "/dev/sdbm"
<22> lvm_check_chars -- CALLED with name: "/dev/sdbm"
<22> lvm_check_chars -- LEAVING with ret: 0
<1> pv_check_name -- LEAVING with ret: 0
vgimport -- reading data of physical volume "/dev/sdbm" from disk
<1> pv_read -- CALLED with /dev/sdbm
<22> pv_check_name -- CALLED with "/dev/sdbm"
<333> lvm_check_chars -- CALLED with name: "/dev/sdbm"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> pv_check_name -- LEAVING with ret: 0
<1> pv_read -- going to read /dev/sdbm
<1> pv_read -- LEAVING with ret: -282
<1> lvm_error -- CALLED with: -282
<1> lvm_error -- LEAVING with: "pv_read(): read"
vgimport -- ERROR "pv_read(): read" reading physical volume "/dev/sdbm"
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0

------_=_NextPart_001_01C4A0F5.B32779C8
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DUS-ASCII">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2658.2">
<TITLE>How to import a mirror of a volume group</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2 FACE=3D"Arial">Hi,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">I am trying to figure out how to =
import a mirror of a volume group to a host where the mirror is =
visible.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">I am new to LVM. Any help will be =
appreciated.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">The system is RedHat Enterprise Linux =
3.0. The kernel is 2.4.21-4. The LVM version 1.0.3-15.</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Let me explain what I am trying to =
do.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">1. I created a volume group which =
consists of 2 physical volumes (2 full hard disks) and 2 logical =
volumes. </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp; I created two ext3 =
file systems off the two logical volumes.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp; I mounted the two =
file systems. Everything was ok.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">2. I created mirror disks of the two =
original physical volumes, which should be the exact copy of the =
original </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp; two physical =
volumes, using our own array technology.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">3. Now I want to import the volume =
group from the two mirror disks on the same host (The two mirror =
</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp; disks are visible =
on the same host). I got the following error:</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp; &quot;</FONT><FONT =
SIZE=3D2 FACE=3D"Courier New">vgimport -- ERROR &quot;pv_read(): =
read&quot; reading physical volume &quot;/dev/sdbm&quot;&quot;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp; Importing to a =
different host where the mirror disks are visible does not work either. =
Same error. </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp;&nbsp; I have attached =
the vgimport output with debug option turned on at the end of this =
email.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">&nbsp;&nbsp; </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Since the mirror disks are the exact =
copy of the originals, I would assume that VGDA should be copied</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">to the mirror disks as well. Why =
import does not work?&nbsp; Did I miss anything here? </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">Is there other workaround that can =
help me achieve this? </FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Thanks,</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Jie</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Below is the output with debug option =
turned on.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;1&gt; lvm_get_iop_version =
-- CALLED</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;22&gt; lvm_check_special -- =
CALLED</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;22&gt; lvm_check_special -- =
LEAVING</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;1&gt; lvm_get_iop_version =
-- AFTER ioctl ret: 0</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;1&gt; lvm_get_iop_version =
-- LEAVING with ret: 10</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">vgimport -- locking logical =
volume manager</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;1&gt; lvm_lock -- =
CALLED</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;22&gt; lvm_check_special -- =
CALLED</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;22&gt; lvm_check_special -- =
LEAVING</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;1&gt; lvm_lock -- LEAVING =
with ret: 0</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">vgimport -- checking volume =
group name</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;1&gt; vg_check_name -- =
CALLED with VG: jlin_vg2</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;22&gt; lvm_check_chars -- =
CALLED with name: &quot;jlin_vg2&quot;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;22&gt; lvm_check_chars -- =
LEAVING with ret: 0</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;1&gt; vg_check_name -- =
LEAVING with ret: 0</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">vgimport -- checking volume =
group &quot;jlin_vg2&quot; existence</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;1&gt; =
lvm_tab_vg_check_exist -- CALLED with vg_name: =
&quot;jlin_vg2&quot;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;22&gt; vg_check_name -- =
CALLED with VG: jlin_vg2</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;333&gt; lvm_check_chars -- =
CALLED with name: &quot;jlin_vg2&quot;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;333&gt; lvm_check_chars -- =
LEAVING with ret: 0</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;22&gt; vg_check_name -- =
LEAVING with ret: 0</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;22&gt; lvm_tab_read -- =
CALLED</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;22&gt; lvm_tab_read -- =
LEAVING with ret: 0&nbsp; data: 804CA98&nbsp; size: 9</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;1&gt; =
lvm_tab_vg_check_exist -- LEAVING with ret: 0</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">vgimport -- trying to read =
physical volumes</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">vgimport -- checking for =
duplicate physical volumes</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">vgimport -- checking physical =
volume name &quot;/dev/sdbm&quot;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;1&gt; pv_check_name -- =
CALLED with &quot;/dev/sdbm&quot;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;22&gt; lvm_check_chars -- =
CALLED with name: &quot;/dev/sdbm&quot;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;22&gt; lvm_check_chars -- =
LEAVING with ret: 0</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;1&gt; pv_check_name -- =
LEAVING with ret: 0</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">vgimport -- reading data of =
physical volume &quot;/dev/sdbm&quot; from disk</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;1&gt; pv_read -- CALLED =
with /dev/sdbm</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;22&gt; pv_check_name -- =
CALLED with &quot;/dev/sdbm&quot;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;333&gt; lvm_check_chars -- =
CALLED with name: &quot;/dev/sdbm&quot;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;333&gt; lvm_check_chars -- =
LEAVING with ret: 0</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;22&gt; pv_check_name -- =
LEAVING with ret: 0</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;1&gt; pv_read -- going to =
read /dev/sdbm</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;1&gt; pv_read -- LEAVING =
with ret: -282</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;1&gt; lvm_error -- CALLED =
with: -282</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;1&gt; lvm_error -- LEAVING =
with: &quot;pv_read(): read&quot;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">vgimport -- ERROR =
&quot;pv_read(): read&quot; reading physical volume =
&quot;/dev/sdbm&quot;</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;1&gt; lvm_unlock -- =
CALLED</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">&lt;1&gt; lvm_unlock -- LEAVING =
with ret: 0</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C4A0F5.B32779C8--
