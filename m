Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0VGMlZi013583
	for <linux-lvm@redhat.com>; Thu, 31 Jan 2013 11:22:48 -0500
Received: from zimbra.linbit.com (zimbra.linbit.com [212.69.161.123])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0VGMiu4004362
	for <linux-lvm@redhat.com>; Thu, 31 Jan 2013 11:22:45 -0500
Received: from localhost (localhost [127.0.0.1])
	by zimbra.linbit.com (Postfix) with ESMTP id 79AF11B413D
	for <linux-lvm@redhat.com>; Thu, 31 Jan 2013 17:22:43 +0100 (CET)
Received: from zimbra.linbit.com ([127.0.0.1])
	by localhost (zimbra.linbit.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OMa-u5HYJgLT for <linux-lvm@redhat.com>;
	Thu, 31 Jan 2013 17:22:43 +0100 (CET)
Received: from soda.linbit (tuerlsteher.linbit.com [86.59.100.100])
	by zimbra.linbit.com (Postfix) with ESMTP id 5E9F61B40FB
	for <linux-lvm@redhat.com>; Thu, 31 Jan 2013 17:22:43 +0100 (CET)
Date: Thu, 31 Jan 2013 17:22:43 +0100
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Message-ID: <20130131162243.GH8837@soda.linbit>
References: <20130124155312.GA10563@daedalus.cslab.ece.ntua.gr>
	<20130124180834.GA3122@agk-dp.fab.redhat.com>
	<51017F0C.20100@bmsi.com>
	<20130124234235.GB3122@agk-dp.fab.redhat.com>
	<20130125084410.GB10563@daedalus.cslab.ece.ntua.gr>
	<51068238.1090809@redhat.com>
	<20130129082443.GE19318@daedalus.cslab.ece.ntua.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20130129082443.GE19318@daedalus.cslab.ece.ntua.gr>
Subject: Re: [linux-lvm] Sparse LVs, --virtualsize equal to --size
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Tue, Jan 29, 2013 at 10:24:43AM +0200, Vangelis Koukis wrote:
> On Mon, Jan 28, 2013 at 02:50:48pm +0100, Marian Csontos wrote:
> > On 01/25/2013 09:44 AM, Vangelis Koukis wrote:
> > >On Thu, Jan 24, 2013 at 11:42:35pm +0000, Alasdair G Kergon wrote:
> > >>So look at thin provisioning with its zeroing option.
> > >>External origin.  (support currently being added to lvm)
> > >>
> > >>Or this not-yet-upstream target:
> > >>http://people.redhat.com/agk/patches/linux/editing/dm-add-zeroed-target.patch
> > >>
> > >>Alasdair
> > >
> > >Thanks Alasdair,
> > >
> > >this seems to fit the bill perfectly, it's a shame it's
> > >not yet merged upstream.
> > >
> > >Until then, if we are to go with the "snapshot-over-the-zero-target"
> > >route, can you comment on quantifying the space overhead of tracking
> > >chunks in the snapshot?
> > 
> 
> Hello Marian,
> 
> thank you for your answer, here are some points I'm not sure I have
> understood completely:
> 
> > Beware! Large old-style snapshots may take a very long time to
> > activate[1] (reportedly up to few hours)

BTW,

    I've seen activation of "thin" snapshots take "ages" as well.
    Maybe not "few" hours, but close.

    That's because the implicitly started thin_check is 100% cpu
    on a single core, we have 64k "chunk size",
    and thus the tree is *huge*.

    Also lvremove of a thin snapshot in that setup is single core cpu bound,
    takes >= 20 minutes or so, locks out any other lvm command for that time.

    That's with
      LVM version:     2.02.95(2)-RHEL6 (2012-10-16)
      Library version: 1.02.74-RHEL6 (2012-10-16)
      Driver version:  4.22.6
    [ "tech preview", so that may still improve ;-) ]

Back on topic:

> > and my guess is many
> > smaller snapshots will behave the same[2], the total amount of
> > chunks written to all snapshots being the key to slow start...
> > 
> 
> What is old-style snapshots? Old-style compared to what, thin LVs?

Yes.

> By "activate", do you refer to the problem of very slow VG activation

Yes.

> If yes, then the question still remains:
> 
> Can you please comment on the exact on-disk format used when doing LVM
> snapshots? What is the exact format of the blocks being written to the
> COW volume?

I'm pasting parts of an older post to this list
(from 2008, Restore LVM snapshot without creating a full dump to an "external" device?)

"old style snapsthots", aka
dm-snap and dm-exception-store are implemented in a way that
for a single snapshot, you get
   (mapping only) snapshot-origin
   (real storage) origin-real
   (mapping only) snapshot
   (real storage) COW (or exception store)

COW on disk format is pretty simple (as of now).
its all fixed size chunks.
it starts with a 4x32bit header,
[SnAp][valid][version][chunk_size in sectors]
so any valid snapshot looks
"SnAp" 1 1 [power of two]

chunk_size it what you set with the lvcreate "-c" option.

the rest of the (just as well chunk_size'ed) header block is unused.

expressed in chunks, the COW storage looks like:
[header chunk][exception area 0][data chunks][....][exception area 1][...]
where each exception area is one "chunk" itself.
each exception area holds a mapping table of
"logic chunk number" to "in COW storage chunk number", both 64bit.
"logic number" is called "old", "in COW" address is called "new".
byte number
1                     [old][new]
2                     [old][new]
3                     ...
(chunk_size*512/16)   [old][new]
following are as many data chunks.

this whole thing is append only.

On activation,
it needs to scan all those [exception area ...] blocks,
until it find the "terminating" zeroed one.
It reads in and stores this mapping in core memory.


Hope that helps,


-- 
: Lars Ellenberg
: LINBIT | Your Way to High Availability
: DRBD/HA support and consulting http://www.linbit.com
