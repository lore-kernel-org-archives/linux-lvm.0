Received: from o.ww.redhat.com (vpn50-7.rdu.redhat.com [172.16.50.7])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	i31Di5mX019294
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2004 15:44:06 +0200
Date: Thu, 1 Apr 2004 15:44:04 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] max LV size
Message-ID: <20040401134404.GF29222@redhat.com>
References: <20040331154915.GD27360@tykepenguin.com>
	<Pine.LNX.4.44.0403311322580.17946-100000@zeus.itg.uiuc.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0403311322580.17946-100000@zeus.itg.uiuc.edu>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Mar 31, 2004 at 01:33:23PM -0600, Alexander Lazarevich wrote:
> Hi,
> 
> Using lvm-1.0.3-15 on RHEL3-AS, kernel 2.4.21-9.0.1.ELsmp.
> 
> I've got two SCSI devices attached to the system, each one is 1.74TB in 
> size. I want to make a single ext3 filesystem out of those devices. So I'm 
> using LVM to create a logical volume (3.48TB) out of those devices:
> 
> Even though I set the PE size to 512MB ("vgcreate -s512 /dev/sda 
> /dev/sdb"), and I can see the VG size is correct (3.18TB), the maximum LV 
> size is still 2TB:
> 
> #vgdisplay
> [root@xxxxxx root]# vgdisplay
> --- Volume group ---
> VG Name               test-vg
> VG Access             read/write
> VG Status             available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                0
> Open LV               0
> MAX LV Size           2 TB
> Max PV                256
> Cur PV                2
> Act PV                2
> VG Size               3.18 TB
> PE Size               512 MB
> Total PE              6510
> Alloc PE / Size       0 / 0
> Free  PE / Size       6510 / 3.18 TB
> VG UUID               dU1Xjg-w0Y4-aeh2-yU4l-Wo7g-Lewx-r6l1cT
>  
> Later in the man pages, it says something briefly about a 2TB block device 
> limit in linux 2.4:
> 
> #man vgcreate
> "There is also (as of Linux 2.4) a kernel limitation of 2TB per block 
> device."
> 
> Is an LV a "block device" and is this why I can't seem to create an LV 
> bigger than 2TB? If this is the problem, then LVM2 wouldn't even help, 
> would it? Is it really true that no one can create a non-softwareRAID 
> filesystem bigger than 2TB on linux 2.4? That just can't be true. Can it?

It can. That limitation is gone in Linux 2.6.

> 
> Thanks in advance,
> 
> Alex
> ---                                                               ---
>    Alex Lazarevich | Systems Administrator | Imaging Technology Group
>     Beckman Institute | University of Illinois | www.itg.uiuc.edu
> ---                                                               ---
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
