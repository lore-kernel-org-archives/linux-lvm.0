Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3K57Wj26308
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 01:07:32 -0400
Received: from bedevere.spamaps.org (ip-65-77-168-70-muca.aerosurf.net
	[65.77.168.70])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i3K57WJW006474
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 01:07:32 -0400
Received: from [172.16.129.42] (helo=spamaps.org)
	by bedevere.spamaps.org with esmtp (Exim 3.35 #1 (Debian))
	id 1BFnTn-00003D-00
	for <linux-lvm@redhat.com>; Mon, 19 Apr 2004 22:07:31 -0700
Date: Mon, 19 Apr 2004 22:07:30 -0700
Subject: Re: [linux-lvm] LVM across multiple servers?
Mime-Version: 1.0 (Apple Message framework v553)
From: Clint Byrum <cbyrum@spamaps.org>
Content-Transfer-Encoding: 7bit
In-Reply-To: <40837A96.9000801@mlug.missouri.edu>
Message-Id: <A03CEE04-9288-11D8-997C-000A95730E92@spamaps.org>
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


On Monday, April 19, 2004, at 12:07 AM, Michael wrote:

> I remember seeing some mention that in the 2.6 kernels that the new 
> LVM implementation would allow disks across multiple servers to form 
> one logical disk. Did I understand that correctly and if so how do I 
> use that? I have several servers on my home LAN maxed out on the 
> number and size of disks they can handle and would really like to be 
> able to keep all those files managed logically in one giant drive. 
> Thanks.

I'm not sure if nbd (network block device) works as well on 2.6 as it 
did on 2.4, but I would think you could pretty easily use that to have 
LVM utilize disks on another machine. I must admit, I wouldn't do this, 
as it seems rather crude. At the point you're at, a fiber channel or 
even just external SCSI enclosure, sometimes marketted as "DAS" (Direct 
Attached Storage) is probably worth the money.

If it must be network based, nbd would work.

I have also heard of people, in lvm1, using NFS mounted loopback files 
as temporary snapshot storage while backing up. Sounds crazy to me!
