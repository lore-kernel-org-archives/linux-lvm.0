Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 159F67767E
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2017 10:58:14 +0000 (UTC)
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 831A4C0587CA
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2017 10:58:13 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id b189so8632355wmd.4
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2017 03:58:13 -0700 (PDT)
References: <f30cd99b-2ea1-2766-a8c9-fd61c2f2e41c@member.fsf.org>
	<23016.63588.505141.142275@quad.stoffel.home>
	<beac3436-06a8-9365-4934-9db1a1f9ed34@member.fsf.org>
	<23018.20452.919839.109594@quad.stoffel.home>
	<88f3c8a9-8c55-a74f-c9cb-4b8aa18a28fc@member.fsf.org>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <8bacff07-dd78-ef2d-6294-048ef8e92b06@gmail.com>
Date: Mon, 23 Oct 2017 12:58:09 +0200
MIME-Version: 1.0
In-Reply-To: <88f3c8a9-8c55-a74f-c9cb-4b8aa18a28fc@member.fsf.org>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] cache on SSD makes system unresponsive
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Oleg Cherkasov <o1e9@member.fsf.org>, John Stoffel <john@stoffel.org>

Dne 21.10.2017 v 16:33 Oleg Cherkasov napsal(a):
> On 20. okt. 2017 21:35, John Stoffel wrote:
>>>>>>> "Oleg" == Oleg Cherkasov <o1e9@member.fsf.org> writes:
>>
>> Oleg> On 19. okt. 2017 21:09, John Stoffel wrote:
>>>>
>>
>> Oleg> RAM 12Gb, swap around 12Gb as well.� /dev/sda is a hardware RAID1, the
>> Oleg> rest are RAID5.
>>
>> Interesting, it's all hardware RAID devices from what I can see.
> 
> It is exactly what I wrote initially in my first message!
> 
>>
>> Can you should the *exact* commands you used to make the cache?� Are
>> you using lvcache, or bcache?� they're two totally different beasts.
>> I looked into bcache in the past, but since you can't remove it from
>> an LV, I decided not to use it.� I use lvcache like this:
> 
> I have used lvcache of course and here are commands from bash history:
> 
> lvcreate -L 1G -n primary_backup_lv_cache_meta primary_backup_vg /dev/sda5
> 
> ### Allocate ~247G ib /dev/sda5 what has left of VG
> lvcreate -l 100%FREE -n primary_backup_lv_cache primary_backup_vg /dev/sda5
> 
> lvconvert --type cache-pool --cachemode writethrough --poolmetadata 
> primary_backup_vg/primary_backup_lv_cache_meta 
> primary_backup_vg/primary_backup_lv_cache
> 
> lvconvert --type cache --cachepool primary_backup_vg/primary_backup_lv_cache 
> primary_backup_vg/primary_backup_lv
> 
> ### lvconvert failed because required some extra extends in VG so I had to 
> reduce cache LV and try again:
> 
> lvreduce -L 200M primary_backup_vg/primary_backup_lv_cache
> 


Hi

Without plans to interrupt thoughts on topic here - the explanation here is 
very simple.

Cache pool is made from 'data' & 'metadata' LV - so both needs some space.
In the case of 'cache pool' it's pretty good plan to have both device is fast 
spindle (SSD).

So can you please provide output of:

lvs -a -o+devices

so it could be easily validated both _cdata & _cmeta LV is hosted by some SSD 
device (it's not shown anywhere in the thread - so just to be sure we have 
them on right disks)

Regards

Zdenek
