Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAAKTFks027114
	for <linux-lvm@redhat.com>; Wed, 10 Nov 2010 15:29:15 -0500
Received: from mail-gw0-f46.google.com (mail-gw0-f46.google.com [74.125.83.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAAKT4r5021247
	for <linux-lvm@redhat.com>; Wed, 10 Nov 2010 15:29:05 -0500
Received: by gwb11 with SMTP id 11so233544gwb.33
	for <linux-lvm@redhat.com>; Wed, 10 Nov 2010 12:29:04 -0800 (PST)
Message-ID: <4CDB008C.1080001@gmail.com>
Date: Wed, 10 Nov 2010 15:29:00 -0500
From: Mauricio Tavares <raubvogel@gmail.com>
MIME-Version: 1.0
References: <1289415481.17929.9@raydesk1.bettercgi.com>
In-Reply-To: <1289415481.17929.9@raydesk1.bettercgi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Bad disk?
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

On 11/10/2010 01:58 PM, Ray Morris wrote:
> On 11/10/2010 11:56:24 AM, Mauricio Tavares wrote:
>
>> How can I find which drive /dev/dm-0 is?
>
> Try:
> cat /sys/block/dm-0/dm/name
>
> On my system, I created dm2device so I can tell which snapshot is
> full or whatever device has a problem:
>
> # cat /usr/local/bin/dm2device
> #!/bin/sh
>
> cat /sys/block/$1/dm/name
>
	Thanks!

cat /sys/block/dm-0/dm/name returned export-vms, which is /dev/sdc1.

> --
> Ray Morris
> support@bettercgi.com
>
> Strongbox - The next generation in site security:
> http://www.bettercgi.com/strongbox/
>
> Throttlebox - Intelligent Bandwidth Control
> http://www.bettercgi.com/throttlebox/
>
> Strongbox / Throttlebox affiliate program:
> http://www.bettercgi.com/affiliates/user/register.php
>
>
> On 11/10/2010 11:56:24 AM, Mauricio Tavares wrote:
>> On 11/10/2010 10:11 AM, Phillip Susi wrote:
>>> On 11/10/2010 9:39 AM, Mauricio Tavares wrote:
>>>> Yesterday I added a hard drive (to put extra stuff on it) to my ubuntu
>>>> 10.10 box and created a LVM in it. Then copied some files to it and
>>>> restarted the machine to see if it would mount into the right
>>>> mountpoint. It didn't. So I decided to see if it was there (vg in
>>>> question is export):
>>>
>>> None of the errors you posted mention a physical disk at all, so there
>>> isn't anything wrong with them. To find out what dm-0 is you need to
>>> poke around with dmsetup.
>>
>> Now that might be interesting since I honestly do not know how to use
>> it (and my google-fu seems weak today). But this is a bit more info I
>> found:
>>
>> raub@strangepork:~$ sudo pvs -a
>> /dev/dm-0: read failed after 0 of 4096 at 0: Input/output error
>> /dev/dm-0: read failed after 0 of 4096 at 429496664064: Input/output
>> error
>> /dev/dm-0: read failed after 0 of 4096 at 429496721408: Input/output
>> error
>> /dev/dm-0: read failed after 0 of 4096 at 0: Input/output error
>> /dev/dm-0: read failed after 0 of 4096 at 4096: Input/output error
>> /dev/dm-0: read failed after 0 of 4096 at 0: Input/output error
>> PV VG Fmt Attr PSize PFree
>> /dev/dm-0 -- 0 0
>> /dev/dm-1 root lvm2 a- 277.05g 192.55g
>> /dev/dm-2 -- 0 0
>> /dev/dm-3 -- 0 0
>> /dev/dm-4 -- 0 0
>> /dev/dm-5 -- 0 0
>> /dev/ram0 -- 0 0
>> /dev/ram1 -- 0 0
>> /dev/ram10 -- 0 0
>> /dev/ram11 -- 0 0
>> /dev/ram12 -- 0 0
>> /dev/ram13 -- 0 0
>> /dev/ram14 -- 0 0
>> /dev/ram15 -- 0 0
>> /dev/ram2 -- 0 0
>> /dev/ram3 -- 0 0
>> /dev/ram4 -- 0 0
>> /dev/ram5 -- 0 0
>> /dev/ram6 -- 0 0
>> /dev/ram7 -- 0 0
>> /dev/ram8 -- 0 0
>> /dev/ram9 -- 0 0
>> /dev/root -- 0 0
>> /dev/sda1 -- 0 0
>> /dev/sda3 -- 0 0
>> /dev/sdc1 export lvm2 a- 465.76g 65.76g
>> raub@strangepork:~$
>>
>> FYI, the root vg in inside /dev/sda3, which is an encrypted partition.
>> How can I find which drive /dev/dm-0 is?
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
