References: <CAEmTpZEikmudjzJPadhreVxXBq9Lsa8bMkD20B0i1u-fMPks6Q@mail.gmail.com>
	<569F78FA.4050104@redhat.com>
	<CAEmTpZGM6SPnBavLPD48rgMPGZ_Q8oPxo4v9kgge7Ae5AS6X+A@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <569F97A9.6050003@redhat.com>
Date: Wed, 20 Jan 2016 15:20:25 +0100
MIME-Version: 1.0
In-Reply-To: <CAEmTpZGM6SPnBavLPD48rgMPGZ_Q8oPxo4v9kgge7Ae5AS6X+A@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM and chain of snapshots
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Alexander Patrakov <patrakov@gmail.com>, =?UTF-8?B?0JPQtdC+0YDQs9C40Lkg0JHQsNC20YPQutC+0LI=?= <g.bazhukov@ideco.ru>

Dne 20.1.2016 v 13:54 Марк Коренберг napsal(a):
>
> 2016-01-20 17:09 GMT+05:00 Zdenek Kabelac <zkabelac@redhat.com
> <mailto:zkabelac@redhat.com>>:
>
>     ed sta
>
>
>
> Thanks for the response, but I do not understand how thin-provisioning is
> related to question i'm asking.
>
> As far as I understand, if 20 snapshots are created even in thin-provisioning
> mode, write to origin will be converted
> to 21 writes. Does not it ? My scenario mean that no write multiplication
> occurs while making "normal" operations in
> userspace (i.e. not writing to snapshots, while origin is under heavy
> write-load). Also, my scenario adds functionality
> of "snapshot of snapshot" easily. The case I'm trying to discuss is something
> like chain of qcow2 files used to make
> live snapshots in KVM.
>

You cannot chain old-snaps this way (you cannot map old-snap over old-snap)
And no - it's not easy to  add one.
So your proposal would have worked for exactly 1 level
e.g.  you continue to write to snap - and you keep origin intact,
but you cannot map another 'snap' over this snap.

lvm2 is currently incapable of doing this - and it's fairly nontrivial to 
support this - and especially when we have thin-provisioning, noone is 
currently planning to extend old snapshot with such complicated feature.

> Use case: having such snapshot every day. And after snapshot count exceed 30,
> meld first snapshot into it's origin.

So you would need 30 chained snaps....
And after 30 of them - you actually would need merging them - quite complicated...

> This operation should be possible without any unmounting. After merging, that
> snapshot should contain empty diff
> and so may be eliminated from chain via replacing dmsetup tables.

It's much better to directly update 'origin' and just drop no longer needed 
snapshot.

The only major issue is - running  30 old snapshot it just not suitable for 
any use...

> In other words, my proposal is not connected to low-level things in LVM. Yes,
> all snapshots I describe can be
> thin-provisioned. Just minimal logic, CLI and XML should extended.

In other words - you just described how thin-provisioning works
and there is no reason to reinvent the wheel again :)

So please for this use-case switch to thin-provisioning.

Regards

Zdenek
