Message-Id: <6.2.5.6.0.20051012165544.08ef32a0@nersc.gov>
Date: Wed, 12 Oct 2005 18:30:18 -0700
From: Jed Donnelley <jed@nersc.gov>
Mime-Version: 1.0
Subject: [linux-lvm] Linux LVM - half baked?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com, rhn-users@redhat.com

Redhat LVM users,

Since I mentioned a minor bug in Redhat/LVM (9/28 LVM(2) bug in RH ES 
4.1 /etc/rc.d/sysinit.rc, RAID-1+0) I've done quite a number of 
additional installs using LVM.  I've now had my second system that 
got into an essentially unrecoverable state.  That's enough for me 
and LVM.  I very much like the facilities that LVM provides, but if I 
am going to lose production file systems with it - well, I will have to wait.

Below are descriptions of the two problems I've run into.  I have run 
linux rescue from a CD for both systems.  The difficulty of course is 
that since the problem seems to be in the LVM layer, there are no 
file systems to work on (e.g. with fsck).  Perhaps there are some 
tools that I'm not yet familiar with to recover logical volumes in 
some way?  These are test/development systems, but if anybody has any 
thoughts on how to recover their file systems (e.g. to get more 
confidence in LVM) I'd be quite interested to hear them - just for 
the experience and perhaps to regain some confidence in LVM.  Thanks!

In one system after doing nothing more than an up2date on a x86_64 
system and rebooting I see:
...
4 logical volume(s) in volume group "VolGroup00" now active
ERROR: failed in exec of defaults
ERROR: failed in exec of ext3
mount: error 2 mounting none
switchroot: mount failed: 23
ERROR: ext3 exited abnormally! (pid 284)
...  <three more similar to the above>
kernel panic - not syncing: Attempted to kill init!

When I look at the above disks (this is a 6 disk system,
one RAID-1 pair for /boot - not LVM - and a 4 disk RAID-10
system for /data) the partitions all look fine.  I'm not sure
what else to look for.
______________________

In the other system (an x86 system) I had a disk failure in a software RAID-1
file system for the system file system (/boot /).  I replaced the
disk and resynced it apparently successfully.  However, after
a short time that replacement disk apparently failed (wouldn't
spin up on boot).  I removed the second disk and restarted
the system.  Here is how that went:
...
Your System appears to have shut down uncleanly
fsck.ext3 -a /dev/VolGroup00/LogVol02 contains a file system with 
errors, check forced
/dev/VolGroup00/LogVol02 Inodes that were part of a corrupted orphan 
linked list found.
/dev/VolGroup00/LogVol02 UNEXPECTED INCONSISTENCY; RUN fsck MANUALLY 
(i.e. without -a or -p options)
[FAILED]
*** An error occurred during the file system check.
*** Dropping you to a shell;  The system will reboot when you leave the shell.

Give root password for maintenance (or type Control-D to continue)

---------------------

All stuff very familiar to those who've worked on corrupted file 
systems.  However, in this
case if I type Control-D or enter the root password the system goes 
through a sequence
like:

unmounting ...
automatic reboot

and reboots.  This starts the problem all over again.  As with the 
first system above
if I use a rescue disk there is no file system to run fsck on.

At this point, despite the value I see in LVM, I plan to back off on 
production deployment.
I'd be interested to hear the experiences of others.

--Jed http://www.nersc.gov/~jed/
--Jed http://www.nersc.gov/~jed/
