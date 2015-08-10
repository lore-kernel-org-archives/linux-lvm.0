Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7A8sPRO009449
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 10 Aug 2015 04:54:25 -0400
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169]) by mx1.redhat.com (Postfix) with ESMTPS id 1ED46220
	for <linux-lvm@redhat.com>; Mon, 10 Aug 2015 08:54:24 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so13483531wic.0
	for <linux-lvm@redhat.com>; Mon, 10 Aug 2015 01:54:22 -0700 (PDT)
Received: from [192.168.0.175] ([82.118.240.130])
	by smtp.gmail.com with ESMTPSA id
	uo6sm28283950wjc.1.2015.08.10.01.54.21 for <linux-lvm@redhat.com>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Aug 2015 01:54:22 -0700 (PDT)
Message-ID: <55C86723.4000707@siteground.com>
Date: Mon, 10 Aug 2015 11:56:03 +0300
From: vaLentin chernoZemski <valentin@siteground.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvremove does not pass discards if volume is part of
	thin pool
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi folks,

I am experiencing issues with LVM thin pool and discards that should be 
passed down during lvremove but they are not.

Setup looks like this:

Sparse file -> Loop device -> PV -> VG -> Thin Pool -> LV

If we mount -o discard LV and fill it with data which is later deleted 
sparse file shrinks back ~ to the original size.

However if we directly lvremove LV, the sparse file does not shrink back 
its size so we are forced to use fallocate (which is slow).

According to the docs lvremove should issue discards to the underlying 
device but it appears that this is not the case if LV is part of thin pool

lsblk -D shows DISC-ZERO as 0 for tpool tmeta and tdata devices and all 
their childs which is strange.

[root@testbed ~]# lsblk -D | grep ^NAME ; lsblk -D | grep -A8 
$group-thingroup_tmeta
NAME                                                       DISC-ALN 
DISC-GRAN DISC-MAX DISC-ZERO
|-testgroup-thingroup_tmeta (dm-33)                               0 
    4K       4G         1
| `-testgroup-thingroup-tpool (dm-35)                             0 
   64K      64K         0
|   |-testgroup-thingroup (dm-36)                                 0 
   64K      64K         0
|   `-testgroup-testvol (dm-37)                                   0 
   64K      64K         0
`-testgroup-thingroup_tdata (dm-34)                               0 
    4K       4G         1
   `-testgroup-thingroup-tpool (dm-35)                             0 
    64K      64K         0
     |-testgroup-thingroup (dm-36)                                 0 
    64K      64K         0
     `-testgroup-testvol (dm-37)                                   0 
    64K      64K         0

Kernel version we are using is 3.12.x.

Linux 3.2 - discard support for loop devices - 
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=dfaa2ef68e80c378e610e3c8c536f1c239e8d3ef

Linux 3.4 - discard support for thin pool - 
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=104655fd4dcebd50068ef30253a001da72e3a081

/etc/lvm/lvm.conf is configured as follows

     issue_discards = 1
     thin_pool_discards = "passdown"

Here is a sample script that demonstrate the issue. Note the output 
after the second lvremove where size of "loop-block-device-file" remains 
unchanged even volume is removed.

set -e
file=/root/testfile
group=testgroup
thingroup=thingroup
volume_name=testvol
volume_size=200M

grep -i disca /etc/lvm/lvm.conf  | grep -v \#
rpm -qa | grep lvm2
uname -r

[[ -f ${file} ]] && unlink ${file}
truncate ${file} --size 10G
loopdev=$(losetup -f --show ${file})
pvcreate --metadatasize 1M ${loopdev}
vgcreate ${group} -s 1MiB ${loopdev}
pe_size=$(vgdisplay "/dev/${group}" | grep 'PE Size' | awk '{print $3}')
thin_size=$(echo "$(vgdisplay "/dev/${group}" | grep 'Free  PE' | awk 
'{print $5}')*${pe_size}-180" | bc -l)
lvcreate --ignoreactivationskip -Z n -L ${thin_size}m -T 
"/dev/${group}/${thingroup}"
lvcreate --ignoreactivationskip -V${volume_size} -T 
"${group}/${thingroup}" -n "${volume_name}"
mkfs.ext4 /dev/$group/$volume_name
sync && du -hs $file
lvs $group
lsblk -D | grep ^NAME ; lsblk -D | grep -A8 $group-thingroup_tmeta
sync && du -hs $file
mkdir -p /mnt/tmp/
mount -o discard /dev/$group/$volume_name /mnt/tmp/
dd if=/dev/zero of=/mnt/tmp/fill_file count=100 bs=1M
sync && du -hs $file
umount /mnt/tmp/
sync && du -hs $file
mount -o discard /dev/$group/$volume_name /mnt/tmp/
rm -f /mnt/tmp/fill_file
sync && du -hs $file
umount /mnt/tmp/
sync && du -hs $file
lvremove -f /dev/$group/$volume_name
lvcreate --ignoreactivationskip -V${volume_size} -T 
"${group}/${thingroup}" -n "${volume_name}"
mkfs.ext4 /dev/$group/$volume_name
lvs $group
lsblk -D | grep ^NAME ; lsblk -D | grep -A8 $group-thingroup_tmeta
sync && du -hs $file
mkdir -p /mnt/tmp/
mount -o discard /dev/$group/$volume_name /mnt/tmp/
dd if=/dev/zero of=/mnt/tmp/fill_file count=100 bs=1M
sync && du -hs $file
umount /mnt/tmp/
sync && du -hs $file
lvremove -f $group/$volume_name
echo "==== AFTER THIS LVREMOVE size should shrink but it does not ==="
sync && du -hs $file
vgchange -Kan $group
sync && du -hs $file
losetup -d $loopdev
sync && du -hs $file
echo "==== FALLOCATE does its job well but that's not the point ===="
fallocate -d $file
sync && du -hs $file

Any assistance will be highly appreciated.

Thanks,

vaLentin
