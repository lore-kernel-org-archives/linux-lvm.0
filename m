Return-Path: <grobe@gmx.net>
Date: Tue, 21 Aug 2001 11:25:04 +0200 (MEST)
From: Lars Grobe <grobe@gmx.net>
MIME-Version: 1.0
Message-ID: <2382.998385904@www19.gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] resizing a filesystem failed, but volume was resized... can I restore the previous lv?
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
To: linux-lvm@sistina.com

Hi!

I have had problems with resizing (shrinking) a reiser fs on a lv. The fs
resizing wasn't completed, but the lv was resized than. So I wonder if I can
"undo" the resizing of the lv? In fact, the lv would have to take the same
space as before, so I could do fsck and rebuild my fs.

Thank You, CU, Lars.

www.rechnerpool.com



The messgae from the reiserfs-list follows:
___

LOG> Hi!
 LOG> This is part two of my report of a failed resize:

 LOG> Yesterday I tried to resize a reiser fs. It is build on a LVM
partition.
 LOG> As I know that there is some calculation to make the resize of LVM an
 LOG> Reiserfs fit, I used the script resize_rfs from the German magazine
 LOG> Linuxmagazin (6/2000). This script is doing some checks and
calculations
 LOG> on parameters. So I tried to shrink my fs from 320 to 290 GB.

can you send that script to me ?

 LOG> But the process was interrupted, so the fs wasn't resized completely,
 LOG> while the script did go on to the next step and resized the logical
 LOG> volume to 290 GB.

 LOG> So there are two errors in the fs: there is a started, but not
completed
 LOG> resize of the fs AND the fs is on a lvm-volume that is smaller than
the
 LOG> filesystem.

 LOG> What should I do? I would usually try to set the size of the lv back
to
 LOG> 320 GB. 

Yes. But I do not know how to force LVM system to allocate same disk space
in
same order for your logical volume again :(

 LOG> Should I do a fsck than? 

Yes. run reiserfsck --check /dev/... , then follow the instructions.

 LOG> Is there a way to keep the data (else I
 LOG> will have to replay from the backup, so I should start soon)?

I think you should try to restore LV and then run reiserfsck on it.

 LOG> Thank You, CU, Lars.

-- 
Thanks,
Alex.




-- 
GMX - Die Kommunikationsplattform im Internet.
http://www.gmx.net
