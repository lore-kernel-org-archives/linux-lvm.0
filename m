Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q0H8p11U029023
	for <linux-lvm@redhat.com>; Tue, 17 Jan 2012 03:51:02 -0500
Received: from mail.midoco.de (mail.midoco.de [87.139.14.43])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0H8opAG023150
	for <linux-lvm@redhat.com>; Tue, 17 Jan 2012 03:50:53 -0500
Received: from titan.midoco.de (localhost [127.0.0.1])
	by mail.midoco.de (Postfix) with ESMTP id C558EC0042
	for <linux-lvm@redhat.com>; Tue, 17 Jan 2012 08:50:47 +0000 (UTC)
Date: Tue, 17 Jan 2012 09:50:47 +0100
From: "Marcus Haarmann" <marcus.haarmann@midoco.de>
Message-ID: <H000006700c02b5d.1326790247.titan.midoco.de@MHS>
In-Reply-To: <4F0C6912.6040606@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvcreate fails
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
To: linux-lvm <linux-lvm@redhat.com>

Hi,

thanks for the input, found the (same) resolution after hours of reading 
and trying... 
(I am newly subscribed to the list, so the response reached me on the 
following day).
But yes, the link is maintained by udev.
I have no idea why especially this device was in a mode that allocation 
was prevented. We surely did not issue a 
pvchange command to do this. (other devices also maintained by lvm, in 
the same SAN, were allocatable.
Maybe it is because the array is visible to more than one machine at the 
same time due to the fibre switch.
We can address the LVM from more than one machine, which is by intention 
to be able to fail over.

Thank you for your ideas.

Best regards,

Marcus

-----Original Message-----
From: Peter M. Petrakis [mailto:peter.petrakis@canonical.com] 
Sent: Tuesday, January 10, 2012 5:37 PM
To: linux-lvm@redhat.com
Subject: Re: [linux-lvm] lvcreate fails

Hi,

On 01/09/2012 04:08 PM, Marcus Haarmann wrote:
> Hi experts,
>  
> I have configured an external disk array on Ubuntu (amd64, 2.6.32 
> kernel) with lvm2 (2.02.54) The setup is as follows:
>  
> --- Physical volume ---
>   PV Name               /dev/fc_keep1a_1 (this is a symbolic link to a 
fibre channel device)
>   VG Name               vg_uni
>   PV Size               555,23 GiB / not usable 2,20 MiB
>   Allocatable           NO
>   PE Size               4,00 MiB
>   Total PE              142139
>   Free PE               65339
>   Allocated PE          76800
>   PV UUID               SmOTSP-wPEd-ZruJ-XP8n-WpoL-anDN-ccG7dM
>  
> vgdisplay vg_uni
>   --- Volume group ---
>   VG Name               vg_uni
>   System ID            
>   Format                lvm2
>   Metadata Areas        1
>   Metadata Sequence No  20
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                4
>   Open LV               0
>   Max PV                0
>   Cur PV                1
>   Act PV                1
>   VG Size               555,23 GiB
>   PE Size               4,00 MiB
>   Total PE              142139
>   Alloc PE / Size       76800 / 300,00 GiB
>   Free  PE / Size       65339 / 255,23 GiB
>   VG UUID               0VNl5W-W22T-HEow-LvNx-gopm-nS0z-FpjZvi
> This is for a database working with raw devices (without filesystem), 
I allocated multiple partitions:
> 100 GB root
> 50 GB blob1
> 50 GB blob2
> 100 GB data1
>  
> When I try to allocate another area with 10 GB for a temporary space, 
I get an error:
> lvcreate -L 10G -n dbs_uni_tmp vg_uni
>   Insufficient free space: 2560 extents needed, but only 0 available
>  
> I did -vvv so the layout is printed (note there have been other lvm 
partitions which have been dropped):
>  Using cached label for /dev/fc_keep1a_1
>         Using cached label for /dev/fc_keep1a_1
>         Read vg_unister metadata (20) from /dev/fc_keep1a_1 at 47104 
size 1723
>         /dev/fc_keep1a_1 0:      0  25600: dbs_uni_root(0:0)
>         /dev/fc_keep1a_1 1:  25600  25600: dbs_uni_data1(0:0)
>         /dev/fc_keep1a_1 2:  51200  64000: NULL(0:0)
>         /dev/fc_keep1a_1 3: 115200  12800: dbs_uni_blob1(0:0)
>         /dev/fc_keep1a_1 4: 128000  12800: dbs_uni_blob2(0:0)
>         /dev/fc_keep1a_1 5: 140800   1339: NULL(0:0)
>     Archiving volume group "vg_unister" metadata (seqno 20).
>     Creating logical volume dbs_unister_tmp
>   Insufficient free space: 1338 extents needed, but only 0 available
>       Unlocking /var/lock/lvm/V_vg_unister
>         _undo_flock /var/lock/lvm/V_vg_unister
>         Closed /dev/fc_keep1a_1
> What can I do to be able to use the space ?

Did you notice that the backing store was state where Allocatable is NO?

Try, # pvchange -x y /dev/fc_keep1a_1

I question the use of that symlink, is it being maintained by UDEV or 
multipath friendly names? Could you please elaborate more concerning the 
events leading to this point? It doesn't make much sense that LVM would 
flip the Allocatable bit without some good external reason. Thanks.

Peter

> Thank you all for your thoughts !
> 
> Marcus Haarmann
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
