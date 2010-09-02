Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o82HWMJa014034
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2010 13:32:22 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o82HWAbG023380
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2010 13:32:10 -0400
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.3/8.14.3/SuSE Linux 0.8) with ESMTP id
	o82HW4gL025777
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2010 10:32:06 -0700
Message-ID: <4C7FDF94.4060809@tlinx.org>
Date: Thu, 02 Sep 2010 10:32:04 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <4C7F02F2.3040500@tlinx.org> <4C7F7609.5000704@redhat.com>
In-Reply-To: <4C7F7609.5000704@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lsm space giveth and space taketh away:
	missing	space?
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
To: LVM general discussion and development <linux-lvm@redhat.com>





Bryn M. Reeves wrote:
> On 09/02/2010 02:50 AM, Linda A. Walsh wrote:
>> I'm running low on space in my /backups partition.  I looked at the
>> partitions and volumes to see what might be done (besides deleting old
>> backups), and noticed:
>>
>> pvs:
>>   PV         VG         Fmt  Attr PSize  PFree
>>   /dev/sdb1  Backups    lvm2 a-   10.91T  3.15G
>
> You're running "pvs" which means you are looking at physical volumes.
> The "lvs" command would probably have been more useful.
----
    That's what threw me more than the G/T units (I knew about that, and 
thought I'd tried a conversion but only used 10^9 instead of 10^12 as a 
conversion factor: not used to parted's use of 'T' (had used fdisk 
before, which
only went up to 'M' in display units, no 'G' or 'T', AND used the OS 
friendly
1024 instead of 1000 as a multiplier when a single-letter prefix (K,M,G)
was used with the incremental size instead of the full SI unit (KB/MB/GB).


First time I've worked with 'parted' and first time I've dealt file systems
in multiple TB, so I didn't apply the 5% error needed vs. the 2% error for
1 prefix difference and the figures didn't match.  For some reason I 
expected
to see the missing 3.15G show up in the VG before the LV, but I should have
done a VGs and I'd probably have seen it there.


pvs:
  PV         VG         Fmt  Attr PSize  PFree
  /dev/sdb1  Backups    lvm2 a-   10.91T     0
vgs:
  VG         #PV #LV #SN Attr   VSize  VFree
  Backups      1   1   0 wz--n- 10.91T     0
lvs:
  LV                  VG         Attr   LSize  Origin Snap%  Move Log 
Copy%  Convert
  Backups             Backups    -wi-ao 10.91T                

----
Since I'd seent the 3.15G go away from the pv, I expected to see it pop up
under the VG as an extra 3.15G space, that's I'd then alloc to the lvs,
and then extend to the file system with xfs_growfs.

But I had a brain disconnect in using lvresize, then instead of vgresize.
Chances are my VG also had the 3.15G free, and by using the lvresize,
I circumvented that step.  I have to remember that the pvs command shows
unallocated space of the VG, not the PV, since the PV isn't subdividable.
Hmmm....not exactly the most intuitive display...since I keep equating PVs
with PDs, which they're not.  I just usually create them that way.

> Only becaus eyou are still looking at _physical_ volumes. You might be
> more impressed if you ran the lvs command (or lvdisplay which has a
> multi-line record style of output by default) before and after.
>
> You'll only see changes in the output of the PFree attribute of pvs when
> you're just manipulating LVs; if you changed the disk size and used
> pvresize or ran vgextend to add a new disk you would see changes here
> but since you're just allocating more storage to the LVs in the volume
> group the only field to change is the amount of free space on the PV.
Ok, I thought I assigned space from disk as PV's (thus marking the space as
available for the volume manager).  Then I allocated from there into VGs or
LVs.  In my case, I was aiming for 1VG in this PV, and 1LV in the VG.

    What I thought I was seeing was some unallocated space on the
PV that wasn't allocated to the VG yet.  A trivial amount
compared to the whole, but I hadn't gotten that far when the 3.15G
number disappeared out of the totals.  Using 'display' instead of 
's'(ummary):

pv(display) Backups:
 --- Physical volume ---
  PV Name               /dev/sdb1
  VG Name               Backups
  PV Size               10.91 TB / not usable 3.47 MB
  Allocatable           yes (but full)
  PE Size (KByte)       4096
  Total PE              2860799
  Free PE               0
  Allocated PE          2860799
  PV UUID               4c2f35-d439-4f47-6220-1007-0306-062860

So now in vg(display) Backups:
  --- Volume group ---
  VG Name               Backups
  System ID            
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  6
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                1
  Open LV               1
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               10.91 TB
  PE Size               4.00 MB
  Total PE              2860799
  Alloc PE / Size       2860799 / 10.91 TB
  Free  PE / Size       0 / 0 

--- I don't see anything that looks like free space there.
and under lv(display) Backups/Backups:

LV Name                /dev/Backups/Backups
  VG Name                Backups
  LV UUID                npJSrk-ECi5-S6xh-pjpZ-fYoa-gSyx-jPTkBt
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                10.91 TB
  Current LE             2860799
  Segments               1
  Allocation             inherit
  Read ahead sectors     32768
  Block device           252:1
----
  
    And...aww  wouldn't really notice it here anyway.... :-/.

    That's my problem...it disappeared between the lvs and file-system size
crack and I didn't try the xfs_grow because I looked for the space to
appear in the wrong place ...

*doh!*....

and yup: xfs_growfs:
...
data blocks changed from 2928631808 to 2929458176
(1)> 2929458176-2928631808
   = 826368  (0x000c9c00) 
(2)> 826368*4*1024
   = 3384803328  (0xc9c00000)
(3)> 826368*4/1024/1024
    = 3.15234375  (0x3) 
---
There's the 3.15G.
*sigh*

I'll probably have some similar mixup when I move to my first
disks measured in 'PB', as well... (seem to remember having a
brief confusion on the first transition from MB->GB as well,
sigh, but not so well announced-- :-)).

>
> As Stuart pointed out ...
(not too helpfully, as it didn't answer my question as it contributed
zilch to understanding what happened to the 3.15G)

> Your space hasn't gone anywhere :)
---
    As I found out when after xfs_growing it, as noted above.  Came
out to exactly the 3.15G I was missing.

> Don't forget to resize the file system:
> # fsadm resize /dev/Backup/<LV Name>
---
    That's the step I should have done for completeness and would have
answered my own question, but 'fsadm'?  ext3?
Hmmmm  ...it's part of the lvm suite!  Didn't know that.
Would have worked with my fs?  Manpage makes it look like it's
hardcoded to only use 'ext[X]' file systems.  Does it read the fs
type and call the appropriate resize command for the listed file system?
I know 'parted' at least 'knows' about 'xfs', so I would guess that
it "could" be as smart as parted, fsck, mount, etc...

    Does it have the same smarts as those other disk and file system
commands?


    Thanks for the response....it helped me work through
'my issues'.... (sigh) 

    (Now, have to deal with the *real* problem, instead of my
accounting problem:  'Backups', *did* rise to an even 11T (was 10.9T) under
linux w/933G avail, though interestingly, Windows still thinks it's
10.9T (w/932G avail), but I still need to trim by ~25-35%).  Speed really
seems to degrade in the last part of the disk -- maybe the last part of
the disk has a slower transfer speed than I think it does (besides
the slowdown as the fs-allocator, possibly, has more work to do).
