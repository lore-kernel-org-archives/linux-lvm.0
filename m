Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j131uIO05082
	for <linux-lvm@redhat.com>; Wed, 2 Feb 2005 20:56:18 -0500
Received: from archimedes.mystrotv.com (archimedes.mystrotv.com
	[207.93.212.10])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j131uCLD001789
	for <linux-lvm@redhat.com>; Wed, 2 Feb 2005 20:56:12 -0500
Received: from archimedes.mystrotv.com (archimedes.mystrotv.com [127.0.0.1])
	by localhost.mystrotv.com (Postfix) with ESMTP id 9CBFE2EF91
	for <linux-lvm@redhat.com>; Wed,  2 Feb 2005 18:55:58 -0700 (MST)
Received: from troy.mystro.mystrotv.com (unknown [10.100.152.40])
	by archimedes.mystrotv.com (Postfix) with ESMTP id 7FF832EF8B
	for <linux-lvm@redhat.com>; Thu,  3 Feb 2005 01:55:58 +0000 (UTC)
Subject: RE: [linux-lvm] LVM + SAN Behavior
From: Kreig DuBose <kdubose@mystrotv.com>
Content-Type: multipart/alternative; boundary="=-l/1LMaP0Z90QqWYgbylR"
Message-Id: <1107395761.22389.86.camel@voxan.mystro.mystrotv.com>
Mime-Version: 1.0
Date: Wed, 02 Feb 2005 18:56:01 -0700
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


--=-l/1LMaP0Z90QqWYgbylR
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello-
 
I too am sharing the same issue regarding SAN file systems and Linux
LVM.  I have a device presented via FC on RHEL 3 update 3.  I'm using
the LVM provided by RedHat:

lvm-1.0.8-5

I started with a simple raid 5 configuration with 3 disks (approx
135GB).  Now I've added 1 more disk into the array (Done on a DS4300). 
 
When I created the file systems I did so as such:

pvcreate /dev/sdc
vgcreate <volgrp_name> /dev/sdc
lvcreate -L +45G -n <lv_name> <volgrp_name>
mkfs -j  /dev/<volgrp_name>/<lv_name>

So far so good.  Partitions mount up and work fine.  I've even gone
through and modified <lv_name> by removing the journal file, resizing
and remounting with good success.  My problem is now that I've added in
another disk (capacity now approx 200GB) I cannot grow the vg:

# vgextend <volgrp_name> /dev/sdc
vgextend -- INFO: maximum logical volume size is 2 Terabyte
vgextend -- ERROR: physical volume "/dev/sdc" already belongs to volume
group "<volgrp_name>"

As discussed in previous messages I could simply create a partition and
add it in.  I've gone down that road, but with the inability to grow a
physical partition (tried via parted) that too didn't work well.  To me
it doesn't seem that this should be outside of normal expectations but
there doesn't seem to be a lot of information regarding LVM and SANs.
 
Regards,
Kreig





--=-l/1LMaP0Z90QqWYgbylR
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.0.10">
</HEAD>
<BODY>
Hello-<BR>
 <BR>
I too am sharing the same issue regarding SAN file systems and Linux LVM.&nbsp; I have a device presented via FC on RHEL 3 update 3.&nbsp; I'm using the LVM provided by RedHat:<BR>
<BR>
lvm-1.0.8-5<BR>
<BR>
I started with a simple raid 5 configuration with 3 disks (approx 135GB).&nbsp; Now I've added 1 more disk into the array (Done on a DS4300). <BR>
 <BR>
When I created the file systems I did so as such:<BR>
<BR>
pvcreate /dev/sdc<BR>
vgcreate &lt;volgrp_name&gt; /dev/sdc<BR>
lvcreate -L +45G -n &lt;lv_name&gt; &lt;volgrp_name&gt;<BR>
mkfs -j&nbsp; /dev/&lt;volgrp_name&gt;/&lt;lv_name&gt;<BR>
<BR>
So far so good.&nbsp; Partitions mount up and work fine.&nbsp; I've even gone through and modified &lt;lv_name&gt; by removing the journal file, resizing and remounting with good success.&nbsp; My problem is now that I've added in another disk (capacity now approx 200GB) I cannot grow the vg:<BR>
<BR>
# vgextend &lt;volgrp_name&gt; /dev/sdc<BR>
vgextend -- INFO: maximum logical volume size is 2 Terabyte<BR>
vgextend -- ERROR: physical volume &quot;/dev/sdc&quot; already belongs to volume group &quot;&lt;volgrp_name&gt;&quot;<BR>
<BR>
As discussed in previous messages I could simply create a partition and add it in.&nbsp; I've gone down that road, but with the inability to grow a physical partition (tried via parted) that too didn't work well.&nbsp; To me it doesn't seem that this should be outside of normal expectations but there doesn't seem to be a lot of information regarding LVM and SANs.<BR>
 <BR>
Regards,<BR>
Kreig<BR>
<BR>
<BR>
<BR>
<BR>
</BODY>
</HTML>

--=-l/1LMaP0Z90QqWYgbylR--
