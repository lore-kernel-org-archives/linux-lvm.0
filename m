Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8N1iiDl012566
	for <linux-lvm@redhat.com>; Sun, 22 Sep 2013 21:44:44 -0400
Received: from hrndva-omtalb.mail.rr.com (hrndva-omtalb.mail.rr.com
	[71.74.56.122])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8N1ieLN001446
	for <linux-lvm@redhat.com>; Sun, 22 Sep 2013 21:44:41 -0400
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
From: Richard Petty <richard@nugnug.com>
In-Reply-To: <20120320203219.GH4969@barkeeper1-xen.linbit>
Date: Sun, 22 Sep 2013 20:44:37 -0500
Message-Id: <CE36ABA7-CB3B-4F2C-A0DA-6CE40610BED6@nugnug.com>
References: <0E20371F-6E09-42C7-951D-FCBEAB657A2D@nugnug.com>
	<20120307203153.GJ3407@barkeeper1-xen.linbit>
	<071D113E-7905-4725-ADA5-C2CC64349651@nugnug.com>
	<20120320203219.GH4969@barkeeper1-xen.linbit>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Corrupt PV (wrong size)
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
To: LVM general discussion and development <linux-lvm@redhat.com>


Hey, gang (and Lars),

After a break, I have resumed work on recovering the data off of my corrupt LVM volume. I did just come across an interesting approach that another person used to get his data off of one of his LV's that displayed a similar error message when he attempted to mount it:

His: device-mapper: table: 253:2: md127 too small for target
Mine: device-mapper: table: 253:3: sdc2 too small for target

Although we got into our predicaments by different means (I think that incomplete LV resize was my undoing) I'm wondering if anyone here thinks that his brutish approach would work for me:

  "I managed to get all my data back by deleting the LVM volumes and 
  recreating it without formatting the drives. I did have to run fsck on 
  my data volume, but all data was intact as far as I could see."

  (His entire thread is here: http://comments.gmane.org/gmane.linux.lvm.general/13142)

The data that I'm looking to retrieve is on sdc1 so I would be thrilled to drop sdc2 from the logical volume altogether. Problem is that my ability to get anywhere with LVM is zero, given my corruptions issues, hence my interested in this guy's technique.

--Richard



On Mar 20, 2012, at 3:32 PM, Lars Ellenberg <lars.ellenberg@linbit.com> wrote:

> On Mon, Mar 19, 2012 at 03:57:42PM -0500, Richard Petty wrote:
>> Sorry for the long break away from this topic....
>> 
>> On Mar 7, 2012, at 2:31 PM, Lars Ellenberg wrote:
>> 
>>> On Mon, Mar 05, 2012 at 12:46:15PM -0600, Richard Petty wrote:
>>>> GOAL: Retrieve a KVM virtual machine from an inaccessible LVM volume.
>>>> 
>>>> DESCRIPTION: In November, I was working on a home server. The system
>>>> boots to software mirrored drives but I have a hardware-based RAID5
>>>> array on it and I decided to create a logical volume and mount it at
>>>> /var/lib/libvirt/images so that all my KVM virtual machine image
>>>> files would reside on the hardware RAID.
>>>> 
>>>> All that worked fine. Later, I decided to expand that
>>>> logical volume and that's when I made a mistake which wasn't
>>>> discovered until about six weeks later when I accidentally rebooted
>>>> the server. (Good problems usually require several mistakes.)
>>>> 
>>>> Somehow, I accidentally mis-specified the second LMV physical
>>>> volume that I added to the volume group. When trying to activate
>>>> the LV filesystem, the device mapper now complains:
>>>> 
>>>> LOG ENTRY
>>>> table: 253:3: sdc2 too small for target: start=2048, len=1048584192, dev_size=1048577586
>>>> 
>>>> As you can see, the length is greater than the device size.
>>>> 
>>>> I do not know how this could have happened. I assumed that LVM tool
>>>> sanity checking would have prevented this from happening.
>>>> 
>>>> PV0 is okay.
>>>> PV1 is defective.
>>>> PV2 is okay but too small to receive a PV1's contents, I think.
>>>> PV3 was just added, hoping to migrate PV1 contents to it.
>>>> 
>>>> So I added PV3 and tried to do a move but it seems that using some
>>>> of the LMV tools is predicated on the kernel being able to activate
>>>> everything, which it refuses to do.
>>>> 
>>>> Can't migrate the data, can't resize anything. I'm stuck. If course
>>>> I've done a lot of Google research over the months but I have yet to
>>>> see a problem such as this solved.
>>>> 
>>>> Got ideas?
>>>> 
>>>> Again, my goal is to pluck a copy of a 100GB virtual machine off of
>>>> the LV. After that, I'll delete the LV.
>>>> 
>>>> ==========================
>>>> 
>>>> LMV REPORT FROM /etc/lvm/archive BEFORE THE CORRUPTION
>>>> 
>>>> vg_raid {
>>>> id = "JLeyHJ-saON-6NSF-4Hqc-1rTA-vOWE-CU5aDZ"
>>>> seqno = 2
>>>> status = ["RESIZEABLE", "READ", "WRITE"]
>>>> flags = []
>>>> extent_size = 8192 # 4 Megabytes
>>>> max_lv = 0
>>>> max_pv = 0
>>>> metadata_copies = 0
>>>> 
>>>> physical_volumes {
>>>> 
>>>> pv0 {
>>>> id = "QaF9P6-Q9ch-bFTa-O3z2-3Idi-SdIw-YMLkQI"
>>>> device = "/dev/sdc1" # Hint only
>>>> 
>>>> status = ["ALLOCATABLE"]
>>>> flags = []
>>>> dev_size = 419430400 # 200 Gigabytes
>>>> pe_start = 2048
>>> 
>>> that's number of sectors into /dev/sdc1 "Hint only"
>>> 
>>>> pe_count = 51199 # 199.996 Gigabytes
>>>> }
>>>> }
>>>> 
>>>> logical_volumes {
>>>> 
>>>> kvmfs {
>>>> id = "Hs636n-PLcl-aivI-VbTe-CAls-Zul8-m2liRY"
>>>> status = ["READ", "WRITE", "VISIBLE"]
>>>> flags = []
>>>> segment_count = 1
>>>> 
>>>> segment1 {
>>>> start_extent = 0
>>>> extent_count = 50944 # 199 Gigabytes
>>> 
>>> And that tells us your kvmfs lv is 
>>> linear, not fragmented, and starting at extent 0.
>>> Which is, as seen above, 2048 sectors into sdc1.
>>> 
>>> Try this, then look at /dev/mapper/maybe_kvmfs
>>> echo "0 $[50944 * 8192] linear /dev/sdc1 2048" |
>>> dmsetup create maybe_kvmfs
>> 
>> This did result in creating an entry at /dev/mapper/maybe_kvmfs.
>> 
>> 
>>> But see below...
>>> 
>>>> type = "striped"
>>>> stripe_count = 1 # linear
>>>> 
>>>> stripes = [
>>>> "pv0", 0
>>>> ]
>>>> }
>>>> }
>>>> }
>>>> }
>>>> 
>>>> ==========================
>>>> 
>>>> LMV REPORT FROM /etc/lvm/archive AS SEEN TODAY
>>>> 
>>>> vg_raid {
>>>> id = "JLeyHJ-saON-6NSF-4Hqc-1rTA-vOWE-CU5aDZ"
>>>> seqno = 13
>>>> status = ["RESIZEABLE", "READ", "WRITE"]
>>>> flags = []
>>>> extent_size = 8192 # 4 Megabytes
>>>> max_lv = 0
>>>> max_pv = 0
>>>> metadata_copies = 0
>>>> 
>>>> physical_volumes {
>>>> 
>>>> pv0 {
>>>> id = "QaF9P6-Q9ch-bFTa-O3z2-3Idi-SdIw-YMLkQI"
>>>> device = "/dev/sdc1" # Hint only
>>>> 
>>>> status = ["ALLOCATABLE"]
>>>> flags = []
>>>> dev_size = 419430400 # 200 Gigabytes
>>>> pe_start = 2048
>>>> pe_count = 51199 # 199.996 Gigabytes
>>>> }
>>>> 
>>>> pv1 {
>>>> id = "8o0Igh-DKC8-gsof-FuZX-2Irn-qekz-0Y2mM9"
>>>> device = "/dev/sdc2" # Hint only
>>>> 
>>>> status = ["ALLOCATABLE"]
>>>> flags = []
>>>> dev_size = 2507662218 # 1.16772 Terabytes
>>>> pe_start = 2048
>>>> pe_count = 306110 # 1.16772 Terabytes
>>>> }
>>>> 
>>>> pv2 {
>>>> id = "NuW7Bi-598r-cnLV-E1E8-Srjw-4oM4-77RJkU"
>>>> device = "/dev/sdb5" # Hint only
>>>> 
>>>> status = ["ALLOCATABLE"]
>>>> flags = []
>>>> dev_size = 859573827 # 409.877 Gigabytes
>>>> pe_start = 2048
>>>> pe_count = 104928 # 409.875 Gigabytes
>>>> }
>>>> 
>>>> pv3 {
>>>> id = "eL40Za-g3aS-92Uc-E0fT-mHrP-5rO6-HT7pKK"
>>>> device = "/dev/sdc3" # Hint only
>>>> 
>>>> status = ["ALLOCATABLE"]
>>>> flags = []
>>>> dev_size = 1459084632 # 695.746 Gigabytes
>>>> pe_start = 2048
>>>> pe_count = 178110 # 695.742 Gigabytes
>>>> }
>>>> }
>>>> 
>>>> logical_volumes {
>>>> 
>>>> kvmfs {
>>>> id = "Hs636n-PLcl-aivI-VbTe-CAls-Zul8-m2liRY"
>>>> status = ["READ", "WRITE", "VISIBLE"]
>>>> flags = []
>>>> segment_count = 2
>>> 
>>> Oops, why does it have two segments now?
>>> That must have been your resize attempt.
>>> 
>>>> segment1 {
>>>> start_extent = 0
>>>> extent_count = 51199 # 199.996 Gigabytes
>>>> 
>>>> type = "striped"
>>>> stripe_count = 1 # linear
>>>> 
>>>> stripes = [
>>>> "pv0", 0
>>>> ]
>>>> }
>>>> segment2 {
>>>> start_extent = 51199
>>>> extent_count = 128001 # 500.004 Gigabytes
>>>> 
>>>> type = "striped"
>>>> stripe_count = 1 # linear
>>>> 
>>>> stripes = [
>>>> "pv1", 0
>>> 
>>> Fortunately simple again: two segments,
>>> both starting at extent 0 of their respective pv.
>>> that gives us:
>>> 
>>> echo "0 $[51199 * 8192] linear /dev/sdc1 2048
>>> $[51199 * 8192] $[128001 * 8192] linear /dev/sdc2 2048" |
>>> dmsetup create maybe_kvmfs
>>> 
>>> (now do some read-only sanity checks...)
>> 
>> I tried this command, decrementing sdc2 from 128001 to 127999:
>> 
>> [root@zeus /dev/mapper]  echo "0 $[51199 * 8192] linear /dev/sdc1 2048 $[51199 * 8192] $[127999 * 8192] linear /dev/sdc2 2048" | dmsetup create kvmfs
>> device-mapper: create ioctl failed: Device or resource busy
>> Command failed
> 
> Well: you need to find out what to use as /dev/sdXY there, first,
> you need to match your disks/partitions to the pvs.
> 
>>> Of course you need to adjust sdc1 and sdc2 to
>>> whatever is "right".
>>> 
>>> According to the meta data dump above,
>>> "sdc1" is supposed to be your old 200 GB PV,
>>> and "sdc2" the 1.6 TB partition.
>>> 
>>> The other PVs are "sdb5" (410 GB),
>>> and a "sdc3" of 695 GB...
> 
> If "matching by size" did not work for you,
> maybe "pvs -o +pv_uuid" gives sufficient clues
> to be able to match them with the lvm meta data dump
> above, and construct a working dmsetup line.
> 
>>> If 128001 is too large, reduce until it fits.
>>> If you broke the partition table,
>>> and the partition offsets are now wrong,
>>> you have to experiment a lot,
>>> and hope for the best.
>>> 
>>> That will truncate the "kvmfs",
>>> but should not cause too much loss.
>>> 
>>> If you figured out the correct PVs and offsets,
>>> you should be able to recover it all.
>> 
>> I understand that the strategy is to reduce the declared size of PV1
>> so that LVM can enable the PV and I can mount the kvmfs LV. I'm not
>> expert at LVM, and while I can get some things done with it when there
>> are no problems, I'm out of my league when problems occur. 
> 
> -- 
> : Lars Ellenberg
> : LINBIT | Your Way to High Availability
> : DRBD/HA support and consulting http://www.linbit.com
