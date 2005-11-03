Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA30C5V17661
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2005 19:12:05 -0500
Received: from svs.gsfc.nasa.gov (svsmail.gsfc.nasa.gov [128.183.34.28])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jA30Bvlp029661
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2005 19:11:57 -0500
Received: from [128.183.34.47] (nu.gsfc.nasa.gov [128.183.34.47])
	by svs.gsfc.nasa.gov (Postfix) with ESMTP id 5A9E410000A7
	for <linux-lvm@redhat.com>; Wed,  2 Nov 2005 19:11:52 -0500 (EST)
Message-ID: <436955C1.5090905@svs.gsfc.nasa.gov>
Date: Wed, 02 Nov 2005 19:11:45 -0500
From: "Randall A. Jones" <rajones@svs.gsfc.nasa.gov>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Unable to remove a pvmove LV
References: <200511012135.50701.krustev@krustev.net>
In-Reply-To: <200511012135.50701.krustev@krustev.net>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Delian Krustev wrote:

> serv0:/# lvdisplay
>   --- Logical volume ---
>   LV Name                /dev/s0_data/data
>   VG Name                s0_data
>   LV UUID                Wzs9Lu-5IUj-DK88-UVnZ-QJpj-gHuD-3a01jq
>   LV Write Access        read/write
>   LV Status              available
>   # open                 1
>   LV Size                1.02 TB
>   Current LE             4164
>   Segments               23
>   Allocation             inherit
>   Read ahead sectors     0
>   Block device           254:0
> 
>   --- Logical volume ---
>   LV Name                /dev/s0_data/pvmove0
>   VG Name                s0_data
>   LV UUID                H8As4Y-m61V-krSa-lGTd-pNRh-Ef1e-UStXSC
>   LV Write Access        read/write
>   LV Status              NOT available
>   LV Size                46.50 GB
>   Current LE             186
>   Segments               1
>   Allocation             contiguous
>   Read ahead sectors     0
> 
> serv0:/# lvremove -v -f -d /dev/s0_data/pvmove0
>     Using logical volume(s) on command line
>   Can't remove locked LV pvmove0
> serv0:/# pvmove --abort -v
>     Finding all volume groups
>     Finding volume group "s0_data"

Another way to remove a misbehaving pvmove logical volume is to restore 
to a metadata config state previous to the pvmove command.  The command 
to do this is vgcfgrestore.  This is only possible if you haven't 
modified the volume group or the logical volume in a way that might 
cause you to lose something important.  For example if you created a new 
LV and put a filesystem on it *after* a failed or uncleaned pvmove, you 
CANNOT restore to the config before the pvmove or you'll lose your new LV.

DISCLAIMER: I don't know what happens if you (accidentally?) try to 
restore metadata that results in removing an active, in use volume group 
or logical volume.  Does anyone have any information about how dangerous 
this is?  Is there a check for active VGs or LVs when restoring previous 
metadata with vgcfgrestore?


For example, assuming a volume group named "vg0", to see the metadata 
config history for vg0 use:

vgcfgrestore -l vg0

Look for the desired config before the pvmove command.  Let's say the 
pvmove happened after the vg0_00009.vg metadata backup was stored, then 
restore that config with:

vgcfgrestore -v --file /etc/lvm/archive/vg0_00009.vg vg0

Be careful what you restore and look at any recent changes carefully 
before using vgcfgrestore.


Regards,
Randy
-- 
..:.::::
Randall Jones     GST      NASA Goddard Space Flight Center
HPC Visualization Support       http://hpcvis.gsfc.nasa.gov
Scientific Visualization Studio    http://svs.gsfc.nasa.gov
rajones@svs.gsfc.nasa.gov      Code 610.3      301-286-2239
