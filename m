From: Alexander Lazarevich <alazarev@hera.itg.uiuc.edu>
Message-ID: <Pine.A41.4.43.0208291448530.61616-100000@hera.itg.uiuc.edu>
MIME-Version: 1.0
Subject: [linux-lvm] raid 1 destroyed!
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
Date: Thu Aug 29 14:54:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM Sistina <linux-lvm@sistina.com>

i was testing out software raid on linux 7.3 with sistina LVM installed. i
had a raid 1 mirror with two drives, and one of the drives failed (i
pulled the power on it), then i pluged it back in, rebooted, ran fdisk -l
to make sure linux could see the drive (it did), then tried running fdisk
again to create the partitions on the drive, then rebooted, then ran
'raidhotadd /dev/md0 /dev/sdb', rebooted, then my entire system was gone,
both drives had corrupted filesystem.

my question is this: since there is no man pages for raidhotadd (stupid),
how the heck do i read about how this software raid works so i dont blow
away a "real" system!

also, if i add my system drives to the LVM, can it still be in a raid 1?

thanks in adavance,

alex
---                                                        ---
   Alex Lazarevich | Systems | Imaging Technology Group
   alazarev@itg.uiuc.edu | (217)244-1565 | www.itg.uiuc.edu
---                                                        ---
