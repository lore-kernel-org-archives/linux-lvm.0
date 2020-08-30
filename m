References: <83DAD1FF-6CE0-4725-A24D-2AE529433AEE@gmail.com>
	<8f19f639-107d-610d-0083-596d0c21a081@redhat.com>
	<29c466317b90d36bff995b3f3d0f4cf2@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <bf377813-8600-865a-71b7-dd6873113f46@redhat.com>
Date: Sun, 30 Aug 2020 21:30:25 +0200
MIME-Version: 1.0
In-Reply-To: <29c466317b90d36bff995b3f3d0f4cf2@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvm limitations
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>
Cc: =?UTF-8?Q?Tomas_Dalebj=c3=b6rk?= <tomas.dalebjork@gmail.com>

Dne 30. 08. 20 v 20:01 Gionatan Danti napsal(a):
> Il 2020-08-30 19:33 Zdenek Kabelac ha scritto:
>> For illustration� for 12.000 LVs you need ~4MiB just store Ascii
>> metadata itself, and you need metadata space for keeping at least 2 of
>> them.
> 
> Hi Zdenek, are you speaking of classical LVM metadata, right?

Hi

Lvm2 has only ascii metadata (so basically what is stored in
/etc/lvm/archive is the same as in PV header metadata area -
just without spaces and some comments)

And while this is great for manual recovery, it's not
very efficient in storing larger number of LVs - there basically
some sort of DB attemp would likely be needed.

So far however there was no real worthy use case - so safety
for recovery scenarios wins ATM.

>> Handling of operations like� 'vgremove' with so many LVs requires
>> signification amount of your CPU time.
>>
>> Basically to stay within bounds - unless you have very good reasons
>> you should probably stay in range of low thousands to keep lvm2 performing
>> reasonably well.
> 
> What about thin vols? Can you suggest any practical limit with lvmthin?

Thin - just like any other LV takes some 'space' - so if you want
to go with higher amount - you need to specify bigger metadata areas
to be able to store such large lvm2 metadata.

There is probably not a big issue with lots of thin LVs in thin-pool as long
as user doesn't need to have them active at the same time. Due to a nature of
kernel metadata handling, the larger amount of active thin LVs from the same 
thin-pool v1 may start to compete for the locking when allocating thin pool 
chunks thus killing performance - so here is rather better to stay in some 
'tens' of actively provisioning thin volumes when the 'performance' is factor.

Worth to note there is fixed strict limit of the ~16GiB maximum thin-pool 
kernel metadata size - which surely can be exhausted - mapping holds info 
about bTree mappings and sharing chunks between devices....

Zdenek
