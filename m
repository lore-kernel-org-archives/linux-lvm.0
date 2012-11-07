Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qA7M32ZP014394
	for <linux-lvm@redhat.com>; Wed, 7 Nov 2012 17:03:02 -0500
Received: from awh1.active.ee (alfa.active.ee [194.204.30.36])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qA7M2wPD030750
	for <linux-lvm@redhat.com>; Wed, 7 Nov 2012 17:02:59 -0500
Mime-Version: 1.0 (Apple Message framework v1283)
From: Andres Toomsalu <andres@active.ee>
In-Reply-To: <5093A260.8000906@redhat.com>
Date: Thu, 8 Nov 2012 00:03:01 +0200
Message-Id: <5338D4BE-3CC4-4ED1-A8A8-9E08FC342EF2@active.ee>
References: <73698D91-B8D4-4F52-ABF3-54542ACB0690@active.ee>
	<5093A260.8000906@redhat.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] strange usage stats for thin LV
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks a lot for a detailed explanation - now everything fits into places :)

Some answers:

1) Filesystem in use is ext4 at all cases
2) Im not using discard option as Im not very aware how to use it  - is it a filesystem mount option for fstab?
3) OS is CentOS 6.3 with RHEL OpenVZ patched kernel (2.6.32-042stab061.2 #1 SMP Fri Aug 24 09:07:21 MSK 2012 x86_64 x86_64 x86_64 GNU/Linux)

Kind regards,
-- 
----------------------------------------------
Andres Toomsalu





On 02.11.2012, at 12:37, Zdenek Kabelac wrote:

> Dne 31.10.2012 01:04, Andres Toomsalu napsal(a):
>> Hi,
>> 
>> I'm a bit puzzled with some thin LV usage stats - hope that someone can shed a light on this.
>> lvs shows that thin_backup LV is 94% used - but df  shows only 16% - where comes the difference?
>> 
>> lvs -a -o+metadata_percent
>>  LV                       VG         Attr     LSize   Pool Origin       Data%  Move Log Copy%  Convert Meta%
>>  pool                     VolGroupL0 twi-a-tz   1,95t                    35,17                           2,79
>>  [pool_tdata]             VolGroupL0 Twi-aot-   1,95t
>>  [pool_tmeta]             VolGroupL0 ewi-aot-  14,00g
>>  root                     VolGroupL0 -wi-ao--  10,00g
>>  swap                     VolGroupL0 -wi-ao--  16,00g
>>  thin_backup              VolGroupL0 Vwi-aotz 600,00g pool               94,51
>>  thin_storage             VolGroupL0 Vwi-aotz 600,00g pool               20,98
>> 
>> 
>> df -h
>> Filesystem            Size  Used Avail Use% Mounted on
>> /dev/mapper/VolGroupL0-root
>>                      9,9G  1,3G  8,1G  14% /
>> tmpfs                  16G     0   16G   0% /dev/shm
>> /dev/sda1            1008M  122M  835M  13% /boot
>> /dev/mapper/VolGroupL0-thin_storage
>>                      591G   39G  523G   7% /storage
>> /dev/mapper/VolGroupL0-thin_backup
>>                      591G   90G  472G  16% /backup
>> 
>> Thanks in advance,
>> 
> 
> 
> As Stuart posted values are not related closely together.
> But there are few things which are visible:
> 
> ~35% tells you the number of used space in the pool - around ~700GB
> ~3% metadata takes - ~400MB
> 
> thin_backup has provisioned ~95%   ->  ~570GB
> thin_storage                ~21%   ->  ~130GB
> 
> which seem to match approximately number of used blocks from the pool
> (~570 + ~130 = ~700)
> 
> ===
> 
> Now to interpret your 'df' stats:
> 
> thin_storage uses 39GB  stored in provisioned 130GB
> thin_backup  uses 90GB  stored in provisioned 570GB
> 
> and there could be multi reasons for this:
> 
> - usage of large chunksize - and filesystem spreads a lot of data though the device - either for it's internal maintenance, or  a lot of files are located
> across whole provisioned space.
> - You have delete lots of files - and have not used discard for deleted areas
> (i.e. for ext4 there is  'fstrim' command which will discard them)
> 
> 
> So here you need to provide more information which filesystem is in use,
> and what was the overall usage for your devices. And also are you using discard support or not ?
> What is the kernel version in use?
> (It's always worth to use latest version of lvm2 -  since there was improved
> discard support configurability.
> 
> Zdenek
> 
> 
> 
> 
