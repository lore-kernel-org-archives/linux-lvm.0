References: <efb9fde8-8120-7098-1784-b9a72e6987f7@gmail.com>
	<20161210103705.GA7522@localhost.localdomain>
From: Peter Rajnoha <prajnoha@redhat.com>
Message-ID: <3e9843ac-e8fa-23bb-338b-a7c25370aefc@redhat.com>
Date: Mon, 12 Dec 2016 11:01:09 +0100
MIME-Version: 1.0
In-Reply-To: <20161210103705.GA7522@localhost.localdomain>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] pvcreate: vfat signature detected on /dev/sda5
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
To: jlpoole56@gmail.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 12/10/2016 11:37 AM, Bryn M. Reeves wrote:
> On Fri, Dec 09, 2016 at 07:35:24PM -0800, John L. Poole wrote:
>>    zeta jlpoole # pvcreate /dev/sda5
>>    WARNING: vfat signature detected on /dev/sda5 at offset 54. Wipe it?
>> [y/n]: n
>>      Aborted wiping of vfat.
>>      1 existing signature left on the device.
>>      Aborting pvcreate on /dev/sda5.
>>    zeta jlpoole #
> 
> If you want to confirm what's present on a device, use the blkid or
> file commands:
> 
> # blkid /dev/sda1
> /dev/sda1: UUID="49f9b992-3c68-4b59-a232-e1a3a4482eed" TYPE="ext4" PARTUUID="000298d0-01"
> 
> # file -s /dev/sda1
> /dev/sda1: Linux rev 1.0 ext4 filesystem data, UUID=49f9b992-3c68-4b59-a232-e1a3a4482eed (needs journal recovery) (extents) (large files) (huge files)
> 
> You can also use the wipefs program to manually remove any signature,
> and optionally back it up to a file so that it can be restored (it
> will also report label offsets as with pvcreate).
> 
> Both blkid and wipefs are from util-linux. The file program comes
> from the 'file' package on most distros.

LVM uses libblkid (which is from util-linux) and calls the signature detection code from this library. So this is exactly the same code as blkid and wipefs uses - they both use this library too.

You may see such warning with pvcreate (as in the scenario reported here) as well as with lvcreate where LVM runs this signature detection code from libbblkid on newly created LV data area. It's OK to run wipefs yourself before calling pvcreate, like Bryn mentioned. However, when creating new LVs and when you hit this warning, I recommend answering "yes" to wipe the signature because otherwise there may be udev hook which would automatically activate whatever old signature there was from any previous use in just allocated LV's data area (IOW, with pvcreate, you know the offset - the PV signature is written at the beginning of the disk. But with lvcreate, the LV data area is allocated in runtime and the offset and segments are calculated during that lvcreate so you never know with what offset and where to call wipefs before calling lvcreate - it's quite low level action anyway).

For example:

(just calling this to create an FS signature and simulate old signature for the lvcreate later)

# lvcreate -l1 vg
  Logical volume "lvol0" created.

# mkfs /dev/vg/lvol0
mke2fs 1.43.3 (04-Sep-2016)
Discarding device blocks: done                            
Creating filesystem with 4096 1k blocks and 1024 inodes

Allocating group tables: done                            
Writing inode tables: done                            
Writing superblocks and filesystem accounting information: done

# lvremove -ff vg

(and now, let's call lvcreate which "by chance" finds old FS signature)

# lvcreate -l1 vg
WARNING: ext2 signature detected on /dev/vg/lvol0 at offset 1080. Wipe it? [y/n]: 
  Wiping ext2 signature on /dev/vg/lvol0.
  Logical volume "lvol0" created.

If you answered "n" for the question above, LVM would not remove the old signature and if there's a hook in udev by chance which, for example, does automatic mounting, you could end up with unexpected behavior where you have these automatic actions firing in background without you knowing about them. This is just an example, but it applies to any other signatures too. If you answer "y" here, LVM activates the LV with a flag marking that device as private temporarily so udev does not scan the LV's data area yet and hence there shouldn't be any automatic actions in background based on the event. Then LVM calls the libbblkid's "wipefs" code to wipe any signatures it finds and after that it drops the "private" flag and hence any udev hook (or anyone listening on udev events) sees newly created LV with clean data area, which is what we expect normally.

So this is just for completeness that you can hit the warning with pvcreate as well as with lvcreate where it's even more important. LVM does this cleanup job for you.

-- 
Peter
