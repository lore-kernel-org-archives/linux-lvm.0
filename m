Date: Tue, 25 Sep 2001 11:02:32 -0400
From: Jeff Layton <jeffrey.b.layton@lmco.com>
Message-id: <3BB09C88.8234FDE4@lmco.com>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Subject: [linux-lvm] Disk Died - Ideas?
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello,

   I searched the mailing list and the web but didn't come up with
too much to help me - so I thought I would ask the experts.
   I had 6 PVs across 6 disks (the first one was just part of the disk,
the other 5 spanned the entire drives). On top of this I had vg01
and in that I had lvol1. lvol1 was ext2 formatted and mounted as
/home. There is no striping across the disks. The first drive is
internal (part of the root disk) and the other five are external to
the machine.
   Well, of course, the last disk gave up the ghost (lots of SCSI
errors, machine will not boot without unplugging drives from
machine). I'm pretty sure you can guess what I'm going to ask :)
Can I just unplug the last drive, bring the system up, don't run
fsck on lvol1, mount lvol1, and try to pull as much data as I can
off what's left of the filesystem? If this works, then I can just
redo the PVs, the VGs, and the LVOLs and recreate the filesystem
and move over what data I can recover.
   Oh, by the way, this filesystem had no backups. The powers
to be claimed they were working on a backup solution for us,
but they didn't get one in place by the time this drive died. I know,
I know. I screamed very loudly, made lots of enemies internally,
but still no backups were ever done. It's a good thing they don't
allow firearms on the site :>

TIA,

Jeff Layton

Lockheed-Martin
