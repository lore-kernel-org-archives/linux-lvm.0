Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4OJfsXf000561
	for <linux-lvm@redhat.com>; Wed, 24 May 2006 15:41:54 -0400
Received: from amsfep15-int.chello.nl (amsfep17-int.chello.nl [213.46.243.15])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4OJfkGl026861
	for <linux-lvm@redhat.com>; Wed, 24 May 2006 15:41:47 -0400
Message-ID: <4474B6E8.9010106@neuroweave.nl>
Date: Wed, 24 May 2006 21:41:28 +0200
From: Joep Blom <jlblom@neuroweave.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] booting from an LV
References: <4472E235.6020707@neuroweave.nl>	<20060523105821.GA6491@percy.comedia.it>	<4472EE4E.9050208@neuroweave.nl>
	<4473ED42.1060702@wanadoo.fr>
In-Reply-To: <4473ED42.1060702@wanadoo.fr>
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
To: francis.souyri@wanadoo.fr, LVM general discussion and development <linux-lvm@redhat.com>

Francis SOUYRI wrote:

> If you need to boot from a logical partition you can use lilo.
>
> Best regards.
>
> Francis
>
> Joep Blom wrote:
>
>> Luca Berra wrote:
>>
>>> On Tue, May 23, 2006 at 12:21:41PM +0200, Joep Blom wrote:
>>>
>>>> I have one question.
>>>> Is it possible with grub to use a logical volume as boot partition?
>>>> (e.g.:partition: /dev/VG01/lvol0.
>>>
>>>
>>>
>>> No.
>>>
>>> L.
>>>
>> Thanks
>> Joep
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
>
Francis,
Thanks. I've read that. But after 7 or 8 years using LILO with all the 
problems around it, I switched 2 years ago to grub and decided to stick 
to it. So my solution is to make a small (100 Mb) primary partition for 
grub and do the rest with LVM as I have discovered the ease and 
advantage of it after years of struggling with fdisk (DOS, W98, Linux) 
and with the ntfsprogs suite it's easy to create XP partitions in an LV 
for backups.
Joep
