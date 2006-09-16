Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8GC5TKh010681
	for <linux-lvm@redhat.com>; Sat, 16 Sep 2006 08:05:29 -0400
Received: from iohazard.net (iohazard.net [193.64.31.48])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8GC5NGu019491
	for <linux-lvm@redhat.com>; Sat, 16 Sep 2006 08:05:23 -0400
Message-ID: <450BE85F.3090604@iki.fi>
Date: Sat, 16 Sep 2006 15:04:47 +0300
From: Aleksandr Koltsoff <czr@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm support for imaging software
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello all, and sorry for the long email,

What would be the correct way to approach the following problem:

I want to implement a filesystem imaging software (not block-based, dd
is pretty good there already). Parsing the filesystem structures on disk
is not really the problem (ext2/ext3 at the moment) but accessing data
"behind" LVM2 is.

From the mailing list archives I found a link to agk's presentation
slides on LVM2, which were very helpful, but don't contain enough
information in order to do proper lvm structure parsing yet. Source code
is the only place where this is documented, right?

Anyhow, the question is this:
- should I used libdevmapper to access LVM2 data on disk or not? The aim
 for the imaging software is to be suitable in rescue disks which means
that I cannot rely on the kernel having activated any volumes.

It is also my plan to support accessing data trough VMDK-layer, so that
the actual reading would then be parseVDMK(parseLVM(parseExt())). On the
other hand the reading layer would be generic enough to support
replaceable mappings. On a related note, if anyone has information on
the format of virtual disks that MS is using in virtual PC, it would
also be helpful.

Does this sound insane or doable? Question being really "how difficult
is it to parse LVM2 on disk structures in order to locate blocks" and
"how much will the structures change during the lifetime of LVM2"?

A related problem is implementing the restoring-portion of the software.
  Should libdevmapper be used to create new LVM-structures or disk or is
it even possible? Or should I just use exec with the existing LVM2
command line tools in order to create the necessary structures?

My aim is also to support the incremental backup scenario in which only
new data will be stored in the image. In order for this work I'll need
to parse the filesystem structures much further that is done in
partimage (for example), which only parses fs-stuff enough to determine
whether some block should be stored or not.

Currently I'm mapping out the difficulty level of this project and might
abandon it all-together if it appear to be too complex so additional
information is greatly appreciated.

ak.
