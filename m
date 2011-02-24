Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p1ODjB8H014787
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 08:45:12 -0500
Received: from mail.ixserver.net (mail.ixserver.net [94.143.114.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1ODj0OE025112
	for <linux-lvm@redhat.com>; Thu, 24 Feb 2011 08:45:01 -0500
Message-ID: <4D6660D7.9000609@ixcore.com>
Date: Thu, 24 Feb 2011 14:44:55 +0100
From: =?UTF-8?B?Q8OpZHJpYyBMZW1hcmNoYW5k?= <cedric.lemarchand@ixcore.com>
MIME-Version: 1.0
References: <4D66382E.4090906@ixcore.com>
	<20110224070435.5b057008@bettercgi.com>
In-Reply-To: <20110224070435.5b057008@bettercgi.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Different PV on the same raid array
Reply-To: cedric.lemarchand@ixblue.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: Ray Morris <support@bettercgi.com>
Cc: linux-lvm@redhat.com

Le 24/02/11 14:04, Ray Morris a écrit :
>> To bypass the DOS MBR 2TB limits, i plan to use LVM to create on the
>> > same raid array some "small" PV (< 2TB)  that will be in the same big
>> > VG (> 2TB).
>> > 
>> > First, am i planning ugly thing ? is the GPT alternative a better
>> > way ?
>    If you're not booting from the array, just make the array 
> the PV.  Once you're past the BIOS boot, there's little reason
> to have partitions at all since you're using LVM to divide the 
> storage into appropriate volumes.  If you are booting from it
> and therefore need partitions, GPT is the new standard for 
> partitions.
Ok, i am booting on but on a different partition, so i'll need to use
GPT or maybe split my array in two parts, one small for OS (using MBR)
and second for DATA (without partitions, or with GPT).
>> > i would like that LVM use 1 PV first and then
>> > the second when the first come full  (not both at the same time).
>> > Maybe LVM do that by default, or do i need some option ? (i saw
>> > "--contiguous" in the lvcreate man pages, but dont know exactly what
>> > this option does ... )
>   I think it does that by default, subject to certain other contraints
> such as not putting both halves of a mirrored LV on the same PV.

Thx for this precious informations.


Cédric
