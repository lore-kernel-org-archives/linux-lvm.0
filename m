References: <ccfceced-9471-ebff-d2ed-1669b82013ad@strike.wu.ac.at>
	<56d4ab3a-671a-834d-a51e-d1eabcaae232@redhat.com>
	<9d5f6f1e-f53e-f21d-e89b-e6d7cdd84409@strike.wu.ac.at>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Message-ID: <4f4c7bdd-c481-2141-d66c-30a4e6c99e95@gmail.com>
Date: Tue, 24 Oct 2017 13:03:15 +0200
MIME-Version: 1.0
In-Reply-To: <9d5f6f1e-f53e-f21d-e89b-e6d7cdd84409@strike.wu.ac.at>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] unable to remove snapshot of raid1 leg
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Alexander 'Leo' Bergolth <leo@strike.wu.ac.at>, Heinz Mauelshagen <heinzm@redhat.com>

Dne 23.10.2017 v 18:40 Alexander 'Leo' Bergolth napsal(a):
> On 10/23/2017 04:44 PM, Heinz Mauelshagen wrote:
>> LVM snapshots are meant to be used on the user visible raid1 LVs.
>> You found a bug allowing it to be used on its hidden legs.
>>
>> Removing such per leg snapshot should be possible after the raid1 LV got
>> deactivated.
> 
> Hmm. This LV is currently in use. Any chance to remove it with the raid1
> LV active?
> 
> Cheers,

Hi

Not with lvm2 command.

I could probably imagine a way with several dmsetup commands but it looks
fairly easier to do it in some 'offline' time.

-

The one 'risky' idea could be to try 'vgcfgrestore' metadata before taking
snapshot then (forcibly) remove  (dmsetup remove (-f)  vg-snapshot)  so 
snapshot is no longer referencing origin.
(force should not be needed - but if some has opened snapshot...)

Then you should be able to use  'lvchange --refresh vg'

and finally drop  'left-over'  cow volume with dmsetup remove.
(and make sure snapshot is already gone - if not - try remove again)

Regards

Zdenek
