Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4OIVx010205
	for <linux-lvm@redhat.com>; Mon, 24 May 2004 14:31:59 -0400
Received: from localhost.localdomain (shoenix.xs4all.nl [213.84.65.61])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i4OIVvGG031547
	for <linux-lvm@redhat.com>; Mon, 24 May 2004 14:31:58 -0400
Received: from shoenix.net (deathstar [127.0.0.1])
	by localhost.localdomain (8.12.8/8.12.8) with ESMTP id i4OIVPCR017721
	for <linux-lvm@redhat.com>; Mon, 24 May 2004 20:31:26 +0200
Message-ID: <40B23F7D.6040207@shoenix.net>
Date: Mon, 24 May 2004 20:31:25 +0200
From: Martijn Schoemaker <lvm@shoenix.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM on a drive with a bad sector?
References: <40B1B898.2050204@mlug.missouri.edu>
In-Reply-To: <40B1B898.2050204@mlug.missouri.edu>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Michael wrote:
 > I have a drive I was getting ready to change to LVM. When moving all the
 > old files off I noticed it seems to have a bad sector on the drive.. not
 > unlikely as I move a lot so the disks take a lot of physical abuse.. but
 > only that one bad sector. Is there anything special I should do before
 > using the drive with LVM to mark the sector as bad so that LVM just
 > works around it? So far there is no evidence that the entire drive is
 > failing.

Running with bad harddisks is generally a bad idea. What you should try
to do is run the manufacturers diagnostic tools over your hdd to swap
out the bad sector in the hdd's internal bad sector list (it will use
spare good blocks to swap it with). For Maxtor you can do this with
the PowerMax tool, other vendors have their own tools.

If this does not work, you can use LVM (as far as I know there is no
bad-block mapping within LVM, correct me if I'm wrong) but you need
to specify the bad block when making the filesystem. You can do this
by creating the logical volume, and then using 'badblocks' to locate
the bad block. This information can be passed to mke2fs for instance
to make it avoid the bad block (using the -l option). All other
filesystems have their own mechanism for this (if any).

Bottom line is, when a drive starts having bad sectors it's not reliable
anymore and further deterioration is possible. If you use a mirrored
configuration I think you can take the risk, but if you're not, you'd
better make sure you have a good backup system in place :)

My few cents,
Martijn
