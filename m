From: "Peter A. Castro" <doctor@fruitbat.org>
Message-ID: <Pine.LNX.4.53.0307201115560.713@gremlin.fruitbat.org>
MIME-Version: 1.0
Subject: [linux-lvm] Problem with LVM2 coredumping and damaging pv header
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
Date: Sun Jul 20 14:07:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

All,
  I've been using LVM1 for over a year now and throught I'd try the latest
LVM2 offering as well as experiment with software raid.
I have a freshly installed Slackware 9.0 installed on a test machine.  I've
patched a clean linux-2.4.20 kernel with the patches from lvmlvm_1.0.7.tar.gz
and device-mapper.1.00.02.tgz, in that order.  The patches apply without any
rejects.  The kernel builds and boots without and problem (I have md, lvm
and dm all built as modules so that I can load/unload as needed).
I've also built and installed lvm_1.0.7.tar.gz tools, device-mapper.1.00.02.tgz
tools and LVM2.2.00.05.tgz tools, in that order.  Yes, I realize that the
LVM2 tools will overlay the LVM1 tools.

I've create a very simple raid-5 raid using 3 1Gb disks (this is just a
test, after all).  The raid was initialized using mkraid as /dev/md0.  I can
mke2fs on it and mount it without any problems.

I created the device mapper control device as instructed, and I can create
a dm device /dev/mapper/vd0 using dmsetup.  I can mke2fs on it and mount it
without any problems as well.  Good, the dm code is working.  I remove
the dm device using dmsetup, because I want to use the raid device directly.

Also, I can use the LVM 1 tools to create an vg named uservg on /dev/md0,
I can then create an lv named worklv, format it and mount it with no
problems as well.

So far, so good.  I remove the lv, vg (deactivate it first) and clear the
first 1024 blocks of /dev/md0.  I also remove all the lvm info from /etc,
and unload the lvm-mod module.  System should be clean as var as LVM
data goes.

Now for LVM2.  I installed the LVM2 tools, rebooted.
I do a vgscan, it identifies the raid device in the /etc/lvm/.cache
file.  I can then use pvcreate on it and display it as well, but when
I create a vg over the pv, it says it's been created, but it can't
display it and the pv is no longer found.  Also the uservg device in /dev
never gets created:

# lvm
lvm> pvcreate /dev/md0
  No physical volume label read from /dev/md0
  Physical volume "/dev/md0" successfully created
lvm> pvs
PV         VG   Fmt  Attr PSize PFree
/dev/md0        lvm2 --   1.96G 1.96G
lvm> pvdisplay /dev/md0
  --- NEW Physical volume ---
  PV Name               /dev/md0
  VG Name
  PV Size               1.96 GB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               gr4KFN-otL6-W3KM-DwAx-0WrO-4YLY-jCSEaI

lvm> vgcreate -v -A y -l 10 -p 10 -s 32M uservg /dev/md0
    Adding physical volume '/dev/md0' to volume group 'uservg'
    Archiving volume group "uservg" metadata.
    Creating volume group backup "/etc/lvm/backup/uservg"
  Volume group "uservg" successfully created
lvm> vgdisplay uservg
  Couldn't find device with uuid 'gr4KFN-otL6-W3KM-DwAx-0WrO-4YLY-jCSEaI'.
  Couldn't find all physical volumes for volume group uservg.
  Volume group "uservg" doesn't exist
lvm> pvdisplay /dev/md0
  No physical volume label read from /dev/md0
  Failed to read physical volume "/dev/md0"
lvm> pvs
  Couldn't find device with uuid 'gr4KFN-otL6-W3KM-DwAx-0WrO-4YLY-jCSEaI'.
  Couldn't find device with uuid 'gr4KFN-otL6-W3KM-DwAx-0WrO-4YLY-jCSEaI'.
  Couldn't find all physical volumes for volume group uservg.
  Can't read uservg: skipping
lvm>

I've also tried a scenario where I do a pvcreate, then try and do a pvchange
and get a seg-fault (gdb shows it dies in pv_write()).

Any thoughts on how to solve this?  Everything builds without any errors.
I must be doing something wrong, but I just don't know what.

-- 
Peter A. Castro <doctor@fruitbat.org> or <Peter.Castro@oracle.com>
	"Cats are just autistic Dogs" -- Dr. Tony Attwood
