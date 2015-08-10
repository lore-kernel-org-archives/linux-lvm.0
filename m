Date: Mon, 10 Aug 2015 13:49:00 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20150810174900.GC22719@redhat.com>
References: <55C86723.4000707@siteground.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55C86723.4000707@siteground.com>
Subject: Re: [linux-lvm] lvremove does not pass discards if volume is part
	of thin pool
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
Content-Transfer-Encoding: 7bit
To: vaLentin chernoZemski <valentin@siteground.com>
Cc: linux-lvm@redhat.com

On Mon, Aug 10 2015 at  4:56am -0400,
vaLentin chernoZemski <valentin@siteground.com> wrote:

> Hi folks,
> 
> I am experiencing issues with LVM thin pool and discards that should
> be passed down during lvremove but they are not.
> 
> Setup looks like this:
> 
> Sparse file -> Loop device -> PV -> VG -> Thin Pool -> LV
> 
> If we mount -o discard LV and fill it with data which is later
> deleted sparse file shrinks back ~ to the original size.
> 
> However if we directly lvremove LV, the sparse file does not shrink
> back its size so we are forced to use fallocate (which is slow).
> 
> According to the docs lvremove should issue discards to the
> underlying device but it appears that this is not the case if LV is
> part of thin pool
> 
> lsblk -D shows DISC-ZERO as 0 for tpool tmeta and tdata devices and
> all their childs which is strange.
> 
> [root@testbed ~]# lsblk -D | grep ^NAME ; lsblk -D | grep -A8
> $group-thingroup_tmeta
> NAME                                                       DISC-ALN
> DISC-GRAN DISC-MAX DISC-ZERO
> |-testgroup-thingroup_tmeta (dm-33)                               0
> 4K       4G         1
> | `-testgroup-thingroup-tpool (dm-35)                             0
> 64K      64K         0
> |   |-testgroup-thingroup (dm-36)                                 0
> 64K      64K         0
> |   `-testgroup-testvol (dm-37)                                   0
> 64K      64K         0
> `-testgroup-thingroup_tdata (dm-34)                               0
> 4K       4G         1
>   `-testgroup-thingroup-tpool (dm-35)                             0
> 64K      64K         0
>     |-testgroup-thingroup (dm-36)                                 0
> 64K      64K         0
>     `-testgroup-testvol (dm-37)                                   0
> 64K      64K         0
> 
> Kernel version we are using is 3.12.x.
> 
> Linux 3.2 - discard support for loop devices - http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=dfaa2ef68e80c378e610e3c8c536f1c239e8d3ef
> 
> Linux 3.4 - discard support for thin pool - http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=104655fd4dcebd50068ef30253a001da72e3a081

Plese verify your kernel has this commit:
19fa1a6756e ("dm thin: fix discard support to a previously shared block")

But it doesn't look like you're using snapshots so this may not matter.

> /etc/lvm/lvm.conf is configured as follows
> 
>     issue_discards = 1
>     thin_pool_discards = "passdown"
> 
> Here is a sample script that demonstrate the issue. Note the output
> after the second lvremove where size of "loop-block-device-file"
> remains unchanged even volume is removed.
> 
> set -e
> file=/root/testfile
> group=testgroup
> thingroup=thingroup
> volume_name=testvol
> volume_size=200M
> 
> grep -i disca /etc/lvm/lvm.conf  | grep -v \#
> rpm -qa | grep lvm2
> uname -r
> 
> [[ -f ${file} ]] && unlink ${file}
> truncate ${file} --size 10G
> loopdev=$(losetup -f --show ${file})
> pvcreate --metadatasize 1M ${loopdev}
> vgcreate ${group} -s 1MiB ${loopdev}
> pe_size=$(vgdisplay "/dev/${group}" | grep 'PE Size' | awk '{print $3}')
> thin_size=$(echo "$(vgdisplay "/dev/${group}" | grep 'Free  PE' |
> awk '{print $5}')*${pe_size}-180" | bc -l)
> lvcreate --ignoreactivationskip -Z n -L ${thin_size}m -T
> "/dev/${group}/${thingroup}"
> lvcreate --ignoreactivationskip -V${volume_size} -T
> "${group}/${thingroup}" -n "${volume_name}"
> mkfs.ext4 /dev/$group/$volume_name
> sync && du -hs $file
> lvs $group
> lsblk -D | grep ^NAME ; lsblk -D | grep -A8 $group-thingroup_tmeta
> sync && du -hs $file
> mkdir -p /mnt/tmp/
> mount -o discard /dev/$group/$volume_name /mnt/tmp/
> dd if=/dev/zero of=/mnt/tmp/fill_file count=100 bs=1M
> sync && du -hs $file
> umount /mnt/tmp/
> sync && du -hs $file
> mount -o discard /dev/$group/$volume_name /mnt/tmp/
> rm -f /mnt/tmp/fill_file
> sync && du -hs $file
> umount /mnt/tmp/
> sync && du -hs $file
> lvremove -f /dev/$group/$volume_name
> lvcreate --ignoreactivationskip -V${volume_size} -T
> "${group}/${thingroup}" -n "${volume_name}"
> mkfs.ext4 /dev/$group/$volume_name
> lvs $group
> lsblk -D | grep ^NAME ; lsblk -D | grep -A8 $group-thingroup_tmeta
> sync && du -hs $file
> mkdir -p /mnt/tmp/
> mount -o discard /dev/$group/$volume_name /mnt/tmp/
> dd if=/dev/zero of=/mnt/tmp/fill_file count=100 bs=1M
> sync && du -hs $file
> umount /mnt/tmp/
> sync && du -hs $file
> lvremove -f $group/$volume_name
> echo "==== AFTER THIS LVREMOVE size should shrink but it does not ==="

If you do have the patch I referenced above then something else is going
on.  You should probably run with: lvremove -vvvv to see if lvm is
actually issuing a discard.  Or you could use blktrace to see if the
thin device you're removing is actually receiving a discard.
