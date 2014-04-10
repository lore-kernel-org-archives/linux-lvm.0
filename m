Date: Thu, 10 Apr 2014 08:35:30 -0700
Message-ID: <gmi7gcxmyrtlvqfnpc11a0j8.1397144130339@email.android.com>
From: Ryan Davis <rrdavis@ucdavis.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: Peter Rajnoha <prajnoha@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Thank you so much for the help.  I will work through your pipeline but first want to try to back some of the data up.  I have about 80% backed up from a week or so ago.  How would one go about backing it up without being able to mount this.  Sorry if that is dumb question.  

Thank you again for figuring this out.

Ryan

Peter Rajnoha <prajnoha@redhat.com> wrote:

>On 04/09/2014 06:07 PM, Ryan Davis wrote:
>> Thanks for explaining some of the aspects of LVs.  Used them for years
>> but it's not until they break that I started reading more into it.
>> 
>> Here is the block device size of scdc1:
>> 
>> [root@hobbes ~]# blockdev --getsz /dev/sdc1
>> 
>> 7812441596
>> 
>> Here is the output of pvs -o pv_all /dev/sdc1
>> 
>> 
>> Fmt PV UUID DevSize PV PMdaFree PMdaSize 1st PE PSize PFree Used Attr PE
>> Alloc PV Tags #PMda #PMdaUse lvm2 8D67bX-xg4s-QRy1-4E8n-XfiR-0C2r-Oi1Blf
>> 3.64T /dev/sdc1 92.50K 188.00K 192.00K 3.64T 0 3.64T a-- 953668 953668 1 1
>> 
>
>So we have 953668 extents, each one having 4MiB, that's 7812448256 sectors
>(512-byte sectors). Then we need to add the PE start value which is 192 KiB,
>which means the original device size during creation of this PV was
>7812448256 + 384 = 7812448640 sectors.
>
>The difference from the current device size reported is:
>
>7812441596 - 7812448640 = -7044 sectors
>
>So the disk drive is about 3.44MiB shorter now for some reason.
>That's why the LV does not fit here.
>
>I can't tell you why this happened exactly. But that's what the
>sizes show.
>
>What you can do here to fix this is to resize your filesystem/LV/PV accordingly.
>If we know that it's just one extent, we can do the following:
>
>- if it's possible, do a backup of the disk content!!!
>- double check it's really /dev/sdc1 still as during reboots,
>  it can be assigned a different name by kernel 
>
>1. you can check which LV is mapped onto the PV by issuing
>  pvdisplay --maps /dev/sdc1
>
>2. then deactivate one LV found on that PV (if there are more LVs mapped
>   on the PV, choose the LV that is mapped at the end of the disk since
>   it's more probable that the disk is shorter at the end when compared
>   to original size)
>  lvchange -an <the_LV_found_on_the_PV>
>
>3. then reduce the LV size by one extent (1 should be enough since the
>   PV is shorter with 3.44 MiB) *also* with resizing the filesystem
>   that's on the LV!!! (this is the "-f" option for the lvreduce, it's
>   very important!!!)
>   lvreduce -f -l -1 <the_LV_found_on_the_PV>
>
>4. then make the PV size in sync with actual device size with calling:
>   pvresize /dev/sdc1
>
>5. now activate the LVs you deactivated in step 2.
>   lvchange -ay <the_LVs_found_on_the_PV>   
>
>Note that this will only work if it's possible to resize the filesystem
>and the LV data are not fully allocated! (in which case you probably
>lost some data already)
>
>Take this as a hint only and be very very careful when doing this
>as you may lose data when this is done incorrectly!
>
>I'm not taking responsibility for any data loss.
>
>If you have any more questions, feel free to ask.
>
>-- 
>Peter
