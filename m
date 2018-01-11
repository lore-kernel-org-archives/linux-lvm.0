References: <f1be22d0-6bf3-e282-9692-92452f67122d@suse.com>
	<20180102171034.GC26695@redhat.com>
	<be5b9aa6-d9fb-2e45-d250-9736d1ae49a5@suse.com>
	<20180103150713.GA16217@redhat.com>
	<c4b0357d-2910-1c5f-7ffc-5cfbdecd4b11@suse.com>
	<526766b0-c099-9c7c-9df7-4f48c23d2b24@suse.com>
	<20180109154239.GA24472@redhat.com>
	<ffeb78f6-3a36-3c53-c42a-72379ba231df@suse.com>
	<20180110155659.GB24129@redhat.com>
From: Eric Ren <zren@suse.com>
Message-ID: <bc98d093-220e-031b-a388-4ce850b6c49c@suse.com>
Date: Thu, 11 Jan 2018 17:32:23 +0800
MIME-Version: 1.0
In-Reply-To: <20180110155659.GB24129@redhat.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: Re: [linux-lvm] lvmlockd: about the limitation on lvresizing the LV
 active on multiple nodes
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
To: LVM general discussion and development <linux-lvm@redhat.com>, David Teigland <teigland@redhat.com>

Hi David,

>> IIRC, you mean we can consider to use cluster raid1 as the underlaying DM
>> target to support pvmove
>> used in cluster, since currect pvmove is using mirror target now?
> That's what I imagined could be done, but I've not thought about it in
> detail.  IMO pvmove under a shared LV is too complicated and not worth
> doing.

Very true.

>
>> By the way, another thing I'd to ask about:   Do we really want to drop
>> the concept of clvm?
>>
>>  From my understanding, lvmlockd is going to replace only "clvmd" daemon,
>> not clvm in exact.  clvm is apparently short for cluster/cluster-aware
>> LVM, which is intuitive naming. I see clvm as an abstract concept, which
>> is consisted of two pieces: clvmd and cmirrord. IMHO, I'd like to see
>> the clvm concept remains, no matter what we deal with the clvmd and
>> cmirrord. It might be good for user or documentation to digest the
>> change :)
> Thank you for pointing out the artifice in naming here, it has long
> irritated me too.  There is indeed no such thing as "clvm" or "HA LVM",
> and I think we'd be better off to ban these terms completely, at least at
> the technical level.  (Historically, I suspect sales/marketing had a role
> in this mess by wanting to attach a name to something to sell.)
Hha, like cluster MD raid.
>
> If the term "clvm" survives, it will become even worse IMO if we expand it
> to cover cases not using "clvmd".  To me it's all just "lvm", and I don't
> see why we need any other names.
It looks like people need a simple naming to distinguish the usage scenario:
local and cluster.

Thanks,
Eric
