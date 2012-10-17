Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q9HAKRFw002439
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2012 06:20:28 -0400
Received: from zimbra.linbit.com (zimbra.linbit.com [212.69.161.123])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q9HAKNrT005658
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2012 06:20:24 -0400
Received: from localhost (localhost [127.0.0.1])
	by zimbra.linbit.com (Postfix) with ESMTP id 5CBF21B413D
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2012 12:20:21 +0200 (CEST)
Received: from zimbra.linbit.com ([127.0.0.1])
	by localhost (zimbra.linbit.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dmJEmhAsJHyb for <linux-lvm@redhat.com>;
	Wed, 17 Oct 2012 12:20:21 +0200 (CEST)
Received: from soda.linbit (tuerlsteher.linbit.com [86.59.100.100])
	by zimbra.linbit.com (Postfix) with ESMTP id 3D22A1B40FB
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2012 12:20:21 +0200 (CEST)
Date: Wed, 17 Oct 2012 12:20:21 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Message-ID: <20121017102021.GN9562@soda.linbit>
References: <mailman.18903.1349274978.3548.linux-lvm@redhat.com>
	<506C5CD8.2070502@mohawksoft.com> <506CFA0B.4000006@tlinx.org>
	<506D055E.901@mohawksoft.com> <506D1931.4040102@tlinx.org>
	<506D624A.5070104@mohawksoft.com> <506DA0B4.5020208@redhat.com>
	<507D4FE6.7020803@mohawksoft.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <507D4FE6.7020803@mohawksoft.com>
Subject: Re: [linux-lvm] access or interface to list of blocks that have,
 changed	via C.O.W.?
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
To: linux-lvm@redhat.com

On Tue, Oct 16, 2012 at 08:15:34AM -0400, Mark Woodward wrote:
> On 10/04/2012 10:44 AM, Bryn M. Reeves wrote:
> >-----BEGIN PGP SIGNED MESSAGE-----
> >Hash: SHA1
> >
> >On 10/04/2012 11:17 AM, Mark Woodward wrote:
> >>I was going to try to answer in line, but decided that it would be
> >>too much work. There are utilities to extract the exception table
> >>out of the LVM2 snapshot, and if you can code in almost any
> >>language, you can write your own. It is dead simple. You can google
> >>for ddsnap and zumastore to
> >ddsnap was the Zumastor snapshot tool which uses a different in-kernel
> >snapshot target and metadata format. It does not share code with
> >current (or historic afaik) LVM2/device-mapper and has been dead for a
> >number of years (last commits around 2008).
> >
> >>get the code. It old and not supported currently, but still works.
> >>I
> >Really? I'd be surprised if it even builds against modern kernels or
> >device-mapper.
> >
> >>The format of the array is simple: old_address (The offset in the
> >>volume) followed by the new_address (the offset in the COW device).
> >>An array of all the "old_address" values is the changed block list.
> >>You don't even need to worry about the data if you can really get a
> >>file list by blocks.
> >If you really want to poke into the CoW store format I'd start by
> >reading dm-snap-persistent.c which is the traditional device-mapper
> >snapshot format.
> >
> >Snapshots using the thinp target use the metadata format described in
> >dm-thin-metadata.c.
> 
> Sorry, I got pulled away a bit.
> 
> Let me understand. The CoW format changed, but the header signature
> stayed the same?

Not at all.

> I'm having a bit of an issue understanding this.

That's probably because it is nonsense ;-)


So we have the "traditional" COW snapshots.
And we have the "new" "thin provisioned pool" based snapshots.

The thinp target went in in upstream 3.2.
It is also present in RHEL 6.3 ("2.6.32"+rhel patches).

This thing has some "pool" from which it "allocates" chunks,
and some "meta" device where it persists its logical to physical mapping
and chunk refcounting in some btree.

The relevant source files are in the kernel source tree,
drivers/md/dm-thin*

It comes with userland tools to dump its meta data: thin_dump,
from package device-mapper-persistent-data, respectively
https://github.com/jthornber/thin-provisioning-tools


The "traditional" COW based snapshot lives in kernel source as
drivers/md/dm-snap*, and has a very simple meta data layout,
which you probably know about already.

If not, here are some links:
http://thread.gmane.org/gmane.linux.lvm.general/9898/focus=9899
http://thread.gmane.org/gmane.linux.lvm.general/10886
http://docs.opensvc.com/storage.dds.html
http://git.opensvc.com/?p=dds/.git;a=summary

No, that meta data layout did not change (afaik).

> I had some code that worked in the 2.6 series of kernels
> using the LVM tools. However, when I run it on a later kernel
> version (3.2.0) it seems not to work. I am more than willing to say
> its a bug on my end, but can you clarify whether or not it is
> expected that this format would change?

Nope.

Maybe you can be more specific as to what your code does,
and how/when it fails, currently?

> I am planning a server upgrade and I rely on the snapshot format for
> my differential backup tools.
> 
> As for the thin provisioned snapshot I have been long waiting for
> this. Is it "production ready?" if so, in what kernel version moving
> forward?

It is "tech preview" in RHEL 6.3.
It is in upstream kernel since 3.2.
It "learned" a few things since (e.g. discard support with 3.6).

"Production ready"...
Well. I'm sure some use it in production alright.
Wether that means it is fit for *your* use case, I don't know.

Hth,

-- 
: Lars Ellenberg
: LINBIT | Your Way to High Availability
: DRBD/HA support and consulting http://www.linbit.com

DRBD� and LINBIT� are registered trademarks of LINBIT, Austria.
