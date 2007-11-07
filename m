Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lA71a8Zi009431
	for <linux-lvm@redhat.com>; Tue, 6 Nov 2007 20:36:08 -0500
Received: from smtp1.res.gtwy.uscourts.gov (smtp1.res.gtwy.uscourts.gov
	[208.27.111.94])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lA71a1K0029385
	for <linux-lvm@redhat.com>; Tue, 6 Nov 2007 20:36:01 -0500
Message-ID: <OF7F3C6234.1EF68F8D-ON8625738C.00016AE7-8625738C.0008C82C@uscmail.uscourts.gov>
From: Greg_Swift@aotx.uscourts.gov
Date: Tue, 6 Nov 2007 19:35:55 -0600
MIME-Version: 1.0
Subject: [linux-lvm] developing python module for LVM(just 2?)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


Hi.

I'm in the process of writing a full bare-metal backup/recovery solution in
python and one of the steps is going to be restoring LVM.  I haven't tried
the built in backup/restore commands yet (not to that point as of now).  I
am in the process of trying to enumerate the system disks as best as
possible.  I've got it handling standard partitions (0x83) and swap so far,
and have started working on an LVM module today.  I have a feeling I might
be back with more questions as this goes further.

I went and paroused through some of the python code in system-config-lvm,
handy.. but between looking in the code and playing with the interface I
noticed that you could readily initialize a non 0x8e partition to be used
as a physical volume, and it wouldn't adjust the partition table (which I
can understand not wanting to do).  I browsed through the LVM how-to and
found this statement:

"When using LVM 1 on PCs with DOS partitions, set the partition type to
0x8e using fdisk or some other similar program.  This step is unnecessary
on PPC systems or when using LVM 2"

I can understand some of the rationale about not needing to do this, but
I'm at a loss as to how to properly enumerate a disk's configuration via a
standard chain of events if something as useful as a partition type will be
blatantly skipped?  Is there a more appropriate way of checking to see if a
partition is in use for LVM than looking at the partition type?
I know that if you run pvdisplay you will see that a full disk or partition
is configured as a PV even if the partition isn't 0x8e (I realize that is
not recommended, but it is doable). Is pvdisplay the only way to see these
two setups?

It just seems rather inconsistent to me that to restore LVM I have to
verify both the partition types and pvdisplay, and still rely more heavily
on the second, but not completely ignore the first (<-- that fun chain of
logic is what I'm complaining about)

Here is an example:

Backup software is running nightly on this system
The system has 2 VGs (not including the system ones):  mail is vg01 and
web is vg01
Sysadmin Sue has attached another series of storage and begun
configuration.
He added 2 'devices' (LUNs for sake of discussion)
Partitioned LUN0 (/dev/mapper/mpath1) with 3 primary partitions.
The first partition mpath0p0 is 0x83 that will be formatted as ext3 for
some weird reason (hey admins will be admins)
The second and third partitions mpath0p[12] are 0x8e and will be used to
expand vg00 and vg01
Then initialized LUN1 (/dev/mapper/mpath2) as a PV.
Another system crashes and Sue has to walk away.  Not a big deal, it was
routine and he has time to finish later.
Backup runs that night... what's it supposed to do with this weird disk
setup?  Should it not care (i think it should).
The next day Sysadmin Bob comes in@Sue's request to finish what she
started, but either he didn't pay attention or she didn't explain well
enough.
Bob initializes mpath0p0 as a PV and adds both mpath0p[01] to vg00 and
mpath0p2 to vg01.
Bob creates the new VG as vg02 containing /dev/mapper/mpath2
Backup runs that night... what's it supposed to do with this weird disk
setup?  It should definitely care about this setup.

Now.. is that a bit extreme, but most of those individual scenarios are
very possible.

The summation of all of this kind of comes down to two questions
1: when trying to enumerate the disks configuration of a system is the best
way to do `fdisk -l <dev>` and `pvdisplay <dev>`, allowing pvdisplay to
take precedence over partition type?
2: if not, what is the best way?

Thanks in advance...

-Greg
