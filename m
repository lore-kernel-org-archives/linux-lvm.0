Message-Id: <BC9564600E40C541983FCD6BEAF814FE03C94EC0@xch-knt-15.nw.nos.boeing.com>
From: "Wolfe, Gordon W" <gordon.w.wolfe@boeing.com>
MIME-Version: 1.0
Subject: [linux-lvm] Volume groups not found
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
Date: Fri Mar  1 14:25:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "IBM LINUX-VM-L (E-mail)" <LINUX-VM@VM.MARIST.EDU>, "IBM-linux-lvm (E-mail)" <linux-lvm@sistina.com>

This is crossposted to both the Linux-390 list and the Linux-LVM list.
Sorry for the duplicates, but I'm desparate.

I've been running more than a dozen Linux guests under z/VM running SuSE
Linux/390 with the 2.2.16 kernel.  This was supplied with LVM 0.8-157.

We are in the process of upgrading to SuSE Linux/390 with the 2.4.7 kernel,
supplied with LVM 0.9.1-beta-32.

One server is running as a Samba print and file server for a department.
The /home directory is an ext2 logical volume consisting of ten real 3390-3
volumes.  This arrangement has been working fine for about six months.

In doing the upgrade from 2.2.16 to 2.4.7, we essentially replace everything
but /home and a few files in /etc.  I booted from the 2.4.7 reader ramdisk,
insmod dasd for all dasd devices, mounted the root dasd as /mnt, did a
chroot to /mnt and mounted the /usr dasd.  To recover /home, I did the usual


vgscan;vgchange -ay

This should have found all ten volumes of the volume group and logical
volumes and rebuilt the information to remount the /home logical volume.
Instead I get the messages that a) it's scanning all disk devices and b) no
logical volumes were found.

Needless to say, this is a real show-stopper.   Can anyone help me find the
solution to this problem?

"Never trust any computer you can lift."
Gordon Wolfe, Ph.D. (425)865-5940
VM Technical Services, The Boeing Company
