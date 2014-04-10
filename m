Message-ID: <5346A663.502@redhat.com>
Date: Thu, 10 Apr 2014 16:10:43 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <016e01cf504d$68e3b0d0$3aab1270$@edu>
	<5342A6A9.6060104@redhat.com> <5345703E.2050401@ucdavis.edu>
In-Reply-To: <5345703E.2050401@ucdavis.edu>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Can't mount LVM RAID5 drives
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
To: Ryan Davis <rrdavis@ucdavis.edu>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 04/09/2014 06:07 PM, Ryan Davis wrote:
> Thanks for explaining some of the aspects of LVs.  Used them for years
> but it's not until they break that I started reading more into it.
> 
> Here is the block device size of scdc1:
> 
> [root@hobbes ~]# blockdev --getsz /dev/sdc1
> 
> 7812441596
> 
> Here is the output of pvs -o pv_all /dev/sdc1
> 
> 
> Fmt PV UUID DevSize PV PMdaFree PMdaSize 1st PE PSize PFree Used Attr PE
> Alloc PV Tags #PMda #PMdaUse lvm2 8D67bX-xg4s-QRy1-4E8n-XfiR-0C2r-Oi1Blf
> 3.64T /dev/sdc1 92.50K 188.00K 192.00K 3.64T 0 3.64T a-- 953668 953668 1 1
> 

So we have 953668 extents, each one having 4MiB, that's 7812448256 sectors
(512-byte sectors). Then we need to add the PE start value which is 192 KiB,
which means the original device size during creation of this PV was
7812448256 + 384 = 7812448640 sectors.

The difference from the current device size reported is:

7812441596 - 7812448640 = -7044 sectors

So the disk drive is about 3.44MiB shorter now for some reason.
That's why the LV does not fit here.

I can't tell you why this happened exactly. But that's what the
sizes show.

What you can do here to fix this is to resize your filesystem/LV/PV accordingly.
If we know that it's just one extent, we can do the following:

- if it's possible, do a backup of the disk content!!!
- double check it's really /dev/sdc1 still as during reboots,
  it can be assigned a different name by kernel 

1. you can check which LV is mapped onto the PV by issuing
  pvdisplay --maps /dev/sdc1

2. then deactivate one LV found on that PV (if there are more LVs mapped
   on the PV, choose the LV that is mapped at the end of the disk since
   it's more probable that the disk is shorter at the end when compared
   to original size)
  lvchange -an <the_LV_found_on_the_PV>

3. then reduce the LV size by one extent (1 should be enough since the
   PV is shorter with 3.44 MiB) *also* with resizing the filesystem
   that's on the LV!!! (this is the "-f" option for the lvreduce, it's
   very important!!!)
   lvreduce -f -l -1 <the_LV_found_on_the_PV>

4. then make the PV size in sync with actual device size with calling:
   pvresize /dev/sdc1

5. now activate the LVs you deactivated in step 2.
   lvchange -ay <the_LVs_found_on_the_PV>   

Note that this will only work if it's possible to resize the filesystem
and the LV data are not fully allocated! (in which case you probably
lost some data already)

Take this as a hint only and be very very careful when doing this
as you may lose data when this is done incorrectly!

I'm not taking responsibility for any data loss.

If you have any more questions, feel free to ask.

-- 
Peter
