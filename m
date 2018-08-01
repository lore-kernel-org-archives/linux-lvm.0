References: <20180726163145.pywehjailovwjv2a@merlins.org>
	<393829ca-b3ea-77c5-9cc0-9fd12e5eec07@redhat.com>
	<20180727182658.GI23157@merlins.org>
	<20180731024410.v3ovzjth4svrus6y@merlins.org>
	<c086c2e3-8b84-76a6-129a-0bad04bb849f@redhat.com>
	<20180731211706.zwx5luhcpkyropzl@merlins.org>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <14527627-bb35-fa05-7a66-e540e7f18c33@redhat.com>
Date: Wed, 1 Aug 2018 13:37:30 +0200
MIME-Version: 1.0
In-Reply-To: <20180731211706.zwx5luhcpkyropzl@merlins.org>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Why use thin_pool_autoextend_threshold < 100 ?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Marc MERLIN <marc@merlins.org>

Dne 31.7.2018 v 23:17 Marc MERLIN napsal(a):
> On Tue, Jul 31, 2018 at 02:35:42PM +0200, Zdenek Kabelac wrote:
>> If you monitor amount of free space for data AND for metadata in thin-pool
>> yourself you can keep easily threshold == 100.
>   
> Understood. Two things:
> 1) basically threshold < 100 allows you to hit the limit, have LVM pause
> IO, allocate more blocks, and resize the filesystem for you.
> However, if you're not monitoring this, it's ultimately just the same as
> having threshold = 100 and hoping that you won't hit the limit, except
> that you're adding the complexity of resizes in the mix. Correct?

Sure thing, when there is no free space to extend your overprovisioned 
thin-pool and you run out-of-space you hit the limit at some point....


> 2) I wasn't quite clear on what metadata was used for, and I let
> vgcreate pick a default amount for me. Am I correct that it basically
> tracks block usage and maybe LVM snapshots that I'm not going to use,
> and that therefore if I don't resize my LV, I don't really have to
> worry about metadata running out?

kernel metadata stored in _tmeta LV hold old mapping of all thin-volumes.
i.e.  which thin-pool chunk belongs to which thin-volume.

>> Just don't forget when you upsize 'data' - you should also typically
>> extend also metadata -  it's not uncommon issue user  start with small
>> 'data' & 'metadata' LV with thin-pool - then  continue to only extend
>> thin-pool 'data' volume and ignore/forget about metadata completely
>> and hit the full metadata device - which can lead to many troubles
>> (hitting full dataLV is normally not a big deal).
> 
> Thanks for the warning. Given that I started with the maximum size and
> don't plain on ever extending (to be fair, I can't), I should be ok
> there, correct?

Yep -  once you make ~16GiB metadata you can't make them any bigger (hard 
internal limitation of existing thin-pool target implementation).

But you still need to remember you can run of space in your metadata if there 
is heavy usage of many large thin volumes - so the value of free space should 
be always somehow monitored...


Regards

Zdenek
