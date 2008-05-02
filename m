Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m42ElwJw004583
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 10:47:58 -0400
Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m42ElwIU008441
	for <linux-lvm@redhat.com>; Fri, 2 May 2008 10:47:58 -0400
Message-ID: <481B299E.7040509@redhat.com>
Date: Fri, 02 May 2008 15:47:58 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
References: <Pine.LNX.4.44.0805021022270.30479-100000@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.44.0805021022270.30479-100000@bmsred.bmsi.com>
Content-Transfer-Encoding: 7bit
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

Stuart D. Gathman wrote:
> When activating a VG, missing PVs should be marked "missing", and show as 
> such with pvs.  Missing PVs should behave exactly as if they were
> not missing, but have I/O errors on every operation.  Every attempted
> I/O on a missing PV should cause a synthetic "missing PV" error.  This
> should make mirrors, etc, do the right thing.  LVs partially on the
> missing PV could be mountable, getting errors for spots on the missing PV.
> 
> The could be an option on vgchange for --ignoremissingpv to activate
> with missing PVs.  You might not want to activate with a root filesystem
> partially on a missing PV (filesystem corruption).  

Am I missing something here? vgchange --partial seems like it will do
what you want (man 8 lvm):

- -P | --partial
 When set, the tools will do their best to provide access to volume
 groups that are only partially available.  Where part of a logical
 volume is missing, /dev/ioerror  will be substituted, and you could use
 dmsetup (8) to set this up to return I/O errors when accessed, or
 create it as a large block device of nulls.  Metadata may not be
 changed with this option. To insert a replacement physical volume of
 the same or large size use pvcreate -u to set the uuid to match the
 original followed by vgcfgrestore (8).

You can also choose the device used for mapping segments on any
incomplete logical volumes by setting the missing_stripe_filler
parameter in the activation section of lvm.conf.

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFIGyme6YSQoMYUY94RAuqLAJ0SNvliyJFj+oPca084RnCrjhtLPQCeMc42
mPcsR4yUr4WSJq1K+0eyZQY=
=Fu2C
-----END PGP SIGNATURE-----
