Message-Id: <200301140937.h0E9bKvO007038@pcrz175.hrz.uni-marburg.de>
From: "Thomas Gebhardt" <gebhardt@HRZ.Uni-Marburg.DE>
Mime-Version: 1.0
Subject: [linux-lvm] LVM writes on raw disk of ATA RAID Mirror
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
Date: Tue Jan 14 03:36:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

just installed a 2.4.20 Linux box (Debian woody) with a Promise
FastTrak 100TX2 ATA Raid (2 mirrored disk). I used lvm (1.0.4)
to create Physical Volumes on /dev/ataraid/d0px (x=1,2), configured
a volume group, logical volumes and installed some software.
Everything seems to work fine. But after a reboot I noticed that lvm
used to write to the raw disk partitions (/dev/hdex (x=1,2)) that
constituted one of the mirrors of the ATA Raid /dev/ataraid/d0px.
(vgdisplay, lvdisplay ... displayed /dev/hdex rather than /dev/ataraid/..)
Obviously vgscan had dedected the lvm signature on the raw disk
partititions. Needless to say that it results in a big mess when
lvm writes to one of the mirrored disks behind the back of
the raid controller.

Is there an obvious way to install lvm in such a way that
it does use /dev/ataraid/ in favor of the raw disks?

Thanks for any hint, Thomas
