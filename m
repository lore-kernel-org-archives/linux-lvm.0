From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re: [linux-lvm] [Patch] Latest device-mapper snapshot
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20021023165627.CZKM23449.imf01bis.bellsouth.net@TAZ2>
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
Date: Wed Oct 23 11:55:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

Joe,

I haven't kept up.

What is LVM's status relative to the 2.5 feature freeze that is coming up?

TIA
Greg Freemyer

=3D=3D=3D=3D=3D
 >>  New patchballs are available here:

 >>  http://people.sistina.com/~thornber/patches/2.5-stable/

 >>  Including a diff against 2.5.44-ac1.  There are a lot of changes in
 >>  here compared to the last release, however most of these are due to
 >>  code refactoring rather than bug fixes.  Highlights include:

 >>  o) Make the changes recommended by Christoph Hellwig and others:
 >>  http://marc.theaimsgroup.com/?l=3Dlinux-kernel&m=3D103462345119681&w=3D2

 >>  o) Add reference count to struct mapped_device, and struct dm_table.

 >>  o) Hide the above two structs in their respective .c file

 >>  o) Move all locking of struct mapped_device into dm.c (we can do this now
 >>  because
 >>  of the reference counting).

 >>  o) Remove the name and uuid field from struct mapped device, these are
 >>  really
 >>  only used by the interface as a way of refering to devices.

 >>  o) Nobody needs to lookup from kdev_t -> struct mapped_device, so remove
 >>  that hash table (thanks to Al Viros recent bdev->bd_disk stuff).

 >>  o) dm.c has no need of the dm-hash.c file any more, so merge dm-hash.c
 >>  into
 >>  dm-ioctl.c (the fs interface uses the dcache for lookups).


 >>  There are still open issues that prevent things working perfectly:

 >>  o) The gendisk hash table is getting confused when removing a device.  eg,
 >>  if
 >>  I create 3 devices with minors (1, 2, 3).  Then remove minor 2,
 >>  get_gendisk=20
 >>  will remove minor =3D=3D 3. (Or I've done something really stupid).

 >>  o) Splitting pages still doesn't work, this is a generic block layer
 >>  thing rather than dm.  In practise I can only trigger this with
 >>  striped targets.  So stick to linear targets for now.


 >>  Filesystem interface to follow before the end of the week.

 >>  - Joe

 >>  _______________________________________________
 >>  linux-lvm mailing list
 >>  linux-lvm@sistina.com
 >>  http://lists.sistina.com/mailman/listinfo/linux-lvm
 >>  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/





Greg Freemyer
Internet Engineer
Deployment and Integration Specialist
Compaq ASE - Tru64 v4, v5
Compaq Master ASE - SAN Architect
The Norcross Group
www.NorcrossGroup.com
