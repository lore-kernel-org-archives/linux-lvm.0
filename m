Date: Wed, 10 Jan 2018 09:56:59 -0600
From: David Teigland <teigland@redhat.com>
Message-ID: <20180110155659.GB24129@redhat.com>
References: <f1be22d0-6bf3-e282-9692-92452f67122d@suse.com>
	<20180102171034.GC26695@redhat.com>
	<be5b9aa6-d9fb-2e45-d250-9736d1ae49a5@suse.com>
	<20180103150713.GA16217@redhat.com>
	<c4b0357d-2910-1c5f-7ffc-5cfbdecd4b11@suse.com>
	<526766b0-c099-9c7c-9df7-4f48c23d2b24@suse.com>
	<20180109154239.GA24472@redhat.com>
	<ffeb78f6-3a36-3c53-c42a-72379ba231df@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffeb78f6-3a36-3c53-c42a-72379ba231df@suse.com>
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
Content-Type: text/plain; charset="utf-8"
To: Eric Ren <zren@suse.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Jan 10, 2018 at 02:55:42PM +0800, Eric Ren wrote:
> if cluster raid1 is used as PV, data is replicated and data migration is
> nearly equivalent
> to replace disk. However, in scenario PV is on raw disk, pvmove is very
> handy for data migration.
> 
> IIRC, you mean we can consider to use cluster raid1 as the underlaying DM
> target to support pvmove
> used in cluster, since currect pvmove is using mirror target now?

That's what I imagined could be done, but I've not thought about it in
detail.  IMO pvmove under a shared LV is too complicated and not worth
doing.

> By the way, another thing I'd to ask about:�� Do we really want to drop
> the concept of clvm?
> 
> From my understanding, lvmlockd is going to replace only "clvmd" daemon,
> not clvm in exact.  clvm is apparently short for cluster/cluster-aware
> LVM, which is intuitive naming. I see clvm as an abstract concept, which
> is consisted of two pieces: clvmd and cmirrord. IMHO, I'd like to see
> the clvm concept remains, no matter what we deal with the clvmd and
> cmirrord. It might be good for user or documentation to digest the
> change :)

Thank you for pointing out the artifice in naming here, it has long
irritated me too.  There is indeed no such thing as "clvm" or "HA LVM",
and I think we'd be better off to ban these terms completely, at least at
the technical level.  (Historically, I suspect sales/marketing had a role
in this mess by wanting to attach a name to something to sell.)

If the term "clvm" survives, it will become even worse IMO if we expand it
to cover cases not using "clvmd".  To me it's all just "lvm", and I don't
see why we need any other names.
