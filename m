From: neuron <neuron@hollowtube.mine.nu>
Message-Id: <20040108203554.2d609d0f@hollowbox>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Moving to a new system.
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
Date: Thu Jan  8 14:37:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I'm moving my data from the old server, kernel 2.4 and lvm1.  To a new server, kernel 2.6 and lvm2.
I thought I'd start by removing hdd1. It's 80gb and I have about 111gb free.

pvmove --test /dev/hdd1
pvmove -- couldn't find source physical volume "/dev/hdd1" in volume group "vg_main"

I have /dev/vg_main/storagelv as the drive I wanna take the space from.

pvdisplay /dev/hdd1 works, total pe's 3575
would the best way of doing this be:
lvreduce -l-3575 /dev/vg_main/storagelv
resize_reiserfs /dev/vg_main/storagelv (I think reiserfs can do online resizing?)
then umount /mnt/storage
pvmove /dev/hdd1
vgreduce /dev/hdd1
?

I wanna make damn sure I get this right before I do it.
