Received: from [10.34.131.19] (dhcp131-19.brq.redhat.com [10.34.131.19])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s3E82sGm021237
	for <linux-lvm@redhat.com>; Mon, 14 Apr 2014 04:02:55 -0400
Message-ID: <534B962D.4020701@redhat.com>
Date: Mon, 14 Apr 2014 10:02:53 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CACOqYcnRf_7NGKVObo-uQb0Dvzbmd+ntkZ_PPGe4QmRrgTx_SQ@mail.gmail.com>	<5301CFAA.5050206@redhat.com>
	<CACOqYcnGHJyZCyXRrMiB0v+Ea6qT6nSRvdoovEcgWobGBw+6og@mail.gmail.com>
	<534B95BC.1050607@redhat.com>
In-Reply-To: <534B95BC.1050607@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Converting existing thick LVs into thin LVs
	possible?
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

Dne 14.4.2014 10:01, Zdenek Kabelac napsal(a):
> Dne 4.4.2014 18:50, Jeremy Smith napsal(a):
>> On Mon, Feb 17, 2014 at 4:00 AM, Zdenek Kabelac <zkabelac@redhat.com> wrote:
>>> Dne 14.2.2014 20:21, Jeremy Smith napsal(a):
>>>>
>>>> I have a system currently using LVM2 that was originally set up on
>>>> RHEL5 (where thin provisioning was not supported).
>>>> This system would greatly benefit from the newer thin provisioning
>>>> features, and so I am investigating upgrading to RHEL6 so that I may
>>>> take advantage. My question is this: Can I convert existing LVM2
>>>> "thick" logical volumes into thinly-provisioned volumes on the fly?
>>>>
>>>> This page:
>>>>
>>>> https://access.redhat.com/site/documentation/en-US/Red_Hat_Enterprise_Linux/6/html/Logical_Volume_Manager_Administration/thinly_provisioned_volume_creation.html
>>>>
>>>>
>>>> lead me to believe that it is possible:
>>>>    "You can use the --thinpool parameter of the lvconvert command to
>>>> convert an existing logical volume to a thin volume."
>>>>
>>>> with the following:
>>>>
>>>>    lvconvert --thinpool vg001/lv1 --poolmetadata vg001/lv2
>>>
>>>
>>>
>>> Sounds like misunderstanding which needs fix/enhancement of this doc page  -
>>> we will need to enhance lvconvert command to write big warning about this
>>> operation.
>>>
>>> This conversion is converting  volume to 'data' volume - but it's not about
>>> preserving content of LV1 as  LV1 - it will serve as en empty pool.
>>>
>>> The primary purpose is - you can build 'any' type of LV for data volume
>>> and 'any' type of LV for metadata volume (i.e. special layout for
>>> raid/mirror)
>>> and then you 'create' for these 2 volumes your thin pool - since normally
>>> you can't create mirrored data & metadata volumes and thin pool in 1
>>> command,
>>> and you can't easily select where the metadata should be placed
>>> (i.e. data on spindle, metadata on SSD).
>>>
>>>>
>>>> Am I doing something wrong here?
>>>> Or am I going to have to create a new thin pool, new thin logical
>>>> volumes, and copy the data over?
>>>
>>>
>>> There is not yet support for direct conversion of LV to thin-LV.
>>> The only currently supported method is to use your  thick-LV as an external
>>> origin LV for your  thin-LV volume.
>>>
>>> i.e. you create your  thin-pool  LV  + and then thin-LV volume with external
>>> origin that will use original thick-LV  (external origin need to be
>>> read-only volume)
>>>
>>> Here are the conversion steps:
>>>
>>> lvcreate -Lsize_of_data_pool -T vg/pool
>>> lvconvert -T  vg/thick_LV --originname new_thick_LV_name --thinpool  vg/pool
>>>
>>> Disadvantage here is you cannot merge changes from thin volume back to
>>> original thick volume. You can however remove  thin-LV and use again your
>>> thick-LV as normal volume - i.e. thin-LV is basically snapshot.
>>>
>>> Now hint for recovery - if you have not yet written anything to thin-LV from
>>> newly create thin-pool.  You could restore back to your previous
>>> configuration
>>> via   vgcfgrestore --force.
>>>
>>> Zdenek
>>>
>>
>> Zdenek,
>>
>> Thank you. I was able to perform migration of some of my LVs, but now
>> I have ran into a problem: the thin pool metadata has ran out of space
>> :-(
>> I am running LVM 2.02.98(2) (2012-10-15) on kernel 3.11.0-18-generic
>> (Ubuntu server 13.10), which -- as I understand from your talk at
>> https://www.youtube.com/watch?v=dGax09aw7WI -- does not support live
>> resizing of the pool metadata.
>> You mention in that talk that there is a manual offline pool metadata
>> resize method that can be done on kernels prior to 3.14. I was not
>> able to find details anywhere on how to accomplish this. Could you
>> point me in the right direction on how to fix a thin pool (and its
>> thin logical volumes) that has reached the metadata size limit? It
>> would be greatly appreciated.
>
> Offline resize is basically  metadata recovery into bigger LV.
> So step for resize apply in the same way as for recovery.
>
> 1. create temp LV
> 2. replace temp LV with  metadata pool LV
> 3. now you can activate your metadata LV as regular LV
> 4. create bigger LV for restore
> 5. thin_restore  -i old_metadata_lv_path  -o  new_metadata_lv_path

oops hit send button to early...
of course thin_repair


> 6. swap new_metadata_lv  into your pool
> 7. activate pool
>
> yep - about the time to integrate this offline resize into lvm2 I guess... :)
>
> Zdenek
>
