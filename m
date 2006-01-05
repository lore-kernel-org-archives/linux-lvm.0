Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k05Ijh124182
	for <linux-lvm@redhat.com>; Thu, 5 Jan 2006 13:45:43 -0500
Received: from desktopmusicindustry.desktopmusicindustry.com
	(desktopmusicindustry.desktopmusicindustry.com [66.70.153.192])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k05IjdWP024396
	for <linux-lvm@redhat.com>; Thu, 5 Jan 2006 13:45:39 -0500
Received: from support (adsl-69-227-240-142.dsl.pltn13.pacbell.net
	[69.227.240.142]) (authenticated bits=0)
	by desktopmusicindustry.desktopmusicindustry.com (8.12.10/8.12.10) with
	ESMTP id k05IhM2D003073
	for <linux-lvm@redhat.com>; Thu, 5 Jan 2006 10:43:23 -0800
From: "Dan Elder" <dan@absolutelynew.com>
Subject: RE: [linux-lvm] Any way to recover "logical volumes"
Date: Thu, 5 Jan 2006 10:45:39 -0800
Message-ID: <POEPJKKIACNHGGMFNPNPAEIKGLAA.dan@absolutelynew.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <0F4AE41EEE8B69A5A2B84985@dhcp-2-206.wgops.com>
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

when I run those I get the following:

[root@localhost dev]# lvscan
  Volume group "VolGroup00" is exported
[root@localhost dev]# vgscan
  Reading all physical volumes.  This may take a while...
  Found exported volume group "VolGroup00" using metadata type lvm2

But I don't know what steps to take after that to get to the data on the
disks.


when I posted this originally I noticed the following:

>  PV /dev/sda1   VG VolGroup00   lvm2 [372.59 GB / 372.59 GB free]
>  PV /dev/sdb1   VG VolGroup00   lvm2 [372.59 GB / 372.59 GB free]

which is reading each disk as if it does not have any data on it, am I
reading this right? could the data have also been wiped out?


-----Original Message-----
From: linux-lvm-bounces@redhat.com
[mailto:linux-lvm-bounces@redhat.com]On Behalf Of Michael Loftis
Sent: Thursday, January 05, 2006 10:31 AM
To: LVM general discussion and development
Subject: Re: [linux-lvm] Any way to recover "logical volumes"


vgscan
lvscan

which your startup scripts should be doing for you.  pvscan just
finds/shows pv's

--On January 5, 2006 10:08:01 AM -0800 Dan Elder <dan@absolutelynew.com>
wrote:

> Hi All, yesterday my main system drive crashed, leaving me with two 400GB
> LVM drives with data on them that I need to access. When I run pvscan I
> get the following info on a brand new system install with the LVM drives
> attached:
>
>  PV /dev/sda1   VG VolGroup00   lvm2 [372.59 GB / 372.59 GB free]
>  PV /dev/sdb1   VG VolGroup00   lvm2 [372.59 GB / 372.59 GB free]
>  Total: 2 [745.19 GB] / in use: 2 [745.19 GB] / in no VG: 0 [0   ]
>
>
> so I'm guessing(and hoping) that the data is still there, but I can't
> figure out the proper way to access or mount this. The VG says there are
> 0 logical volumes, is there a way to add the existing disks to this VG as
> logical volumes? I've been reading all of the howto's & forums & haven't
> found anything that works yet.
>
> Thanks in advance
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



--
"Genius might be described as a supreme capacity for getting its possessors
into trouble of all kinds."
-- Samuel Butler

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
