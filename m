Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t29BLNSe018376
	for <linux-lvm@redhat.com>; Mon, 9 Mar 2015 07:21:23 -0400
Received: from mail.webx.cz (mail.webx.cz [109.123.222.201])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t29BLHBB015337
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 9 Mar 2015 07:21:18 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.webx.cz (Postfix) with ESMTP id 1F2AA3FE09
	for <linux-lvm@redhat.com>; Mon,  9 Mar 2015 12:21:16 +0100 (CET)
Received: from mail.webx.cz ([127.0.0.1])
	by localhost (mail1.webx.cz [127.0.0.1]) (amavisd-new, port 10042)
	with LMTP id h7Q61j-1owxf for <linux-lvm@redhat.com>;
	Mon,  9 Mar 2015 12:21:16 +0100 (CET)
Received: from libor-nb.localnet (remote.bcom.cz [88.208.120.34])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.webx.cz (Postfix) with ESMTPSA id E3BE83FD92
	for <linux-lvm@redhat.com>; Mon,  9 Mar 2015 12:21:15 +0100 (CET)
From: Libor =?utf-8?B?S2xlcMOhxI0=?= <libor.klepac@bcom.cz>
Date: Mon, 09 Mar 2015 12:21:15 +0100
Message-ID: <2134825.VZEVSUbKJK@libor-nb>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="nextPart6934795.QRUrDN5mdl"
Content-Transfer-Encoding: 7Bit
Subject: [linux-lvm] Removing disk from raid LVM
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

--nextPart6934795.QRUrDN5mdl
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello,
web have 4x3TB disks in LVM for backups and I setup per customer/per "task" 
LV type raid5 on it.
Last week, smartd started to alarm us, that one of the disk will soon go away.

So we shut down the computer, replaced disk and then i used vgcfgrestore on 
new disk to restore metadata.
Result was, that some LVs came up with damaged filesystem, some didn't came 
up at all with messages like (one of rimage and rmeta was "wrong", when i used 
KVPM util, it was type "virtual"
----
[123995.826650] mdX: bitmap initialized from disk: read 4 pages, set 1 of 
98312 bits
[124071.037501] device-mapper: raid: Failed to read superblock of device at 
position 2
[124071.055473] device-mapper: raid: New device injected into existing array 
without 'rebuild' parameter specified
[124071.055969] device-mapper: table: 253:83: raid: Unable to assemble array: 
Invalid superblocks
[124071.056432] device-mapper: ioctl: error adding target to table
----
After that, i tried several combinations of
lvconvert --repair 
and
lvchange -ay --resync

Without success. So i saved some data and than created new empty LV's and 
started backups from scratch.

Today, smartd alerted on another disk.
So how can i safely remove disk from VG?
I tried to simulate it on VM

echo 1 > /sys/block/sde/device/delete
vgreduce -ff vgPecDisk2 /dev/sde #doesn't allow me to remove
vgreduce --removemissing vgPecDisk2 #doesn't allow me to remove
vgreduce --removemissing --force vgPecDisk2 #works, alerts me about rimage 
and rmeta LVS

vgchange -ay vgPecDisk2 #works but LV isn't active, only rimage and rmeta LV 
show up.

So how to safely remove soon-to-be-bad-drive and insert new drive to array?
Server has no more physical space for new drive, so we cannot use pvmove.

Server is debian wheezy, but kernel is 2.6.14.
Lvm is in version 2.02.95-8 , but i have another copy i use for raid operations, 
which is in version 2.02.104

With regards
Libor

--nextPart6934795.QRUrDN5mdl
Content-Transfer-Encoding: 7Bit
Content-Type: text/html; charset="us-ascii"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/REC-html40/strict.dtd">
<html><head><meta name="qrichtext" content="1" /><style type="text/css">
p, li { white-space: pre-wrap; }
</style></head><body style=" font-family:'DejaVu Sans'; font-size:9pt; font-weight:400; font-style:normal;">
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Hello,</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">web have 4x3TB disks in LVM for backups and I setup per customer/per &quot;task&quot; LV type raid5 on it.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Last week, smartd started to alarm us, that one of the disk will soon go away.<br /><br />So we shut down the computer, replaced disk and then i used vgcfgrestore on new disk to restore metadata.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Result was, that some LVs came up with damaged filesystem, some didn't came up at all with messages like (one of rimage and rmeta was &quot;wrong&quot;, when i used KVPM util, it was type &quot;virtual&quot;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">----</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">[123995.826650] mdX: bitmap initialized from disk: read 4 pages, set 1 of 98312 bits</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">[124071.037501] device-mapper: raid: Failed to read superblock of device at position 2</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">[124071.055473] device-mapper: raid: New device injected into existing array without 'rebuild' parameter specified</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">[124071.055969] device-mapper: table: 253:83: raid: Unable to assemble array: Invalid superblocks</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">[124071.056432] device-mapper: ioctl: error adding target to table</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">----</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">After that, i tried several combinations of</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">lvconvert --repair </p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">and</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">lvchange -ay --resync</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Without success. So i saved some data and than created new empty LV's and started backups from scratch.</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Today, smartd alerted on another disk.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">So how can i safely remove disk from VG?</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">I tried to simulate it on VM</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">echo 1 &gt; /sys/block/sde/device/delete</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">vgreduce -ff vgPecDisk2 /dev/sde #doesn't allow me to remove</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">vgreduce --removemissing vgPecDisk2 #doesn't allow me to remove</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">vgreduce --removemissing --force vgPecDisk2 #works, alerts me about rimage and rmeta LVS</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">vgchange -ay vgPecDisk2 #works but LV isn't active, only rimage and rmeta LV show up.</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">So how to safely remove soon-to-be-bad-drive and insert new drive to array?</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Server has no more physical space for new drive, so we cannot use pvmove.</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Server is debian wheezy, but kernel is 2.6.14.</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Lvm is in version 2.02.95-8 , but i have another copy i use for raid operations, which is in version 2.02.104</p>
<p style="-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; ">&nbsp;</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">With regards</p>
<p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; -qt-user-state:0;">Libor</p></body></html>
--nextPart6934795.QRUrDN5mdl--
