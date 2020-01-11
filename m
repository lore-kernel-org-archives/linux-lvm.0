Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 670F52026D67
	for <linux-lvm@redhat.com>; Sat, 11 Jan 2020 22:07:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 712AC803012
	for <linux-lvm@redhat.com>; Sat, 11 Jan 2020 22:07:09 +0000 (UTC)
Received: from postpony.nebelschwaden.de (v22018114346177759.hotsrv.de
	[194.55.14.20]) (Authenticated sender: postmaster@nebelschwaden.de)
	by mail.worldserver.net (Postfix) with ESMTPA id AB0F2300215
	for <linux-lvm@redhat.com>; Sat, 11 Jan 2020 23:07:05 +0100 (CET)
Received: from [172.16.37.5] (kaperfahrt.nebelschwaden.de [172.16.37.5])
	by postpony.nebelschwaden.de (Postfix) with ESMTP id 63DAAD237C
	for <linux-lvm@redhat.com>; Sat, 11 Jan 2020 23:07:05 +0100 (CET)
References: <8788b5db-6667-6060-e66a-beab7d3a56fc@nebelschwaden.de>
	<080c04ff-e9cc-8a9e-da66-2c125a657d86@nebelschwaden.de>
From: Ede Wolf <listac@nebelschwaden.de>
Message-ID: <28fac0e3-5853-76e2-5f9f-c4ae7b35c4a8@nebelschwaden.de>
Date: Sat, 11 Jan 2020 23:07:05 +0100
MIME-Version: 1.0
In-Reply-To: <080c04ff-e9cc-8a9e-da66-2c125a657d86@nebelschwaden.de>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] metadata device too small
Reply-To: listac@nebelschwaden.de,
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

Forgot to add the journal output, though I do not think this raises chances:

kernel: device-mapper: table: 253:8: thin: Couldn't open thin internal 
device
kernel: device-mapper: ioctl: error adding target to table



Am 11.01.20 um 23:00 schrieb Ede Wolf:
> So I reverted (swapped) to the _meta0 backup, that had been created by 
> --repair, that brought me back to the transaction error, then I did a 
> vgcfgbackup and changed the transaction id to what lvm was expecting and 
> restored it, and,  wohoo, the thinpool can be activated again.
> 
> However, when trying to activate an actual volume within that thinpool:
> 
> # lvchange -ay VG_Raid6/data
>    device-mapper: reload ioctl on  (253:8) failed: No data available
> 
> And that message holds true for all lv of that thinpool.
> 
> 
> Am 11.01.20 um 18:57 schrieb Ede Wolf:
>> After having swapped a 2,2T thinpool metadata device for a 16GB one, 
>> I've run into a transaction id mismatch. So run lconvert --repair on 
>> the thinvolume - in fact, I've had to run the repair twice, as the 
>> transaction id error persisted after the first run.
>>
>> Now ever since I cannot activate the thinpool any more:
>>
>> [root]# lvchange -ay VG_Raid6/ThinPoolRaid6
>>    WARNING: Not using lvmetad because a repair command was run.
>>    Activation of logical volume VG_Raid6/ThinPoolRaid6 is prohibited 
>> while logical volume VG_Raid6/ThinPoolRaid6_tmeta is active.
>>
>> So disable them and try again:
>>
>> [root]# lvchange -an VG_Raid6/ThinPoolRaid6_tdata
>>    WARNING: Not using lvmetad because a repair command was run.
>>
>> [root]# lvchange -an VG_Raid6/ThinPoolRaid6_tmeta
>>    WARNING: Not using lvmetad because a repair command was run.
>>
>> [root]# lvchange -ay VG_Raid6/ThinPoolRaid6
>>    WARNING: Not using lvmetad because a repair command was run.
>>    device-mapper: resume ioctl on  (253:3) failed: Invalid argument
>>    Unable to resume VG_Raid6-ThinPoolRaid6-tpool (253:3).
>>
>> And from the journal:
>>
>> kernel: device-mapper: thin: 253:3: metadata device (4145152 blocks) 
>> too small: expected 4161600
>> kernel: device-mapper: table: 253:3: thin-pool: preresume failed, 
>> error = -22
>>
>>
>> Despite not using ubuntu, I may have been bitten by this bug(?), as my 
>> new metadata partion happens to be 16GB:
>>
>> "If pool meta is 16GB , lvconvert --repair will destroy logical volumes."
>>
>> https://bugs.launchpad.net/ubuntu/+source/lvm2/+bug/1625201
>>
>> Is there any way to make the data accessible again?
>>
>> lvm2 2.02.186
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
