Message-ID: <3E5BB3CE.3040707@conterra.de>
From: Dieter Stueken <stueken@conterra.de>
MIME-Version: 1.0
Subject: RE: [linux-lvm] pv_move failed 
Content-Transfer-Encoding: 8bit
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
Date: Tue Feb 25 12:20:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@sistina.com

Heinz J . Mauelshagen wrote:

 >the first write to hda2 fails.
 >Could be a hardware installation problem with your new drive.

no indication. I had my VG on two 120G + 75G disks before.
The 120G disk could be moved completely, whereas moving
the 75G disk failed after 896 LE moved.

 >Have you tested if you can access hda2 fine without LVM ?

I run badblocks with no errors.

I just "strace" pvmove and get:

write(5, ..., 65536) = -1 ENOSPC (No space left on device)

seems pvmove gets a unexpected ENOSPC. OK, I got it:

fdisk -l /dev/hda   reports:

Disk /dev/hda: 255 heads, 63 sectors, 30515 cylinders
Units = cylinders of 16065 * 512 bytes

    Device Boot    Start       End    Blocks   Id  System
/dev/hda1             1       262   2104483+  83  Linux
/dev/hda2           263     22526 178835580   8e  Linux LVM

The 2nd partition does not span to the end of the disk,
where as pvdisplay shows up with 231.75 GB. I'll remove all
data from hda2 again and try to find out, how this discrepancy
came about....

Dieter.
-- 
Dieter St�ken, con terra GmbH, M�nster
     stueken@conterra.de
     http://www.conterra.de/
     (0)251-7474-501
