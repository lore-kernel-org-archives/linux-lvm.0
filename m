Message-ID: <4C7F7609.5000704@redhat.com>
Date: Thu, 02 Sep 2010 11:01:45 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <4C7F02F2.3040500@tlinx.org>
In-Reply-To: <4C7F02F2.3040500@tlinx.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lsm space giveth and space taketh away: missing
	space?
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
Cc: "Linda A. Walsh" <lvm@tlinx.org>

On 09/02/2010 02:50 AM, Linda A. Walsh wrote:
> I'm running low on space in my /backups partition.  I looked at the
> partitions and volumes to see what might be done (besides deleting old
> backups), and noticed:
> 
> pvs:
>   PV         VG         Fmt  Attr PSize  PFree
>   /dev/sdb1  Backups    lvm2 a-   10.91T  3.15G

You're running "pvs" which means you are looking at physical volumes.
The "lvs" command would probably have been more useful.

> ---
> So I thought 'cool', I didn't make it the full size, and
> I have some left...ok...(I didn't remember what I'd done, its
> been a while).
> 
> Run lvresize:
> lvresize /dev/Backups/Backups -L +3.15G
>   Rounding up size to full physical extent 3.15 GB
>   Extending logical volume Backups to 10.91 TB
>   Logical volume Backups successfully resized

You added 3.15G to your *logical* volume. This made it the same size
(within rounding errors and ignoring the metadata, alignment & label
overheads) as the physical volume you were looking at above.

> Um...HELLO?  Extending to 10.91?  But it was at 10.91!

You're mixing up your logical volumes (usable block devices allocated
from an LVM2 volume group) with your physical volumes (underlying disks
that provide the usable storage extents for the volume group).

http://www.errorists.org/stuff/lvm/lvm-concepts.png

The logical volume was 3.15G smaller before this operation - you can
check this if you're using the default archiving settings in
/etc/lvm/lvm.conf by looking for the "Backups" VG's archived metadata in
/etc/lvm/archive. Look for the highest numbered version (this will be a
backup of the current state _after_ the lvextend above) and then go back
and look at the previous version.

You can also review what operations have been done to the VG in the
retained archives by running:

# grep '^description' /etc/lvm/archive/<VG name>*

E.g.:

http://pastebin.com/M918gGGU

> pvs:
>   PV         VG         Fmt  Attr PSize  PFree
>   /dev/sdb1  Backups    lvm2 a-   10.91T     0
> 
> Well that was unimpressive.

Only becaus eyou are still looking at _physical_ volumes. You might be
more impressed if you ran the lvs command (or lvdisplay which has a
multi-line record style of output by default) before and after.

You'll only see changes in the output of the PFree attribute of pvs when
you're just manipulating LVs; if you changed the disk size and used
pvresize or ran vgextend to add a new disk you would see changes here
but since you're just allocating more storage to the LVs in the volume
group the only field to change is the amount of free space on the PV.

# lvdisplay bmr_vg0/root
  --- Logical volume ---
  LV Name                /dev/bmr_vg0/root
  VG Name                bmr_vg0
  LV UUID                bn0t3S-GHAq-b3vK-bvUQ-gYey-acwt-efyd5Z
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                17.81 GB
  Current LE             4560
  Segments               2
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:0

lvs
  LV   VG      Attr   LSize  Origin Snap%  Move Log Copy%  Convert
  data bmr_vg0 -wi-ao 28.00G
  home bmr_vg0 -wi-ao 84.41G
  root bmr_vg0 -wi-ao 17.81G
  var  bmr_vg0 -wi-ao  3.91G
  swap bmr_vg1 -wi-ao  3.91G

> Number  Start   End     Size    File system  Name    Flags
>  1      17.4kB  12.0TB  12.0TB               backup  lvm

As Stuart pointed out this is just binary prefix vs. SI notations:

http://physics.nist.gov/cuu/Units/binary.html
http://en.wikipedia.org/wiki/Binary_Prefix
http://en.wikipedia.org/wiki/International_System_of_Units

Your space hasn't gone anywhere :)

> How do I get my 1.09T back from lvm?  That seems like awfully
> high for an overhead number for lvm.  I'd expect more like "0.09T".

There's very little overhead to lvm in terms of space. Read through the
metadata files in your archive directory and you'll see how the data is
laid out. A few sectors are taken up with the LVM2 physical volume
label, a few more (configurable) are occupied by the metadata buffer and
on recent versions there may be some padding to provide optimal data
alignment but the rest (from pe_start in the metadata) are all available
for data allocation.

Don't forget to resize the file system:

# fsadm resize /dev/Backup/<LV Name>

Regards,
Bryn.
