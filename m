Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0VNQH109623
	for <linux-lvm@redhat.com>; Tue, 31 Jan 2006 18:26:17 -0500
Received: from mos-eisley-e1.netspot.com.au (mos-eisley-e9.netspot.com.au
	[203.30.161.138])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0VNQFX7030955
	for <linux-lvm@redhat.com>; Tue, 31 Jan 2006 18:26:16 -0500
Received: from [10.2.2.8] (wicket.int.netspot.com.au [10.2.2.8])
	(authenticated bits=0)
	by mos-eisley-e1.netspot.com.au (8.13.4/8.13.4/Debian-3) with ESMTP id
	k0VNQ76t031367
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 09:56:07 +1030
Message-ID: <43DFF20D.4000605@netspot.com.au>
Date: Wed, 01 Feb 2006 09:56:05 +1030
From: Tom Lanyon <tom@netspot.com.au>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove errors
References: <43DF0F13.3060302@netspot.com.au>
	<200601310210.05881.krakrjak@volumehost.net>
In-Reply-To: <200601310210.05881.krakrjak@volumehost.net>
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

Zac Slade wrote:

>On Tuesday 31 January 2006 01:17, Tom Lanyon wrote:
>  
>
>>I need to move all the data off of my external scsi array and remove it
>>from my volume group.
>>The external array is /dev/cciss/c1d0p0, so I issued a pvmove with the
>>    
>>
>Sounds straightforward.
>
>  
>
>>following results:
>>    
>>
>>>/sbin/sh-2.05b# pvscan
>>>pvscan -- reading all physical volumes (this may take a while...)
>>>pvscan -- ACTIVE    PV  "/dev/cciss/c1d0p1" of VG "Volume0" [99.99 GB /
>>>99.99 GB Free] pvscan -- ACTIVE    PV  "/dev/cciss/c0d0p2" of VG
>>>"Volume0" [136.61 GB / 68.89 GB Free] pvscan -- total: 2 [236.62 GB] / in
>>>use: 2 [236.62 GB] / in  no VG: 0 [0]
>>>      
>>>
>I don't see /dev/cciss/c1d0p0 in the pvscan output.  It does show 
>that /dev/cciss/c1d0p1 is unused.  Also /dev/cciss/c0d0p2 is much larger than 
>c1d0p1.
>  
>
>>>/sbin/sh-2.05b# pvmove /dev/cciss/c1d0p1
>>>      
>>>
>Is this what you mean?  pvmove will remove all extents used on the specified 
>PV off of it.
>  
>
>>I've tried a --force but that didn't help.
>>    
>>
>I'm unclear about what device you are trying to reduce.......  A little more 
>clarity please.
>
>--
>Zac Slade
>  
>

Heh, Sorry Zac - should've payed more attention to what I was typing...

pvscan -- ACTIVE    PV  "/dev/cciss/c1d0p1" of VG "Volume0" [99.99 GB / 99.99 GB Free]
pvscan -- ACTIVE    PV  "/dev/cciss/c0d0p2" of VG "Volume0" [136.61 GB / 68.89 GB Free] 

I need to remove /dev/cciss/c1d0p1.
pvscan shows that its unused, but a "vgreduce Volume0 /dev/cciss/c1d0p1"
tells me it can't reduce because the PV is used.

Any ideas?

-- 
Tom Lanyon
Systems Administrator
NetSpot Pty Ltd
183 Melbourne Street, North Adelaide, 5006
Ph: +618 8361 6800   Fax: +618 8361 6811
Email: tom@netspot.com.au
