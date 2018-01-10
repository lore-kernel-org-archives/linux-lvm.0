References: <f1be22d0-6bf3-e282-9692-92452f67122d@suse.com>
	<20180102171034.GC26695@redhat.com>
	<be5b9aa6-d9fb-2e45-d250-9736d1ae49a5@suse.com>
	<20180103150713.GA16217@redhat.com>
	<c4b0357d-2910-1c5f-7ffc-5cfbdecd4b11@suse.com>
	<526766b0-c099-9c7c-9df7-4f48c23d2b24@suse.com>
	<20180109154239.GA24472@redhat.com>
From: Eric Ren <zren@suse.com>
Message-ID: <ffeb78f6-3a36-3c53-c42a-72379ba231df@suse.com>
Date: Wed, 10 Jan 2018 14:55:42 +0800
MIME-Version: 1.0
In-Reply-To: <20180109154239.GA24472@redhat.com>
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

On 01/09/2018 11:42 PM, David Teigland wrote:
> On Tue, Jan 09, 2018 at 10:42:27AM +0800, Eric Ren wrote:
>>> I've tested your patch and it works very well.  Thanks very much.
>> Could you please consider to push this patch upstream?
> OK

Thanks very  much! So, can we update the `man 8 lvmlockd` to remove the 
below limitation
on lvresize?

"""
limitations of lockd VGs
...
   · resizing an LV that is active in the shared mode on multiple hosts
"""

>
>> Also, Is this the same case for pvmove as lvresize? If so, can we also
>> work out a similar patch for pvmove?
> Running pvmove on an LV active on multiple hosts could be allowed with the
> same kind of patch.  However, it would need to use cmirror which we are

OK, I see.

> trying to phase out; the recent cluster raid1 has a more promising future.

My understanding is:

if cluster raid1 is used as PV, data is replicated and data migration is 
nearly equivalent
to replace disk. However, in scenario PV is on raw disk, pvmove is very 
handy for data migration.

IIRC, you mean we can consider to use cluster raid1 as the underlaying 
DM target to support pvmove
used in cluster, since currect pvmove is using mirror target now?

> So I think cmirror should be left in the clvm era and not brought forward.

By the way, another thing I'd to ask about:   Do we really want to drop 
the concept of clvm?

 From my understanding, lvmlockd is going to replace only "clvmd" 
daemon, not clvm in exact.
clvm is apparently short for cluster/cluster-aware LVM, which is 
intuitive naming. I see clvm
as an abstract concept, which is consisted of two pieces: clvmd and 
cmirrord. IMHO, I'd like to
see the clvm concept remains, no matter what we deal with the clvmd and 
cmirrord. It might
be good for user or documentation to digest the change :)

Regards,
Eric
