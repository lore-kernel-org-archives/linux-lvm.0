Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j23LhdK20281
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2005 16:43:39 -0500
Received: from server.echohome.org (s233-64-29-217.try.wideopenwest.com
	[64.233.217.29])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j23Lhbc7001974
	for <linux-lvm@redhat.com>; Thu, 3 Mar 2005 16:43:38 -0500
Message-ID: <54581.64.233.217.29.1109886129.squirrel@www.echohome.org>
In-Reply-To: <1109885756.6400.16.camel@localhost.localdomain>
References: <1109885756.6400.16.camel@localhost.localdomain>
Date: Thu, 3 Mar 2005 16:42:09 -0500 (EST)
Subject: Re: [linux-lvm] df doesn't display increased available disk space
From: "Erik Ohrnberger" <Erik@echohome.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: Erik@echohome.org,
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
To: robert.buick@btconnect.com, LVM general discussion and development <linux-lvm@redhat.com>

Don't you have to expand the filesystem before df -h will see it as
available free space in the filesystem?


On Thu, March 3, 2005 16:35, Robert Buick said:
> I'm running Fedora Core 3 with LVM2, and have added /dev/hda4 (13.09GB)
> to the VG, however this increase is not reflected if I do a df -h. Have
> I missed something?
>
> Thanks for your time,
>
> Rob Buick
>
> [root@stemme mapper]# lvscan
>   ACTIVE            '/dev/VolGroup00/LogVol00' [34.53 GB] inherit
>   ACTIVE            '/dev/VolGroup00/LogVol01' [1.94 GB] inherit
> [root@stemme mapper]# pvscan
>   PV /dev/hda2   VG VolGroup00   lvm2 [23.41 GB / 32.00 MB free]
>   PV /dev/hda4   VG VolGroup00   lvm2 [13.09 GB / 0    free]
>   Total: 2 [36.50 GB] / in use: 2 [36.50 GB] / in no VG: 0 [0   ]
> [root@stemme mapper]# vgscan
>   Reading all physical volumes.  This may take a while...
>   Found volume group "VolGroup00" using metadata type lvm2
> [root@stemme mapper]# df -h
> Filesystem            Size  Used Avail Use% Mounted on
> /dev/mapper/VolGroup00-LogVol00
>                        22G  9.0G   12G  45% /
> /dev/hda1              99M   22M   73M  23% /boot
> none                  760M     0  760M   0% /dev/shm
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
