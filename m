Message-Id: <5.2.0.9.0.20031103225927.01cbecb0@mail.mame.net>
From: Karl Stenerud <kstenerud@mame.net>
Mime-Version: 1.0
Subject: [linux-lvm] LVM inaccessible after OS reinstall
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
Date: Mon Nov  3 08:25:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I recently installed Mandrake 9.2 when I discovered my current linux 
install would not support my serial ATA card and drive.

After installing it, I decided to try out LVM.  I created a group using 4 
harddrives (using entire disk, no partitioning), set up a volume, and 
formatted it with reiserfs.
Actually I started with 1 volume on the empty drive, moved the data from a 
full drive over, prepped and added that drive etc.

Unfortunately, Mandrake sucks so bad that it fragged the menus on all 
desktops when I tried to run the system update, leaving me with no shell 
access and such.
I did the ctrl-alt-f8 to get to a console shell and copied my /etc 
directory to another drive, then proceeded to reinstall the OS 
(approximately 40 times before I figured out the magical incantations 
necessary to make it not blow up in my face).
Note that the OS iteself was not on an LVM (hda is a normal, partitioned 
disk). The LVM group is on hde, hdi, hdj, and hdk.

Now that I have Mandrake behaving itself (sort of), I want to mount the LVM 
group again.  Unfortunately I can't seem to get Linux to mount it without 
complaining about not being able to reach a certain sector =(

I activated the group, did a vgscan and pvscan which created the /dev 
entries and some /etc entries, but if I try to mount it (/dev/group1/vol1), 
it sits there and does nothing (I waited 40 minutes before giving up).
If I run fsck.reiserfs on it, it sits busy for about 5-10 minutes and then 
complains about not being able to reach a sector (along with a suggestion 
that my disk has an error on it).


[root@localhost etc]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/ide/host4/bus1/target0/lun0/disc" of VG 
"group1" [74.47 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/ide/host4/bus0/target0/lun0/disc" of VG 
"group1" [93.28 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/ide/host4/bus0/target1/lun0/disc" of VG 
"group1" [149 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/ide/host2/bus0/target0/lun0/disc" of VG 
"group1" [149 GB / 0 free]
pvscan -- total: 4 [465.95 GB] / in use: 4 [465.95 GB] / in no VG: 0 [0]

[root@localhost etc]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "group1"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

[root@localhost etc]# fsck.reiserfs /dev/group1/vol1
reiserfsck 3.6.10 (2003 www.namesys.com)

*************************************************************
** If you are using the latest reiserfsprogs and  it fails **
** please  email bug reports to reiserfs-list@namesys.com, **
** providing  as  much  information  as  possible --  your **
** hardware,  kernel,  patches,  settings,  all reiserfsck **
** messages  (including version),  the reiserfsck logfile, **
** check  the  syslog file  for  any  related information. **
** If you would like advice on using this program, support **
** is available  for $25 at  www.namesys.com/support.html. **
*************************************************************

Will read-only check consistency of the filesystem on /dev/group1/vol1
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes if you do):Yes
###########
reiserfsck --check started at Mon Nov  3 09:17:04 2003
###########
Replaying journal..
0 transactions replayed

The problem has occurred looks like a hardware problem.
If you have bad blocks, we advise you to get a new hard
drive, because once you get one bad block that the disk
drive internals cannot hide from your sight, the chances
of getting more are generally said to become much higher
(precise statistics are unknown to us), and this disk drive
is probably not expensive enough for you to risk your time
and data on it. If you don't want to follow that advice,
then if you have just a few bad blocks, try writing to the
bad blocks and see if the drive remaps the bad blocks (that
means it takes a block it has in reserve and allocates it
for use for requests of that block number).  If it cannot
remap the block, this could be quite bad, as it may mean
that so many blocks have gone bad that none remain in
reserve to allocate.

bread: Cannot read the block (44171264): (Input/output error).

Aborted (core dumped)
[root@localhost etc]# 
