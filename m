Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3KMtbp28670
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 18:55:37 -0400
Received: from outmta-1.esr.lvcm.net (outmta-1.esr.lvcm.net [24.234.0.14])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i3KMtaFe022673
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 18:55:37 -0400
Received: from localhost (localhost [127.0.0.1])
	by outmta-1.esr.lvcm.net (Postfix) with ESMTP id 977B224453
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 15:56:31 -0700 (PDT)
Received: from outmta-1.esr.lvcm.net ([127.0.0.1])
	by localhost (outmta-1.esr.lvcm.net [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 22199-10 for <linux-lvm@redhat.com>;
	Tue, 20 Apr 2004 15:56:31 -0700 (PDT)
Received: from mlug.missouri.edu (ip68-104-28-32.lv.lv.cox.net [68.104.28.32])
	by outmta-1.esr.lvcm.net (Postfix) with ESMTP id 55DA924456
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 15:56:30 -0700 (PDT)
Message-ID: <4085AA42.3050404@mlug.missouri.edu>
Date: Tue, 20 Apr 2004 15:54:58 -0700
From: Michael <mogmios@mlug.missouri.edu>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM across multiple servers?
References: <A03CEE04-9288-11D8-997C-000A95730E92@spamaps.org>
In-Reply-To: <A03CEE04-9288-11D8-997C-000A95730E92@spamaps.org>
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


>> I remember seeing some mention that in the 2.6 kernels that the new 
>> LVM implementation would allow disks across multiple servers to form 
>> one logical disk. Did I understand that correctly and if so how do I 
>> use that? I have several servers on my home LAN maxed out on the 
>> number and size of disks they can handle and would really like to be 
>> able to keep all those files managed logically in one giant drive. 
>> Thanks.
>
> I'm not sure if nbd (network block device) works as well on 2.6 as it 
> did on 2.4, but I would think you could pretty easily use that to have 
> LVM utilize disks on another machine. I must admit, I wouldn't do 
> this, as it seems rather crude. At the point you're at, a fiber 
> channel or even just external SCSI enclosure, sometimes marketted as 
> "DAS" (Direct Attached Storage) is probably worth the money.
>
> If it must be network based, nbd would work.

Thanks, I'm looking now to see if nbd or enhanced nbd work with 2.6.

How fault tolerant is LVM? If one of the nbd's went down would it freak 
up LVM? For that matter if I'm utilizing several disks on a single 
system as a volume and one of the disks dies or gets disconnected (in 
the case of an external disk) then what happens?

> I have also heard of people, in lvm1, using NFS mounted loopback files 
> as temporary snapshot storage while backing up. Sounds crazy to me!

NFS seems unreliable at best so I don't know if I'd want to use it. At 
time it's given me trouble dealing with multi-GB sized files.
