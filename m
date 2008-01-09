Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m09EpihE004408
	for <linux-lvm@redhat.com>; Wed, 9 Jan 2008 09:51:44 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m09EpBM4001332
	for <linux-lvm@redhat.com>; Wed, 9 Jan 2008 09:51:11 -0500
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id 6F1304657A
	for <linux-lvm@redhat.com>; Wed,  9 Jan 2008 15:51:08 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id D438B9383
	for <linux-lvm@redhat.com>; Wed,  9 Jan 2008 15:51:04 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id TLstxIVSRVdt for <linux-lvm@redhat.com>;
	Wed,  9 Jan 2008 15:51:04 +0100 (CET)
Received: from [192.168.10.145] (xdsl-87-79-218-67.netcologne.de
	[87.79.218.67]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Wed,  9 Jan 2008 15:51:03 +0100 (CET)
Message-ID: <4784DF56.6090903@wpkg.org>
Date: Wed, 09 Jan 2008 15:51:02 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] fdisk and lvs size differences
References: <4784CDCC.6000809@wpkg.org> <4784CF70.3000307@redhat.com>
In-Reply-To: <4784CF70.3000307@redhat.com>
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

Bryn M. Reeves schrieb:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Tomasz Chmielewski wrote:
>> Let's say I have a 500GB logical volume:
>>
>> # lvs | grep san2_data
>>   san2_data                  san1 -wi-a- 500.00G
>>
>>
>> fdisk will report a bigger number:
>>
>> # fdisk -l /dev/san1/san2_data
>>
>> Disk /dev/san1/san2_data: 536.8 GB, 536870912000 bytes
> 
> It's just units; the G in lvm's output signifies powers-of-two units,
> wheras the GB reported by fdisk is in powers-of-ten (SI units).
> 
> See the lvm man pages for a description of the units supported (lower
> case are SI, upper case are powers-of-two).

What lvm manual exactly? I didn't find anything about upper/lower case 
units supported in "man lvcreate" or "man lvm". In fact, it didn't make 
a difference here whether I used "g" or "G".

Of course, I could calculate it manually, but I'd rather have it done 
automatically.


# lvcreate -L500g -n san2_data san1
   Logical volume "san2_data" created

# fdisk -l /dev/san1/san2_data

Disk /dev/san1/san2_data: 536.8 GB, 536870912000 bytes


# lvcreate -L500G -n san2_data san1
   Logical volume "san2_data" created

# fdisk -l /dev/san1/san2_data

Disk /dev/san1/san2_data: 536.8 GB, 536870912000 bytes


# lvm version
   LVM version:     2.02.07 (2006-07-17)
   Library version: 1.02.08 (2006-07-17)
   Driver version:  4.11.0

This is on Debian Etch.



-- 
Tomasz Chmielewski
http://wpkg.org
