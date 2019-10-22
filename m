References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
	<def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
	<f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
From: =?UTF-8?Q?Dalebj=c3=b6rk=2c_Tomas?= <tomas.dalebjork@gmail.com>
Message-ID: <83c4026c-5abe-e9e5-ac1d-6ed9e025e660@gmail.com>
Date: Tue, 22 Oct 2019 18:13:25 +0200
MIME-Version: 1.0
In-Reply-To: <f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
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

That is cool,

But, are there any practical example how this could be working in reality.

Eg:

lvcreate -s mysnap vg/testlv

thin_dump vg/mysnap > deltafile # I assume that this should be the name 
of the snapshot?

But... How to recreate only the metadata only?, so that the meta data 
changes are associated to an external device?

thin_restore -i metadata < deltafile # that will restore the metadata, 
but I also want the restored meta data to point out the location of the 
data from for example a file or a raw deice


I have created a way to perform block level incremental forever by 
reading the -cow device, and thin_dump would be nice replacement for that.

This can also be reversed, so that the thin_restore can be used to 
restore the meta data and the data@same time (If I now the format of it)

But it would be much more better if one can do the restoration in 
background using "lvconvert --merge" tool, by first restoring the 
metadata (I can understand that this part is needed), and assoicate all 
the data to an external raw disk or much more better a file, so that all 
changes associated to this restored snapshot can be found on the file.


Not so good to explain this, but I hope you understand how I am thinking.

A destroyed thin pool, can than be restored instantly using a backup 
server as the cow similar device.

Regards Tomas

Den 2019-10-22 kl. 17:36, skrev Zdenek Kabelac:
> Dne 22. 10. 19 v 17:29 Dalebj�rk, Tomas napsal(a):
>> Thanks for feedback,
>>
>> But, it would be better if the cow device could be recreated in a 
>> faster way, mentioning that all blocks are present on an external 
>> device, so that the LV volume can be restored much quicker using 
>> "lvconvert --merge" command.
>>
>> That would be super cool!
>>
>> Imagine backing up multi terrabyte sized volumes in minutes to 
>> external destinations, and restoring the data in seconds using 
>> instant recovery by re-creating or emulating the cow device, and 
>> associating all blocks to an external device?
>>
>
> Hi
>
> I do not want to break your imagination here, but that is exactly the 
> thing you can do with thin provisioning and thin_delta tool.
>
> You just work with LV, take snapshot1, take snapshot2,
> send delta between� s1 -> s2� to remove machine,
> remove s1, take s3, send delta� s2 -> s3...
>
> It's just not automated by lvm2 ATM...
>
> Using this with old snapshot would be insanely inefficient...
>
> Regards
>
> Zdenek
>
