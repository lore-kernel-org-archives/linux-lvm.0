Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBSM2CZq003521
	for <linux-lvm@redhat.com>; Thu, 28 Dec 2006 17:02:12 -0500
Received: from mail.cnr.colostate.edu (clavin.cnr.colostate.edu
	[129.82.112.67])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBSM2Bku030415
	for <linux-lvm@redhat.com>; Thu, 28 Dec 2006 17:02:11 -0500
Received: from nrelsmtp.nrel.colostate.edu (newman [129.82.112.30])
	by mail.cnr.colostate.edu (8.13.7/8.13.7) with ESMTP id kBSM24om016992
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 28 Dec 2006 15:02:04 -0700
Received: from [129.82.104.126] (donbot [129.82.104.126])
	by nrelsmtp.nrel.colostate.edu (8.13.7/8.13.7) with ESMTP id
	kBSM22EB016972
	for <linux-lvm@redhat.com>; Thu, 28 Dec 2006 15:02:02 -0700
Message-ID: <45943EDA.5080209@nrel.colostate.edu>
Date: Thu, 28 Dec 2006 15:02:02 -0700
From: "Ty! Boyack" <ty@nrel.colostate.edu>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Mirror between different SAN fabrics
References: <2421805.1167306770765.JavaMail.mailer@post.ch>	<45940A96.5040006@nrel.colostate.edu>
	<859a78260612281130m761fce9rf32240b523471608@mail.gmail.com>
In-Reply-To: <859a78260612281130m761fce9rf32240b523471608@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Actually, I'm quite surprised that this approach mangles the lvm data.  
It seems that when you do a pvcreate on a block device, LVM should (and 
I think, does) write the lvm metadata in a region of that device, and 
then never let anything touch that metadata.  This way, if you do a 'dd 
if=/dev/zeros of=<PV-DEVICE>' it blanks out the device, but the metadata 
is intact.

So, if you do a 'pvcreate' on an LV, it should contain a second copy of 
the metadata, unique and independent from the first copy on the original 
block device.  My tests on this has worked fine (although my tests have 
been for building two VGs that have striped volumes across the member 
disks, and then a VG that creates a mirrored LV of the striped volumes, 
so no multipathing is involved).  I'm wondering if we can compare notes 
to see if I'm doing something that makes it look like it's working -- I 
don't want to be quietly destroying my lvm data and not knowing it!!!

I'm doing (roughly, block devices are a bit made-up):

# prepare the physical volumes
pvcreate /dev/sda
pvcreate /dev/sdb
pvcreate /dev/sdc
pvcreate /dev/sdd
pvcreate /dev/sde

# Create volume groups to contain uniquely striped volumes
vgcreate Stripe1VG /dev/sda /dev/sdb
vgcreate Stripe2VG /dev/sdc /dev/sdd

# Create the striped volumes
lvcreate -i 2 -n Stripe1LV -L 1G Stripe1VG
lvcreate -i 2 -n Stripe2LV -L 1G Stripe2VG

# Make the striped volumes into PVs
pvcreate /dev/Stripe1VG/Stripe1LV
pvcreate /dev/Stripe2VG/Stripe2LV

# Create the volume group for mirrored volumes
vgcreate MirrorVG /dev/Stripe1VG/Stripe1LV /dev/Stripe2VG/Stripe2LV /dev/sde
# (Had to use three PVs to have the mirror log in place)

# Create the mirrored volume
lvcreate -m 1 -n Mirror1LV -L 500M MirrorVG

# Filesystem, test, etc.  this will be GFS eventually, but testing with 
ext3 for now.
mke2fs -j -i16384 -v /dev/MirrorVG/Mirror1LV
mkdir /mnt/mirror1lv
mount /dev/MirrorVG/Mirror1LV /mnt/mirror1



Is that about your procedure as well?  When does the lvm data get mangled?

(Sorry if this is going off topic - but if this is solvable it might 
actually answer the original question...)

-Ty!




Matt P wrote:
> This is basically the "messy" way I mentioned in my reply above. I
> found if you pvcreate the  LV device, you end up mangling the lvm data
> (this probably comes as little surprise) and it breaks down after
> that. So, I ended up using losetup and an "image file", one for/on
> each fabric. Then did pvcreate on each loop device, and made a new VG
> containing both PVs and created the LV with mirroring.... It
> worked.... I did no performance, stability, or failure testing...


-- 
-===========================-
  Ty! Boyack
  NREL Unix Network Manager
  ty@nrel.colostate.edu
  (970) 491-1186
-===========================-
