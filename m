Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q25IkpN4024785
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2012 13:46:52 -0500
Received: from hrndva-omtalb.mail.rr.com (hrndva-omtalb.mail.rr.com
	[71.74.56.122])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q25IkpfW028974
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2012 13:46:51 -0500
From: Richard Petty <richard@nugnug.com>
Date: Mon, 5 Mar 2012 12:46:15 -0600
Message-Id: <0E20371F-6E09-42C7-951D-FCBEAB657A2D@nugnug.com>
Mime-Version: 1.0 (Apple Message framework v1257)
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Corrupt PV (wrong size)
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

GOAL: Retrieve a KVM virtual machine from an inaccessible LVM volume.

DESCRIPTION: In November, I was working on a home server. The system
boots to software mirrored drives but I have a hardware-based RAID5
array on it and I decided to create a logical volume and mount it at
/var/lib/libvirt/images so that all my KVM virtual machine image
files would reside on the hardware RAID.

All that worked fine. Later, I decided to expand that
logical volume and that's when I made a mistake which wasn't
discovered until about six weeks later when I accidentally rebooted
the server. (Good problems usually require several mistakes.)

Somehow, I accidentally mis-specified the second LMV physical
volume that I added to the volume group. When trying to activate
the LV filesystem, the device mapper now complains:

LOG ENTRY
table: 253:3: sdc2 too small for target: start=2048, len=1048584192, dev_size=1048577586

As you can see, the length is greater than the device size.

I do not know how this could have happened. I assumed that LVM tool
sanity checking would have prevented this from happening.

PV0 is okay.
PV1 is defective.
PV2 is okay but too small to receive a PV1's contents, I think.
PV3 was just added, hoping to migrate PV1 contents to it.

So I added PV3 and tried to do a move but it seems that using some
of the LMV tools is predicated on the kernel being able to activate
everything, which it refuses to do.

Can't migrate the data, can't resize anything. I'm stuck. If course
I've done a lot of Google research over the months but I have yet to
see a problem such as this solved.

Got ideas?

Again, my goal is to pluck a copy of a 100GB virtual machine off of
the LV. After that, I'll delete the LV.

==========================

LMV REPORT FROM /etc/lvm/archive BEFORE THE CORRUPTION

vg_raid {
id = "JLeyHJ-saON-6NSF-4Hqc-1rTA-vOWE-CU5aDZ"
seqno = 2
status = ["RESIZEABLE", "READ", "WRITE"]
flags = []
extent_size = 8192 # 4 Megabytes
max_lv = 0
max_pv = 0
metadata_copies = 0

physical_volumes {

pv0 {
id = "QaF9P6-Q9ch-bFTa-O3z2-3Idi-SdIw-YMLkQI"
device = "/dev/sdc1" # Hint only

status = ["ALLOCATABLE"]
flags = []
dev_size = 419430400 # 200 Gigabytes
pe_start = 2048
pe_count = 51199 # 199.996 Gigabytes
}
}

logical_volumes {

kvmfs {
id = "Hs636n-PLcl-aivI-VbTe-CAls-Zul8-m2liRY"
status = ["READ", "WRITE", "VISIBLE"]
flags = []
segment_count = 1

segment1 {
start_extent = 0
extent_count = 50944 # 199 Gigabytes

type = "striped"
stripe_count = 1 # linear

stripes = [
"pv0", 0
]
}
}
}
}

==========================

LMV REPORT FROM /etc/lvm/archive AS SEEN TODAY

vg_raid {
id = "JLeyHJ-saON-6NSF-4Hqc-1rTA-vOWE-CU5aDZ"
seqno = 13
status = ["RESIZEABLE", "READ", "WRITE"]
flags = []
extent_size = 8192 # 4 Megabytes
max_lv = 0
max_pv = 0
metadata_copies = 0

physical_volumes {

pv0 {
id = "QaF9P6-Q9ch-bFTa-O3z2-3Idi-SdIw-YMLkQI"
device = "/dev/sdc1" # Hint only

status = ["ALLOCATABLE"]
flags = []
dev_size = 419430400 # 200 Gigabytes
pe_start = 2048
pe_count = 51199 # 199.996 Gigabytes
}

pv1 {
id = "8o0Igh-DKC8-gsof-FuZX-2Irn-qekz-0Y2mM9"
device = "/dev/sdc2" # Hint only

status = ["ALLOCATABLE"]
flags = []
dev_size = 2507662218 # 1.16772 Terabytes
pe_start = 2048
pe_count = 306110 # 1.16772 Terabytes
}

pv2 {
id = "NuW7Bi-598r-cnLV-E1E8-Srjw-4oM4-77RJkU"
device = "/dev/sdb5" # Hint only

status = ["ALLOCATABLE"]
flags = []
dev_size = 859573827 # 409.877 Gigabytes
pe_start = 2048
pe_count = 104928 # 409.875 Gigabytes
}

pv3 {
id = "eL40Za-g3aS-92Uc-E0fT-mHrP-5rO6-HT7pKK"
device = "/dev/sdc3" # Hint only

status = ["ALLOCATABLE"]
flags = []
dev_size = 1459084632 # 695.746 Gigabytes
pe_start = 2048
pe_count = 178110 # 695.742 Gigabytes
}
}

logical_volumes {

kvmfs {
id = "Hs636n-PLcl-aivI-VbTe-CAls-Zul8-m2liRY"
status = ["READ", "WRITE", "VISIBLE"]
flags = []
segment_count = 2

segment1 {
start_extent = 0
extent_count = 51199 # 199.996 Gigabytes

type = "striped"
stripe_count = 1 # linear

stripes = [
"pv0", 0
]
}
segment2 {
start_extent = 51199
extent_count = 128001 # 500.004 Gigabytes

type = "striped"
stripe_count = 1 # linear

stripes = [
"pv1", 0
]
}
}
}
}

==========================

I do have a intermediate versions of the /etc/lvm/archive files
produced as I tinkered, in case they might be useful.
