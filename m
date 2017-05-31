Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EA8F18629
	for <linux-lvm@redhat.com>; Wed, 31 May 2017 06:53:58 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 22AA8C059722
	for <linux-lvm@redhat.com>; Wed, 31 May 2017 06:53:56 +0000 (UTC)
References: <2dad6517-22f4-032d-6d7d-44641c4b871f@free.fr>
	<f099a6aefe6b25997971d1cbbed7dfeb@assyoma.it>
From: Georges Giralt <georges.giralt@free.fr>
Message-ID: <8c9d2725-d8f9-ca2c-1679-f1fdc9570373@free.fr>
Date: Wed, 31 May 2017 08:53:49 +0200
MIME-Version: 1.0
In-Reply-To: <f099a6aefe6b25997971d1cbbed7dfeb@assyoma.it>
Content-Transfer-Encoding: 8bit
Content-Language: fr
Subject: Re: [linux-lvm] Question on mixing technologies
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Gionatan Danti <g.danti@assyoma.it>, LVM general discussion and development <linux-lvm@redhat.com>

Thank you, Gionatan for your answer.

I finally had time to test the first solution, having the root FS on the 
M.2 card and everything else (including /var and /tmp) on the mechanical 
drives.

The responsiveness of the machine is awesome and, for now, without any 
glitch or problem. So I may retain this solution.

The only remaining question is how to trim the device as it is not 
"mounted". Is there a special pvcreate or LVM option to have this device 
trimmed when it should be ?

Have a nicce day !


Le 13/05/2017 � 14:16, Gionatan Danti a �crit :
> You basically have two possibilities:
>
> 1) move the root fs on the M.2 disk, which will give you much higher 
> system responsiveness compared to the mechanical disks; however, any 
> data/application installed on the HDD will be slow as always;
>
> 2) configure lvmcache [1] for using the M.2 disk as a read-only 
> (writethrough) caching device for the mechanical disks, which will 
> give you somewhat lesser system responsiveness but *any* 
> cache-friendly application will be accelerated from the M.2 disk.
>
> [1] http://man7.org/linux/man-pages/man7/lvmcache.7.html
>
> Regards.
>
> Il 12-05-2017 18:21 Georges Giralt ha scritto:
>> Hello guys,
>>
>> I've an Ubuntu machine with two SATA mechanical drives on software 
>> raid 1.
>>
>> This md is the sole PV of the LVM installation.
>>
>> As the mainboard has been changed recently, it has an M.2 plug. And
>> I'm been offered a 128 GB M.2 NGFF card.
>>
>> So far so good.
>>
>> Question : Will I gain something adding the M.2 card as a second PV on
>> my LVM setup and moving the system LV to it ?
>>
>> What are your experience on the subject ?
>>
>> Many thanks in advance for your advice !
>

-- 
"If a man empties his purse into his head, no man can take it away from him.
An investment in knowledge always pays the best interest"


Benjamin Franklin.
