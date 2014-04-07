Message-ID: <534275F7.10606@redhat.com>
Date: Mon, 07 Apr 2014 11:55:03 +0200
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <d9da196656b8dec2df56a01ac8ea938c@broermann.com>
In-Reply-To: <d9da196656b8dec2df56a01ac8ea938c@broermann.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [lvm-devel] vgcreate and vgextend dont use the
 maximum space on PV
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
To: bernd@broermann.com, LVM general discussion and development <linux-lvm@redhat.com>

Moving to linux-lvm list which is intended for lvm questions like these.

See my answer bellow.

On 04/01/2014 03:51 PM, Bernd Broermann wrote:
> Hello ,
>
> I try to migrate mirror an LogicalVolumes from one disk to the other.
> The disks are identical.
>
> /dev/emcpowerd     52313  myvg
> /dev/emcpowereh    52313
>
> emcpowerd shows 512K unusable.
>
> rhel6.3# pvdisplay /dev/emcpowerd
>    --- Physical volume ---
>    PV Name               /dev/emcpowerd
>    VG Name               myvg
>    PV Size               51,09 GiB / not usable 512,00 KiB
>    Allocatable           yes (but full)
>    PE Size               4,00 MiB
>    Total PE              13078
>    Free PE               0
>    Allocated PE          13078
>    PV UUID               GyMBL2-v84W-719F-069j-Mga6-6tSe-c9fP2D
>
> when extending ( even creating ) the VG, the new PV show one less PE and
> 4,5 MiB .
> rhel6.3# vgextend myvg /dev/emcpowereh
>
> rhel6.3# pvdisplay /dev/emcpowereh
>    --- Physical volume ---
>    PV Name               /dev/emcpowereh
>    VG Name               myvg
>    PV Size               51,09 GiB / not usable 4,50 MiB
>    Allocatable           yes
>    PE Size               4,00 MiB
>    Total PE              13077
>    Free PE               13077
>    Allocated PE          0
>    PV UUID               p6VT4i-Q98Y-MbfP-WHFi-V01B-Ohcy-yRv83D
>
>
> So 13077 PE are less then 13878 PEs and mirroring fails.
> Note: the emcpower devices are SAN Devices and /dev/emcpowerd was
> created under RHEL5
>
> How can I allocate the full disk ?

See what `pvs -oall` returns in `1st PE` column - there is more space 
allocated on RHEL6(.4) for metadata and this could causing the 
unallocated space you see...

You may use `--metadata` size when creating PV to change the metadata 
area size.

Another option is there are multiple metadata areas but this is not the 
default - see the `#PMda` column and the corresponding pvcreate option 
`--metadatacopies`.

Regards,

-- Marian


>
> Thank you
> Bernd
>
> Linux rhel6.3  2.6.32-279.11.1.el6.x86_64 #1 SMP Sat Sep 22 07:10:26 EDT
> 2012 x86_64 x86_64 x86_64 GNU/Linux
> lvm2-2.02.95-10.el6.x86_64
>
>
>
> --
> lvm-devel mailing list
> lvm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/lvm-devel
