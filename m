Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9FF8ar02386
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 11:08:36 -0400
Received: from clown.omnifarious.org (dsl231-056-102.sea1.dsl.speakeasy.net
	[216.231.56.102])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i9FF8YwN019201
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 11:08:34 -0400
Date: Fri, 15 Oct 2004 08:08:23 -0700
From: Eric Hopper <hopper@omnifarious.org>
Subject: Re: [linux-lvm] LVM2 features
Message-ID: <20041015150823.GB6352@omnifarious.org>
References: <20041010032631.GO32455@omnifarious.org>
	<a06110401bd95356589a8@[192.168.10.11]>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cmJC7u66zC7hs+87"
Content-Disposition: inline
In-Reply-To: <a06110401bd95356589a8@[192.168.10.11]>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--cmJC7u66zC7hs+87
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 15, 2004 at 10:15:07AM +0200, John Seifarth wrote:
> Eric Hopper posted the query below last weekend, but I've seen no=20
> replies on the list.

Here are the things I've seen...

Snapshots of the root partition seem dodgey.  Someone claims that they
work on the latest LVM2 client library.

Snapshots of other partitions seem to work OK.

pvmove has lots of weird and arcane limitations that make no sense to me
at all.  It acted very strangely and seemed to lock parts of my system
when I tried it with a fresh Fedora Core 2 install, and I've been afraid
to try it since.  I see lots of messages flying back and forth about
people having to hand-construct command lines to move specific extents
because of some odd limitation of pvmove.

I also see little hard information about these limitations or why they
exist.  I see all kinds of confused posts stating that this detail or
that detail is the reason some particular operation doesn't work quite
right.

I used to know some of the LVM developers personally, and this list used
to be much more open about the internal workings of LVM and there used
to be people who would state plainly and authoritatively what was
causing some particular problem.  I remember fondly the debates over
getting /boot onto an LVM partition.

I don't know what's happened or why.

=46rom the outside, it seems as if LVM2 (which by all accounts is much
higher quality code) was rushed into production before it was
feature-comparable to LVM1, and all the developers are embarassed about
it and not talking frankly about what's wrong.  If this were not Open
Source, I'd say the company they worked for was discouraging them from
discussing the limitations openly and leaving the users to guess and
talk amongst themselves about them.

Maybe I'm wrong.

*sigh*,
--=20
"It does me no injury for my neighbor to say there are twenty gods or no Go=
d.
It neither picks my pocket nor breaks my leg."  --- Thomas Jefferson
"Go to Heaven for the climate, Hell for the company."  -- Mark Twain
-- Eric Hopper (hopper@omnifarious.org  http://www.omnifarious.org/~hopper)=
 --

--cmJC7u66zC7hs+87
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFBb+fnjtsvlOwvazYRApaCAKCPkkVIM+UK4jANN6kbgfOTQkK0rACg4d5L
5iPuSZKAWAofme7hnWxPTOc=
=2oaA
-----END PGP SIGNATURE-----

--cmJC7u66zC7hs+87--
