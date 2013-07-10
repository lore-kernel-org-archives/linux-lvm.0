Message-ID: <51DD1A8E.9080702@redhat.com>
Date: Wed, 10 Jul 2013 10:25:50 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <731d217f00b6d8f6c16a75cbe167baed.squirrel@mail.mohawksoft.com>
	<51DAF9AF.900@redhat.com>
	<b6fa555a0b30a89536d74e2d26c4dc35.squirrel@mail.mohawksoft.com>
	<51DB0CF6.7070400@redhat.com>
	<f86ce4aaade1aef71c980d7202140c78.squirrel@mail.mohawksoft.com>
In-Reply-To: <f86ce4aaade1aef71c980d7202140c78.squirrel@mail.mohawksoft.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshots of snapshots are not supported yet
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
To: markw@mohawksoft.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 10.7.2013 05:45, markw@mohawksoft.com napsal(a):
> One more annoying question, if you have the patience.
>
> Suppose I create a thin provisioned volume, say disk0.
>
> I take a snapshot of disk0 and name it disk0_snap0
> After a number of changes I then take another snapshot, and call it
> disk0_snap1
>
> Is the thin provisioning stuff smart enough to realize that disk0_snap0
> should be rewired to reference disk0_snap1 as its origin? It would look
> like this:
>
> disk0 -> disk0_snap1 -> disk0_snap0
>
> What I would like to see is something like this:
>
> disk0 -> disk0_snap2 -> disk0_snap1 -> disk0_snap0
>
> Create disk0_snap3
>
> disk0 -> disk0_snap3 -> disk0_snap2 -> disk0_snap1 -> disk0_snap0
>
> Where all writes to disk0 result in CoW to disk0_snap3 and the remaining
> snaps remain unchanged.
>
> Here is the kicker, I want to perform a differential backup on disk0_snap3
> and disk0_snap2.  Suppose I already recreated disk0_snap2 on some server.
> I now want to update it to disk0_snap3. I need to get a block list from
> disk0_snap2 and disk0_snap3, then generate a list of blocks needed to
> permute snap2 to snap3.
>
> Any info?
>

Yes - differential snapshot will be supported through thin provisioning
target - where you will be able to make a simple diff just by reading
metadata - it will be essential piece of replication.

AFAIK Joe has this in plan for some time - and there was even some 
announcement from some third-party developer to support this.

There is not going to be any upstream support for doing this with
old-snaps in foreseeable future.

Also keep in mind your idea of using old-snap of snap of snap would be very 
slow and fragile to use.

Zdenek
