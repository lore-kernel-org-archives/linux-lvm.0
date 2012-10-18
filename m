Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q9IAgVpp014543
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2012 06:42:31 -0400
Received: from awh1.active.ee (alfa.active.ee [194.204.30.36])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q9IAgTkq028795
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2012 06:42:30 -0400
Mime-Version: 1.0 (Apple Message framework v1278)
From: Andres Toomsalu <andres@active.ee>
In-Reply-To: <507FDA2E.8080301@redhat.com>
Date: Thu, 18 Oct 2012 13:42:27 +0300
Message-Id: <CC9722DE-C18E-4CC7-A442-9256CCD46E2A@active.ee>
References: <CB12DB70-5C4F-4936-9EDE-BFF4096D064F@active.ee>
	<507FDA2E.8080301@redhat.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] how to recover after thin pool metadata did fill up?
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

Yes I know that its not currently possible to recover this pool anymore - and we got data copied from read-only mode anyway - but bigger problem is that there is even no known way to reset/recreate pool - as I cant delete/remove the pool - which means that only erasing all PV will help probably. Im just looking for a way to erase faulty pool (with erasing data) and to be able recreate it without full OS reinstall. Is there a way to do it - DM mapper low level commands perhaps?

Cheers,
-- 
----------------------------------------------
Andres Toomsalu, andres@active.ee






On 18.10.2012, at 13:30, Zdenek Kabelac wrote:

> Dne 17.10.2012 22:21, Andres Toomsalu napsal(a):
>> Hi,
>> 
>> I'm aware that thin provisioning is not yet production ready (no metadata resize) - but is there a way to recover from thin pool failure when pool metadata was filled up?
>> 
>> I did setup 1.95T thin pool and after some usage pool metadata (128MB) was filling up to 99,08% - so all pool thin volumes went into read-only state.
>> Problem is that I cannot find a way in order to recover from this failure - eg also unable to delete/erase thin volumes and pool - only option seems to be full disk PV re-creation (eg OS re-install).
>> 
>> Is there a way to recover or delete thin pool/volumes - without erasing other (normal) LVs in this Volume Group?
>> For example dmsetup remove didn't help.
>> 
>> Some diagnostic output:
>> 
>> lvs -a -o+metadata_percent
>>   dm_report_object: report function failed for field data_percent
>>   --- REPEATABLE MSG ---
>>   dm_report_object: report function failed for field data_percent
>>   LV                       VG         Attr     LSize   Pool Origin       Data%  Move Log Copy%  Convert Meta%
>>   pool                     VolGroupL0 twi-i-tz   1,95t                    75,28                          99,08
>>   [pool_tdata]             VolGroupL0 Twi-aot-   1,95t
>>   [pool_tmeta]             VolGroupL0 ewi-aot- 128,00m
>>   root                     VolGroupL0 -wi-ao--  10,00g
>>   swap                     VolGroupL0 -wi-ao--  16,00g
>>   thin_backup              VolGroupL0 Vwi-i-tz 700,00g pool
>>   thin_storage             VolGroupL0 Vwi---tz 900,00g pool
>>   thin_storage-snapshot1   VolGroupL0 Vwi-i-tz 700,00g pool thin_storage
>>   thin_storage-snapshot106 VolGroupL0 Vwi-i-tz 900,00g pool thin_storage
>>   thin_storage-snapshot130 VolGroupL0 Vwi-i-tz 900,00g pool thin_storage
>>   thin_storage-snapshot154 VolGroupL0 Vwi-i-tz 900,00g pool thin_storage
>>   thin_storage-snapshot178 VolGroupL0 Vwi-i-tz 900,00g pool thin_storage
>>   thin_storage-snapshot2   VolGroupL0 Vwi-i-tz 700,00g pool thin_storage
>>   thin_storage-snapshot202 VolGroupL0 Vwi-i-tz 900,00g pool thin_storage
>> 
>> dmsetup table
>> VolGroupL0-thin_storage--snapshot2:
>> VolGroupL0-thin_storage--snapshot178:
>> VolGroupL0-swap: 0 33554432 linear 8:2 41945088
>> VolGroupL0-thin_storage--snapshot1:
>> VolGroupL0-root: 0 20971520 linear 8:2 20973568
>> VolGroupL0-thin_storage--snapshot130:
>> VolGroupL0-pool:
>> VolGroupL0-thin_backup:
>> VolGroupL0-thin_storage--snapshot106:
>> VolGroupL0-thin_storage--snapshot154:
>> VolGroupL0-pool-tpool: 0 4194304000 thin-pool 253:2 253:3 1024 0 0
>> VolGroupL0-pool_tdata: 0 2097152000 linear 8:2 75499520
>> VolGroupL0-pool_tdata: 2097152000 2097152000 linear 8:2 2172913664
>> VolGroupL0-pool_tmeta: 0 262144 linear 8:2 2172651520
>> VolGroupL0-thin_storage--snapshot202:
>> 
>> lvremove -f VolGroupL0/pool
>>   Thin pool transaction_id=640, while expected: 643.
>>   Unable to deactivate open VolGroupL0-pool_tdata (253:3)
>>   Unable to deactivate open VolGroupL0-pool_tmeta (253:2)
>>   Failed to deactivate VolGroupL0-pool-tpool
>>   Failed to resume pool.
>>   Failed to update thin pool pool.
>> 
> 
> 
> Unfortunately there is no 'easy' advice for now yet - you hit current Achilles heel of thinp support in lvm2 - we are thinking how to make recovery usable for user - but it's not easy task since many things are making it very complex - so it still needs some month of work.
> 
> As for now - you would need to download git source and disable certain security check directly in the source to allow activation of damaged pool.
> 
> I guess I could provide you some extra patch that would allow you to active thin pool in 'read-only' mode (but it's not yet ready for upstream).
> 
> Thus you should be able access 'some' data in this mode with a big note - since devices would be in read-only mode - you cannot even run  fsck on such partition - and since you have transaction_id mismatch - it would need
> some analysis to see what actually happened - are you able to provide me
> archive files for the history of your recent lvm commands -
> it should not allow you to have difference bigger then 1 - so there is probably some bug (unless you are using some old version of lvm2 with initial thinp support)
> 
> Zdenek
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
