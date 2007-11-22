Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id lAMFIh6h006244
	for <linux-lvm@redhat.com>; Thu, 22 Nov 2007 10:18:43 -0500
Message-ID: <47459DD3.5090901@redhat.com>
Date: Thu, 22 Nov 2007 15:18:43 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Steps to "clone" a volume group
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
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi Folks,

This question seems to come up from time to time and although it's
easily possible with the current tools the steps aren't obvious to everyone.

There are a number of reasons why people want to do this; accessing
SAN-based snapshots of LVM PVs, working with system images from
virtualised hosts etc.

I wrote some notes on how to do this using pvchange/vgchange/vgrename
which you'll find below. I'll add this to the wiki but if there are any
suggestions/corrections let me know & I'll include those before I set up
the page.

Regards,
Bryn.


Cloning LVM2 Volume Groups
==========================

These instructions describe the steps required to clone an LVM2 volume
group by creating a duplicate copy of the physical storage (PVs). This
requires the VG be deactivated while the clone is created and
re-named.

Linux loopback devices (/dev/loopN) are used in this example and
provide a convenient method for testing. The volume group being
cloned, t0 consists of two PVs originally present on /dev/loop0 and
/dev/loop1. A new volume group named t0-clone will be created on
devices /dev/loop2 and /dev/loop3.

1. Deactivate the VG

       # vgchange -an t0

2. Create the cloned PV(s)

       E.g., dd, clone LUNs on storage, break mirror etc.

       # dd if=/dev/loop0 of=/dev/loop2
       # dd if=/dev/loop1 of=/dev/loop3

3. For each original PV, create a filter entry in /etc/lvm/lvm.conf to
temporarily mask the PV from the LVM tools.

Preserve a copy of the original filtering rules so that it can be
restored at the end of the process, for example:

       # cp /etc/lvm/lvm.conf /etc/lvm/lvm.conf.orig

To exclude the original loopback devices /dev/loop0 and /dev/loop1, the
filter line could look like this:

       filter = [ "r|/dev/loop0|", "r|/dev/loop1|", "a|.*|" ]

Or, using a regex to match both devices with a single rule:

       filter = [ "r|/dev/loop[01]|", "a|.*|" ]

Once the filters are set up, remove the LVM persistent cache:

       # rm -f /etc/lvm/.cache [versions before 2.02.23]
OR
       # rm -f /etc/lvm/cache/.cache [version 2.02.23 or later]

Verify that the filtering is correct by running pvscan:

       # pvscan
         PV /dev/loop2   VG t0         lvm2 [60.00 MB / 40.00 MB free]
         PV /dev/loop3   VG t0         lvm2 [60.00 MB / 40.00 MB free]
         Total: 2 [120.00 MB] / in use: 2 [120.00 MB] / in no VG: 0 [0   ]

Only the cloned PVs should be displayed. If the original PVs appear,
check the syntax of the filtering rule and clear the persistent cache
again.

4. Modify the cloned volume group name, ID and physical volume IDs to
avoid name and UUID clashes between the original and cloned devices:

For each cloned physical volume, run:

       # pvchange --uuid /path/to/physical/volume

This will generate a new random UUID for the specified physical volume
and update the volume group metadata to reflect the changed identity.

For example:

       # pvchange --uuid /dev/loop2
         Physical volume "/dev/loop2" changed
         1 physical volume changed / 0 physical volumes not changed
       # pvchange --uuid /dev/loop3
         Physical volume "/dev/loop3" changed
         1 physical volume changed / 0 physical volumes not changed

Generate a new UUID for the entire volume group using vgchange:

       # vgchange --uuid t0
         Volume group "t0" successfully changed

Finally, rename the cloned VG:

       # vgrename t0 t0-clone

5. Remove filtering rules & verify both VGs co-exist correctly

Restore the original filtering configuration and wipe the persistent cache:

       # cp /etc/lvm/lvm.conf.orig /etc/lvm/lvm.conf
       cp: overwrite `/etc/lvm/lvm.conf'? y
       # rm -f /etc/lvm/.cache

Run pvscan to verify the new and old VGs are correctly displayed:

       # pvscan
         PV /dev/loop0   VG t0         lvm2 [60.00 MB / 40.00 MB free]
         PV /dev/loop1   VG t0         lvm2 [60.00 MB / 40.00 MB free]

         PV /dev/loop2   VG t0-clone   lvm2 [60.00 MB / 40.00 MB free]
         PV /dev/loop3   VG t0-clone   lvm2 [60.00 MB / 40.00 MB free]
         Total: 4 [240.00 MB] / in use: 4 [240.00 MB] / in no VG: 0 [0  ]

6. Activate volume groups

Both the original and cloned VGs can now be activated simultaneously:

       # vgchange -ay t0
         1 logical volume(s) in volume group "t0" now active

       # vgchange -ay t0-clone
         1 logical volume(s) in volume group "t0-clone" now active

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHRZ3T6YSQoMYUY94RAhnYAKCSiTbv2kf9VzKvuA/d0pHFnuerJwCeMiM4
9z4sfBZlkMDzNhuTd54cqSk=
=gi+p
-----END PGP SIGNATURE-----
