From: michael tauras <michael@rescomp.berkeley.edu>
Message-ID: <Pine.LNX.4.50.0303201333170.24359-100000@hal.rescomp.berkeley.edu>
MIME-Version: 1.0
Subject: [linux-lvm] error message - "lvm -- lvm_blk_ioctl: unknown cmd 0x540f"
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
Date: Thu Mar 20 15:40:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

Recently I've been having this message show up in my kernel logs. The
system has 9 disks stripped to one volume. It has crashed several times,
but upon reboot the volume fscks and mounts fine. Yesterday it crashed
while trying to back up a few gigs from the logical volume to a different
drive. I've done some web searches for the specific error message but to
no avail. Tried upgrading to the latest 1.x release of lvm, which didn't
help. The box is in a colo center waiting to be rebooted. Any ideas would
be helpful, thanks!

Mike
