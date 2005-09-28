Message-Id: <6.2.3.4.0.20050928141506.0be81a50@imap.nersc.gov>
Date: Wed, 28 Sep 2005 15:02:22 -0700
From: Jed Donnelley <jed@nersc.gov>
Mime-Version: 1.0
Subject: [linux-lvm] LVM(2) bug in RH ES 4.1 /etc/rc.d/sysinit.rc, RAID-1+0
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

Redhat, LVM users,

I recently set up a software RAID-1+0 array with mdadm on a Redhat ES 4.1
system where the array contained a single logical volume (LVM2).  What I
noticed is that when the system booted it wouldn't see this volume or of course
any of the file systems in it.

I did some poking around and I found this clause in /etc/rc.d/sysinit.rc:

if [ -f /etc/raidtab ]; then
     # Add raid devices
     [ -f /proc/mdstat ] || modprobe md >/dev/null 2>&1

     if [ -f /proc/mdstat ]; then
         echo -n $"Starting up RAID devices: "
...
         # LVM2 initialization, take 2
         if [ -c /dev/mapper/control -a -x /sbin/lvm.static ]; then
                 if /sbin/lvm.static vgscan > /dev/null 2>&1 ; then
                         action $"Setting up Logical Volume 
Management:" /sbin/lvm.static vgscan --mknodes --ignorelockingfailure 
&& /sbin/lvm.static vgchange -a y --ignorelockingfailure
                 fi
         fi
         # LVM initialization, take 2 (it could be on top of RAID)
         if [ -e /proc/lvm -a -x /sbin/vgchange -a -f /etc/lvmtab ]; then
                 action $"Setting up Logical Volume Management:" 
/sbin/vgscan && /sbin/vgchange -a y
         fi
     fi
fi

Of course with the new mdam RAID arrays in RH ES 4.1 there is no 
/etc/raidtab, so the first
then clause above is never entered.  This means that the logical 
volume on my RAID-1+0 array is
never found as the array isn't available when the first check for 
logical volumes is done in /etc/rc.d/sysinit.rc.

This looks like a bug to me.  My solution was to force a check for 
logical volumes after the
above clause by adding this to /etc/rc.d/sysinit.rc:

if /sbin/lvm.static vgscan > /dev/null 2>&1 ; then
     action $"Jed's Logical Volume Management setup:" 
/sbin/lvm.static vgchange -a y --ignorelockingfailure
fi

That seems to work and I believe it is otherwise harmless, though it 
might be a bit brute force.

I just wondered if anybody else has run into this problem or heard of 
any other solutions.


Incidentally, while working on this problem I noticed that if after a 
reboot if I executed:

#/sbin/lvm.static vgchange -a y --ignorelockingfailure

the volume still was not visible or set active.  However, if I did

#/sbin/lvm.static vgscan

first and then

#/sbin/lvm.static vgchange -a y --ignorelockingfailure

the volume and its file systems show up.  That seems to me like a 
failure in vgchange.
I would think it should effectively do a vgscan before setting all 
the volumes active if
it is run on all volumes.  Perhaps this doesn't reach the level of a 
bug, but it was
counter intuitive to me.

--Jed http://www.nersc.gov/~jed/
--Jed http://www.nersc.gov/~jed/
