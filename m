From: Matt Schillinger <mschilli@vss.fsi.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1054146530.1176.19.camel@mosix>
Mime-Version: 1.0
Subject: [linux-lvm] RAID Failure Problems
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
Date: Wed May 28 13:28:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

I recently had a RAID disk failure, which, due to a firmware bug, a
second drive went down.. Anyway, the data is being rebuilt (via RAID
Controller) now. It is online, but when i do a vgscan, i now only see 2
of the 4 volumes that were setup.  I am using reiserfs on all
filesystems affected.

Anyway, for lvm, i have simply used: 'pvcreate /dev/sda' (for the
/dev/sda). In other words, I didn't fdisk and set to Linux LVM. From
what I've seen, this so far has caused no problems.  Anyway, now, when i
do a vgscan, i only see 2 of the volumes.  When I do a pvdata /dev/sda
(one of the PVs not showing up), i get what looks like corrupted
naming..


--------------------------------

[root@thor root]# pvdata /dev/sda
--- Physical volume ---
PV Name               /dev/sda
VG Name               ??=D0=BC
PV Size               93.13 GB [195312500 secs] / NOT usable 2.49 GB
[LVM: 16.15 MB]
PV#                   48979801
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              23840
Free PE               0
Allocated PE          23840
PV UUID               ?


--- List of logical volumes ---

Segmentation fault
[root@thor root]#


Is there a way I can fix this?

Thanks for all your help,

--=20
Matt Schillinger
System Administrator
FlightSafety International
mschilli@vss.fsi.com
314-551-8403
