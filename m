Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBGIPrr08154
	for <linux-lvm@redhat.com>; Thu, 16 Dec 2004 13:25:53 -0500
Received: from anubis.medic.chalmers.se (anubis.medic.chalmers.se
	[129.16.30.218])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iBGIPlMD012044
	for <linux-lvm@redhat.com>; Thu, 16 Dec 2004 13:25:47 -0500
Received: from [193.11.254.225] (myrium.csbnet.se [193.11.254.225])
	by anubis.medic.chalmers.se (Postfix) with ESMTP id 545D8DA7F
	for <linux-lvm@redhat.com>; Thu, 16 Dec 2004 19:25:41 +0100 (CET)
Message-ID: <41C1D30A.6030201@danielroth.se>
Date: Thu, 16 Dec 2004 19:25:14 +0100
From: Daniel Roth <daniel@danielroth.se>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Can't mount after crash
References: <41BB808E.60108@danielroth.se> <41BFC24F.6060207@danielroth.se>
In-Reply-To: <41BFC24F.6060207@danielroth.se>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi all,

Not anyone out there having a clue on what to do? It seems that about 
the same thing has happened to the submitter of 
https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=142737 "Fedora Core 
3 system with lvm2 won't boot". Is this acceptable? Because of its 
impact., this is the kind of bug my company would consider a 
"show-stopper", and relabel the project "beta" again.

So if there is no way to fix the error, is there any way to recover any 
of my ~300GB of data? Fourtunately I have backuped all the crucial 
stuff, but there are a lot of things I would want to recover.

Best regards,

Daniel


> Hi!
>
>>
>> roth:/dev# pvscan
>> ....
>>  PV /dev/hdi1   VG my_volume_group   lvm2 [149.05 GB / 0    free]
>>  PV /dev/hde1   VG my_volume_group   lvm2 [76.69 GB / 0    free]
>>  PV /dev/hdg5   VG my_volume_group   lvm2 [57.25 GB / 964.00 MB free]
>>  Total: 3 [282.99 GB] / in use: 3 [282.99 GB] / in no VG: 0 [0   ]
>>
>> roth:/dev# vgscan
>>  Found volume group "my_volume_group" using metadata type lvm2
>
>
>
> With pvscan --partial -vvv I found some extra info.
>
>        /dev/mapper/my_volume_group-mylv: Added to device cache
>        /dev/my_volume_group/mylv: Aliased to 
> /dev/mapper/my_volume_group-mylv in device cache (preferred name)
>        /dev/my_volume_group/mylv: Skipping: Unrecognised LVM device 
> type 254 <---
> ...
>    Finding volume group "my_volume_group"
>        Opened /dev/hde1
>        Opened /dev/hdi1
>      /dev/hdi1: lvm2 label detected
>      /dev/hde1: lvm2 label detected
>        Opened /dev/hdg5
>      /dev/hdg5: lvm2 label detected
>        Read my_volume_group metadata (5) from /dev/hde1 at 4096 size 1341
>      /dev/hdi1: lvm2 label detected
>      /dev/hde1: lvm2 label detected
>      /dev/hdg5: lvm2 label detected
>        Read my_volume_group metadata (5) from /dev/hdi1 at 4096 size 1341
>      /dev/hdi1: lvm2 label detected
>      /dev/hde1: lvm2 label detected
>      /dev/hdg5: lvm2 label detected
>        Read my_volume_group metadata (5) from /dev/hdg5 at 4096 size 1341
>  Found volume group "my_volume_group" using metadata type lvm2
>
>
> Is this perhaps why I cant mount it? How can I restore?
> I still am a bit confused with Metadata file saying:
>               pv0 {
>                       id = "3Pv4bt-9E47-aDii-mJbB-6OYc-pCFS-7dOBv9"
>                       device = "/dev/hdi"     # Hint only
>               }
>
> when I pv(re)created hdi1
>
> Regards,
> Daniel
