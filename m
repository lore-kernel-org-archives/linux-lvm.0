References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
From: =?UTF-8?Q?Dalebj=c3=b6rk=2c_Tomas?= <tomas.dalebjork@gmail.com>
Message-ID: <def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
Date: Tue, 22 Oct 2019 17:29:24 +0200
MIME-Version: 1.0
In-Reply-To: <909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
Content-Transfer-Encoding: 8bit
Content-Language: sv
Subject: Re: [linux-lvm] exposing snapshot block device
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
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

Thanks for feedback,


I know that thick LV snapshots are out dated, and that one should use 
thin LV snapshots.

But my understanding is that the dm- cow and dm - origin are still 
present and available in thin too?


Example of a scenario:

1. Create a snapshot of LV testlv with the name snaplv
2. Perform a full copy of the snaplv using for example dd to a block device
3. Delete the snapshot

Now I would like to re-attach this external block device as a snapshot 
again.

After all, it is just a dm and LVM config, right? So for example:

1. create a snapshot of testlv with the name snaplv
2. re create the -cow meta data device : 
<offset><chunk_size><data>...<offset><chunk_size><data><EOF>
 ��� Recreate this -cow meta data device by telling the origin that all 
data has been changed and are in the cow device (the raw device)
3. If the above were possible to perform, than it could be possible to 
instantly get at copy of the LV data using the lvconvert --merge command

I have already invented a way to perform "block level incremental 
forever"; using the -cow device.

And a possibility to reverse the blocks, to copy back only changed 
content from external devices.

But, it would be better if the cow device could be recreated in a faster 
way, mentioning that all blocks are present on an external device, so 
that the LV volume can be restored much quicker using "lvconvert 
--merge" command.

That would be super cool!

Imagine backing up multi terrabyte sized volumes in minutes to external 
destinations, and restoring the data in seconds using instant recovery 
by re-creating or emulating the cow device, and associating all blocks 
to an external device?

Regards Tomas


Den 2019-10-22 kl. 15:57, skrev Zdenek Kabelac:

> Dne 22. 10. 19 v 12:47 Dalebj�rk, Tomas napsal(a):
>> Hi
>>
>> When you create a snapshot of a logical volume.
>>
>> A new virtual dm- device will be created with the content of the 
>> changes from the origin.
>>
>> This cow device can than be used to read changed contents etc.
>>
>>
>> In case of an incident, this cow device can be used to read back the 
>> changed content to its origin using the "lvmerge" command.
>>
>>
>> The question I have is if there is a way to couple an external cow 
>> device to an empty equaly sized logical volume,
>>
>> so that the empty logical volume is aware of that all changed content 
>> are placed on this attached cow device?
>>
>> If that is possible, than it will help making instant recovery of LV 
>> volumes from an external source using native lvmerge command, from 
>> for example a backup server.
>
> For most info how old snapshot for so called 'thick' LVs works - check
> these papers: http://people.redhat.com/agk/talks/
>
>
> lvconvert --merge
>
> is in fact 'instant' operation - when it happens - you can immediately 
> access
> 'already merged' content� while the merge is happening in the background
> (you can look for copies percentage in lvs command)
>
>
> However 'thick' LVs with old snapshots are rather 'dated' technology
> you should probably checkout the usage of� thinly provisioned LVs.
>
> Regards
>
> Zdenek
>
>
