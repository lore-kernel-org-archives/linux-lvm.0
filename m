From: Matthew Johnson <mjj29@hermes.cam.ac.uk>
Message-ID: <Pine.SOL.4.44.0207160055110.25080-100000@yellow.csi.cam.ac.uk>
MIME-Version: 1.0
Subject: [linux-lvm] recovering a bad physical volume
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
Date: Mon Jul 15 19:01:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, I have just got lvm setup on my machine - and it works fine. However,
I had a problem with my root partition (not lvm) and when it came back up
one of the 2 lvm partitions on that disk said it wasn't a valid physical
volume. The otherone was fine, and the logical volumes that weren't on the
first physical volume (it wasn't striped) mounted OK. The one that was
partially on that first pv didn't, though - it said the device was not a
valid block device.

The question is, can I easily get the partition back so it mounts OK, and
failing that can I recover all (or any) of the data. all my /usr is on
there, plus some other less critical stuff, so I really could do with it.

more system details: Debian woody, with a custom 2.4.19 kernel with lvm
compiled in. The fs's all run reiserfs. THe volume group contains
/dev/hde6 /dev/hde7 & /dev/hda5. e7 & a5 are OK when I run pvdisplay, and
/dev/lvm1/var and /dev/lvm1/utils mount fine. /dev/lvm1/music doesn't
mount - I get errors reading superblock etc, and when I pvdisplay
/dev/hde6 it says it is not a valid physical volume.

Thanks,

Matthew Johnson
