Received: from o.ww.redhat.com (vpn-4-3.stuttgart.redhat.com [10.32.4.3])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	k299k5it002413
	for <linux-lvm@redhat.com>; Thu, 9 Mar 2006 10:46:05 +0100
Date: Thu, 9 Mar 2006 10:46:05 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] LVM2 on a USB-disk/ same VG name
Message-ID: <20060309094605.GA3222@redhat.com>
References: <4248.1141894762@www078.gmx.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4248.1141894762@www078.gmx.net>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>


Hi Axel,

vgrename the active one and adjust /etc/fstab appropriately.
'vgscan;vgchange -ay' should gain you access to the USB one then.

Regards,
Heinz    -- The LVM Guy --


On Thu, Mar 09, 2006 at 09:59:22AM +0100, Axel Braun wrote:
> Hello experts,
> 
> I need your advice to save some data: My old laptop died, but I could make
> the HD work again via a USB-adapter. I attached it to the new Laptop (as
> well running SuSE 10.0 / lvm2), and the lvm on the USB-Disk is not
> displayed.
> 
> The lvm on the installed system is active:
> z60m:~ # pvdisplay /dev/sda8
>   --- Physical volume ---
>   PV Name               /dev/sda8
>   VG Name               system
>   PV Size               28.75 GB / not usable 0
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              7359
>   Free PE               11
>   Allocated PE          7348
>   PV UUID               ZdwaLr-anXc-Z7ck-cGI0-oFoW-UluI-F7SZ18
> 
> This group is also active:
> z60m:~ # lvscan
>   ACTIVE            '/dev/system/daten' [12.70 GB] inherit
>   ACTIVE            '/dev/system/home' [8.00 GB] inherit
>   ACTIVE            '/dev/system/root' [8.00 GB] inherit
> 
> Now, on the USB-disk is a LVM as well:
> z60m:~ # pvdisplay /dev/sdb8
>   --- Physical volume ---
>   PV Name               /dev/sdb8
>   VG Name               system
>   PV Size               17.48 GB / not usable 0
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              4475
>   Free PE               9
>   Allocated PE          4466
>   PV UUID               P8KDPg-QbME-4Hzc-lw8G-ntOA-1dIv-1DeXmR
> 
> vgscan does not activate the group on the USB - due to the same name?
> z60m:~ #  vgchange -a y
>   3 logical volume(s) in volume group "system" now active
> z60m:~ # pvscan
>   PV /dev/sda8   VG system   lvm2 [28.75 GB / 44.00 MB free]
>   Total: 1 [28.75 GB] / in use: 1 [28.75 GB] / in no VG: 0 [0   ]
> z60m:~ # lvscan
>   ACTIVE            '/dev/system/daten' [12.70 GB] inherit
>   ACTIVE            '/dev/system/home' [8.00 GB] inherit
>   ACTIVE            '/dev/system/root' [8.00 GB] inherit
> 
> What is your proposal to activate the USB-lvm group - best without loosing
> data.....
> 
> TIA
> Axel
> 
> -- 
> "Feel free" mit GMX FreeMail!
> Monat f?r Monat 10 FreeSMS inklusive! http://www.gmx.net
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Cluster and Storage Development                   56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
