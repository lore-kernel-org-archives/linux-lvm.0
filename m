Received: from [10.34.131.19] (dhcp131-19.brq.redhat.com [10.34.131.19])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s5U9UlxN009911
	for <linux-lvm@redhat.com>; Mon, 30 Jun 2014 05:30:48 -0400
Message-ID: <53B12E46.4000605@redhat.com>
Date: Mon, 30 Jun 2014 11:30:46 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <F5727D08-8B60-4ADC-841F-D2ADD60D5033@gmail.com>
In-Reply-To: <F5727D08-8B60-4ADC-841F-D2ADD60D5033@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Read LVM structure of a virtual machine disk image
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 30.6.2014 10:36, Matteo Lanati napsal(a):
> Hi all,
>
> I have a file containing a disk image of a virtual machine. One of the partitions is LVM.
> I would like to read the information in there (i.e. the volume group name or the list of logical volumes) from the file itself without exposing the device through kpartx and/or qemu-nbd.
> My problem is that on the same physical host I could have multiple copies of the same virtual machine running, using same VGs and LVs. Even the UUID would be the same, hence the impossibility to distinguish the two virtual machines anymore.
> Of course, if I could check beforehand the structure of the disk image I could take a different decision and avoid errors.
> Thanks,


That's why there is a 'filter' setting in your lvm.conf.

You may set different device filter for each lvm command.

You could either use '--config' option with each lvm command where you set 
your filter to view only given device - or eventually with latest versions you 
may try to use profiles.

It's a users' fault to pass multiple same devices to lvm - it's mandatory to 
use different UUIDs, and it's upto user to choose how to achieve it. There is 
no way for lvm2 to resolve this inconsistency in come 'always-be-smart' way...

Zdenek
