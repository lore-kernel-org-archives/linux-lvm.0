Message-Id: <3C42FB04.5060301@liberate.com>
From: Chris Worley <cworley@liberate.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] reiserfs oops at init
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
Date: Mon Jan 14 09:14:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I installed SuSE 7.3 on a new disk at the end of December, using LVM 
and a reiserfs as a root partition.

I've been having problems with the ide controller and this disk, 
causing many lock-ups.

I put the new disk on the secondary controller (which, lvm shouldn't 
care that the disk has changed from hdb to hdd), and the DMA/interrupt 
problems seem to end... and a new problem begins: I can't boot this 
partition as root.  The kernel still boots off /dev/hda1, and the 
initrd runs, and finds the moved volume without any errors, but "init" 
immediately oopses (after reporting it's version number) with "invalid 
operand: 0000"...  I'm guessing this is coming from the reiserfs 
(sorry for asking this question to the lvm group, I don't know a good 
reiserfs list server).

I can boot with "init=/bin/sh".  I've run "reiserfsck" with the 
"--check" and "--fix*" options... and there are a lot of errors, and 
it ends saying there are ten errors that can be fixed with 
"--rebuild-tree" (which I can't run with the disk mounted). the 
"--rebuild-sb" option trys to run, but immediately aborts.

Booted with "init=/bin/sh", I can remount the file system read/write, 
and everything looks fine.  Given that "init" won't run from the 
command line (it will run, but only to communicate with the 
controlling "init") it's hard to figure out why we're oopsing.

Booted with "init=/bin/sh", I can run vgscan.  It gives a "modprobe" 
error about device major number 35(??? that's a midi device), but 
still says it's writing the /etc/lv* files.  But, if I then run 
lvscan, vgdisplay, etc..., it says the kernel is out of sync with the 
file systems and I need to rerun vgscan (which doesn't seem to help).

Any ideas on how to proceed?

Thanks,

Chris
