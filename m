Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7VGPl322329
	for <linux-lvm@redhat.com>; Tue, 31 Aug 2004 12:25:47 -0400
Received: from smtp05.wanadoo.nl (smtp05.wanadoo.nl [194.134.35.145])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i7VGPaw1025040
	for <linux-lvm@redhat.com>; Tue, 31 Aug 2004 12:25:41 -0400
Received: from giant.koningspage.nl (adsl-dc-1f2f8.adsl.wanadoo.nl
	[81.70.16.248]) by smtp5.wanadoo.nl (Postfix) with ESMTP id 847DD5AEE
	for <linux-lvm@redhat.com>; Tue, 31 Aug 2004 17:55:57 +0200 (CEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by giant.koningspage.nl (Postfix) with ESMTP id 74E777C3F8
	for <linux-lvm@redhat.com>; Tue, 31 Aug 2004 17:56:19 +0200 (CEST)
Received: from giant.koningspage.nl ([127.0.0.1])
	by localhost (giant.koningspage.nl [127.0.0.1]) (amavisd-new,
	port 10024) with SMTP id 10487-01 for <linux-lvm@redhat.com>;
	Tue, 31 Aug 2004 17:56:17 +0200 (CEST)
From: Melis van den Brink <m.vd.brink@worldonline.nl>
Date: Tue, 31 Aug 2004 17:56:17 +0200
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_h+JNBzEhEHwvw5/"
Message-Id: <200408311756.17593.m.vd.brink@worldonline.nl>
Subject: [linux-lvm] Fwd: <Q>: Help please with corrupted LVM/reiserfs
	filesystems
Reply-To: m.vd.brink@worldonline.nl,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--Boundary-00=_h+JNBzEhEHwvw5/
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Dear LVM-list readers,

I've sent the following question to the reiserfs-list. Sadly there wasn't much 
response other than the suggestion to try the same question on this list. I 
hope you can give some good advice on how to tackle this problem. It would 
surely help to recover some precious photos and videos. And yes: a backup 
should've solved my problems but alas....
-- 
Regards,

Melis van den Brink

--Boundary-00=_h+JNBzEhEHwvw5/
Content-Type: message/rfc822;
  name="forwarded message"
Content-Transfer-Encoding: 7bit
Content-Description: Melis van den Brink <melis@koningspage61.myweb.nl>: <Q>:
	Help please with corrupted reiserfs filesystems

From: Melis van den Brink <melis@koningspage61.myweb.nl>
Reply-To: melis@koningspage61.myweb.nl
Organization: Private
X-KMail-Identity: 1380841211
To: reiserfs-list@namesys.com
Subject: <Q>: Help please with corrupted reiserfs filesystems
Date: Mon, 16 Aug 2004 17:36:04 +0200
User-Agent: KMail/1.5.3
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200408161736.04472.melis@koningspage61.myweb.nl>
Status: RO
X-Status: S
X-KMail-EncryptionState: 
X-KMail-SignatureState: 

Dear reiserfs-list readers,

I'm following this list for a few years mostly in "lurker"-mode just to see 
what happens with reiserfs. I've been using reiserfs (version 3) for many 
years now without much problems. Up until now... :-(.
Last week I ran into diskspace problems and I decided to make a new volume 
where I could place all my multimedia stuff (movies, audio and pictures). I 
fdisk-ed a new disk and made few partitions. After that I used LVM 1.0.7 
(pvcreate, vgcreate and lvcreate) to get me some logical volumes and used 
mkreiserfs (version 3.6.10) to get a filesystem on it. All looked well and I 
started moving my data to those new filesystems. Even this looked ok up until 
I experienced a locked-up system. No way to shut it down in a nice way I was 
forced to power-down and power-up and that's where the shit hitted the fan 
:-(.
Recovery of my older filesystems worked like a charm but the newly made stuff 
was nowhere in sight. In hindsight the only thing I could think of I did 
wrong in making the new filesystems was I forgot to reboot after fdisk-ing 
the disk.
It turned out that LVM couldn't find the newly created volume-group and the 
logical volumes it contained. Subsequently neither could reiserfs find it's 
(or rather my)  precious filesystems. Using vgcfgrestore I eventually could 
recover the LVM-data so that at least LVM was consistent again. The 
reiserfs-filesystems however I just can't seem to get them back. Using 
reiserfsck in --check, --rebuild-sb, --fix-fixable or --rebuild-tree-mode 
eventually turned out in the following message:
	No reiserfs metadata found.  If you are sure that you had the reiserfs
	on this partition,  then the start  of the partition  might be changed
	or all data were wiped out. The start of the partition may get changed
	by a partitioner  if you have used one.  Then you probably rebuilt the
	superblock as there was no one.  Zero the block at 64K offset from the
	start of the partition (a new super block you have just built) and try
	to move the start of the partition a few cylinders aside  and check if
	debugreiserfs /dev/xxx detects a reiserfs super block. If it does this
	is likely to be the right super block version.
	If this makes you nervous, try  www.namesys.com/support.html,  and for
	$25 the author of fsck,  or a colleague  if he is out,  will  step you
	through it all.

I tried some other suggestions in previous messages in this list, but always 
came back to the above sequence of reiserfsck-commands.

Could anybody please help (suggestions, examples, other commands) with this 
annoying problem ?
I will happily supply other information (machine, kernel, versions, 
filesystem-dumps) if needed.
-- 
Regards,

Melis van den Brink


--Boundary-00=_h+JNBzEhEHwvw5/--
