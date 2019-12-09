References: <D2CA32A7-3D9D-4490-9B42-89DC00E163FE@gmail.com>
	<8B290F6D-9D0B-4186-9F17-AAAB0BFA8DDA@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <9ce05dc0-25f9-cf62-3d7d-3911a7df90ea@redhat.com>
Date: Mon, 9 Dec 2019 14:36:26 +0100
MIME-Version: 1.0
In-Reply-To: <8B290F6D-9D0B-4186-9F17-AAAB0BFA8DDA@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Thin pool vg1-thinpool1-tpool (253:3)
 transaction_id is 549, while expected 505.
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
To: LVM general discussion and development <linux-lvm@redhat.com>, =?UTF-8?Q?=c5=81ukasz_Czerpak?= <lukasz.czerpak@gmail.com>

Dne 08. 12. 19 v 21:47 Łukasz Czerpak napsal(a):
> After googling a lot I figure out what to do and it worked - at least I can 
> access the most critical data.
> I’ve followed instructions from this blog post: 
> https://blog.monotok.org/lvm-transaction-id-mismatch-and-metadata-resize-error/
> 
> However, I have no idea what was the root cause of this. I hope I can fully 
> recover the volumes w/o re-creating the whole VG.
> In case I did something terribly wrong that looked like the solution now, but 
> may cause issues in future - I would appreciate any hints.
> 
>>
>> $ lvchange -ay vg1
>> WARNING: Not using lvmetad because a repair command was run.
>> Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expected 505.

Hi

What's been you lvm2 & kernel version ?

This difference is too big for 'recent' versions - there should never be more
then one - unless you are using old kernel & old lvm2.

Regards

Zdenek
