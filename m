Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3LL9Op08334
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 17:09:24 -0400
Received: from solwarra.gbrmpa.gov.au (solwarra.gbrmpa.gov.au [146.116.1.5])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3LL9MMc029007
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 17:09:23 -0400
Received: from gbrmpa.gov.au (pandemonium.gbrmpa.gov.au [146.116.2.0])
	by solwarra.gbrmpa.gov.au (8.11.6+Sun/8.10.2) with ESMTP id
	i3LL47K04100
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2004 07:04:07 +1000 (EST)
Message-ID: <4086E2FA.6090201@gbrmpa.gov.au>
Date: Thu, 22 Apr 2004 07:09:14 +1000
From: Glen Harris <glen@gbrmpa.gov.au>
MIME-Version: 1.0
Subject: Re: [linux-lvm] About Extending LVM size with Hardware Raid
References: <200404211741.i3LHfNcJ001319@smtp.doruk.net.tr>
In-Reply-To: <200404211741.i3LHfNcJ001319@smtp.doruk.net.tr>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

I have a similar system - a fibre channel RAID box. I added a disk to it
and expanded the RAID5 device, then used the scsiadd command to rescan
the device. If your card emulates a SCSI disk, this may work. Otherwise,
try unloading/loading the kernel driver module(if possible), and failing
that a reboot should work.

Anyway, the new size was reported correctly as 1.25Tb, so I then used
pvresize to grow the pv to the new size of the device.

At this point, pvresize reported "Command not implemented yet".

/sigh/

Vahric MUHTARYAN wrote:
> Hi Everybody ?! 
> 
> 	Maybe everybody know Raid5 can extend easily. I'm using hardware
> raid and I wonder What extend utulity I have to use for system . resize or
> LVM .. 
> Because with hardware raid system looks all disks like a one logical disk at
> this moment How can I intorduce extended array to system ... 
> 
> 
> Thanks  
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
