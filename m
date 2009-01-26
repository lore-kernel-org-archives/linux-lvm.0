Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0QMXr2U001140
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 17:33:53 -0500
Received: from eu1sys200aog112.obsmtp.com (eu1sys200aog112.obsmtp.com
	[207.126.144.133])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n0QMXaGo000373
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 17:33:36 -0500
Received: by fg-out-1718.google.com with SMTP id d23so4185378fga.15
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 14:33:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4905EFD192EEDF4A9A19EEE98C32B7F70EC5207D@DBQV3005.na.corp.mckesson.com>
References: <4905EFD192EEDF4A9A19EEE98C32B7F70EC5207D@DBQV3005.na.corp.mckesson.com>
Date: Mon, 26 Jan 2009 23:33:35 +0100
Message-ID: <ab74ee140901261433p4f3056d5wa55e601afbef9872@mail.gmail.com>
Subject: Re: [linux-lvm] Why is part of a PV not usable?
From: Francois Cami <fcami@winsoft.fr>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Jack,

Your PE size is 4096KB and your PV's size is 2559x4096KB+3.98 MB.
In other words, your PV's size is not an exact multiple of the PE size and
all you lose is always less than the PE.
( http://tldp.org/HOWTO/LVM-HOWTO )

F


2009/1/26 Allen, Jack <Jack.Allen@mckesson.com>:
> Hello:
>         When I do "vgdisplay -v" or pvdisplay to see the PV, why is part of
> the PV not usable?
>
>  --- Physical volume ---
>   PV Name               /dev/sdd1
>   VG Name               vg01
>   PV Size               10.00 GB / not usable 3.98 MB
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              2559
>   Free PE               740
>   Allocated PE          1819
>   PV UUID               Q3LoGB-474h-ztit-HBA7-AUEX-OxpE-xoRo0J
>
> -----
> Thanks
> Jack Allen
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
