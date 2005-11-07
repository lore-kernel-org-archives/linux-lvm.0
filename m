Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA7FuwV16334
	for <linux-lvm@redhat.com>; Mon, 7 Nov 2005 10:56:58 -0500
Received: from svs.gsfc.nasa.gov (svsmail.gsfc.nasa.gov [128.183.34.28])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jA7FukIA019119
	for <linux-lvm@redhat.com>; Mon, 7 Nov 2005 10:56:47 -0500
Received: from [128.183.34.47] (nu.gsfc.nasa.gov [128.183.34.47])
	by svs.gsfc.nasa.gov (Postfix) with ESMTP id A305B10000A9
	for <linux-lvm@redhat.com>; Mon,  7 Nov 2005 10:56:39 -0500 (EST)
Message-ID: <436F7927.5080404@svs.gsfc.nasa.gov>
Date: Mon, 07 Nov 2005 10:56:23 -0500
From: "Randall A. Jones" <rajones@svs.gsfc.nasa.gov>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Failed xfs_growfs after lvextend
References: <436CFA6E.5000607@svs.gsfc.nasa.gov>
	<20051107085843.B6401970@wobbly.melbourne.sgi.com>
In-Reply-To: <20051107085843.B6401970@wobbly.melbourne.sgi.com>
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

Nathan Scott wrote:
> On Sat, Nov 05, 2005 at 01:31:10PM -0500, Randall A. Jones wrote:
> 
>>I extended an LV to 12.28TB and ran xfs_growfs on the mount point, lv0.
>>This appeared to work fine except that after this, the filesystem didn't 
>>appear any larger.
> 
> 
> I looked into this problem awhile back now.  I believe what you're
> seeing here is an inconsistency in the kernels block layer - at least,
> when I last looked at this, this was the problem - the size increase
> was indeed done inside the driver, and /sys/block/xxx/size confirmed
> that, but the interfaces which use /dev/xxx to get the device size do
> not see the increase (i.e. lseek(SEEK_END) or a BLKGETSIZE64 ioctl).
> 
> I wrote the attached program to show the issue, and sent mail to LKML
> to let folks know of the issue, I guess noone has got around to trying
> to address the problem yet though.  The core of the problem was that
> the /dev/xxx inode size (i_size) had not been updated to reflect the
> change in device size, IIRC.

Ok.  I looked at the things you suggested.  It seems that everything is 
in order with the device mapper and it sees the 12.28TB device size. 
Your getdevicesize.c code verified this with a BLKGETSIZE64 ioctl call.

root@mapdata<~>$ cat /sys/block/dm-0/size
26367492096

root@mapdata<~>$ ~rajones/getdevicesize /dev/mapper/vg0-lv0
26367492096 512 byte blocks (BLKGETSIZE64)

26367492096 512 byte blocks is approx. 12.28TB.


So, back to xfs.  Is it possible xfs_growfs is not working properly? 
The result after running xfs_growfs was that the primary superblock on 
the LV filesystem was corrupt or missing.


Is there a workaround?   A 12.28TB LV with xfs filesystem should work, yes?

One idea for a workaround is to relocate the data on the misbehaving 
LV/filesystem and recreate the LV and filesystem from scratch to avoid 
using xfs_growfs.
I have enough free PVs to create a temp space to move my existing data.

Are there any possibilities for fixing the problem "in place".

Thank you,
Randall

-- 
..:.::::
Randall Jones     GST      NASA Goddard Space Flight Center
HPC Visualization Support       http://hpcvis.gsfc.nasa.gov
Scientific Visualization Studio    http://svs.gsfc.nasa.gov
rajones@svs.gsfc.nasa.gov      Code 610.3      301-286-2239
