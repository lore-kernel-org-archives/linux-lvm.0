From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Fixing corrupted LVM PV headers?
Message-Id: <20020103142740.A12868@lynx.no>
References: <3C352FFF.1946.1910201@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3C352FFF.1946.1910201@localhost>; from timshel@pobox.com on
    Fri, Jan 04, 2002 at 04:30:55AM +1100
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
Date: Thu Jan  3 15:25:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: timshel@pobox.com
Cc: linux-lvm@sistina.com

On Jan 04, 2002  04:30 +1100, timshel@pobox.com wrote:
> I've been using LVM on my home system for quite some time now, and I 
> have just recently install Windows XP, which totally stuffed up my 
> partitioning for some reason. Anyway, in the process of fixing the 
> stuff up I've managed to corrupt the first 3 sectors or so (at least, I 
> hope it's only 3 sectors) of one of the physical volumes that make up 
> my main volume group. So I've effectively lost my entire Linux system.
> 
> I'd rather not have to reinstall from scratch, as there was quite a bit 
> of stuff on some of the filesystems that would take me some time to 
> replace, so I'm wondering if there is any way of resurrecting the PV. 
> I've got the UUID of the PV (from running pvdisplay on the other PV's 
> in the group and working out which one was missing) ... If it's not 
> possible to recover the filesystem(s) that were on that particular PV, 
> would it be at all possible to recover filesystems that are entirely on 
> the other PV's?
> 
> My setup is the following:
> 
> hda6:	8Gb PV (This is the stuffed one)
> hda7:   8Gb PV
> hda8:   8Gb PV
> hdb6:   8Gb PV
> hdc:     3Gb PV
> 
> There were 5 different LV's on the VG, all with XFS filesystems except 
> for a swap volume.
> 
> /usr		~4Gb LV
> /home		~2Gb LV
> /var:		~1.3Gb LV
> /var/share	~7Gb LV
> /var/chroot	~1Gb LV
> 
> If anyone has any suggestions on possibilites for fixing this, please 
> let me know ...

Well, this seems to become my specialty:

- Look in include/linux/lvm.h for descriptions of the LVM metadata (see
  pv_disk_t, lv_disk_t, vg_disk_t, etc)
- You need to re-create the pv_disk_t struct at the start of the disk,
  and also maybe the vg_disk_t (it starts at 1kB or 4kB offset normally).
- You need to have all of the data for the pv_disk_t.  Some of it can be
  found from the other PVs, some of it you will have to calculate.
- The majority of fields _should_ be the same as that on another PV of
  _exactly_ the same size, assuming you added them with the same version
  of LVM user tools.  To start with, I would just do something like the
  following to give you the basics, and allow you to just change specific
  fields.  You _need_ to have the exact same partition sizes for this to
  work correctly, if you don't you need to do more work:

  dd if=/dev/hda7 bs=1k count=1 of=/dev/hda6

- The vg_disk_t starts with the VG UUID, so if you find it at 4kB offset,
  you are OK with that part.  If not, you should be able copy the vg_disk_t
  directly from another PV in the same VG.  The offset will depend on what
  version of tools you used to create your PV/VG, so it needs to be at the
  value of vg_on_disk.base (either 1kB or 4kB offset into the PV):

  dd if=/dev/hda7 bs=1k count=1 seek=<1k/4k> skip=<1k/4k> of=/dev/hda6

- Note that pv_uuidlist_on_disk.base and .size were changed (6kB or 8kB), so
  you _should_ be able to determine the start of the UUID list by looking at
  the disk with "od -Ax -tx4 /dev/hda6" and comparing the output to the UUIDs
  on another PV.
- At this stage, running "pvdata -avP /dev/hda6" should give you reasonable
  values back for the VG, LV, PE, and UUID data.
- You need to fix the fields pv_uuid, pv_number and pe_allocated, assuming
  the original PV is exactly the same size.  Normally I do this by either

  echo -en "<value(s)>" | dd of=/dev/hda6 bs=1 count=M seek=N

  where I echo things like "\0\0\0\001" (the latter being an octal number),
  and M and N are appropriate byte offsets into the struct (per lvm.h).  You
  need to specify M (normally 4) because echo may append a trailing newline.
   
- If the PV sizes do not match, you also need to fix pe_on_disk.size, pv_size,
  pe_total, and pe_start (maybe).  I can tell you how to do this also, but
  it is complicated so I'd rather not unless needed.
- At this point, vgscan should be able to detect the whole VG.  If the
  pe_on_disk.size value (and/or pe_start) is wrong, then you will get
  misaligned data for your filesystems that have data on that PV, and you
  have to work out the correct value.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
