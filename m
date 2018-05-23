From: Dennis Schridde <devurandom@gmx.net>
Date: Wed, 23 May 2018 21:39:47 +0200
Message-ID: <7415801.S7CYg4Nbn9@monk>
In-Reply-To: <254418594.lCqEE9x6Ep@monk>
References: <1973783.dFIIZJkBNM@monk>
	<deebd997-6278-e2a3-7b9f-3c3c58a56a51@redhat.com>
	<254418594.lCqEE9x6Ep@monk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1653596.EixhxDBoGf";
	micalg="pgp-sha256"; protocol="application/pgp-signature"
Subject: Re: [linux-lvm] Check of pool ernie/cache failed (status:1). Manual
	repair required!
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
To: linux-lvm@redhat.com
Cc: Zdenek Kabelac <zkabelac@redhat.com>

--nextPart1653596.EixhxDBoGf
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 16 May 2018 20:31:15 CEST Dennis Schridde wrote:
> On Tuesday, 15 May 2018 13:15:55 CEST Zdenek Kabelac wrote:
> > Dne 15.5.2018 v 10:11 Dennis Schridde napsal(a):
> > To get direct access to metadata - you could use your latest lvm2 2.02.177
> > build (or even 'git master'). In these recent versions there is added
> > support to activate directly these 'subLVs'.  So with latest lvm2 you can:
> > 
> > lvchange -ay  vg/lv_cmeta
> 
> I tried that (using 2.02.177), but it does not work:
> # lvchange -ay ernie/cache_cmeta
>   Operation not permitted on hidden LV ernie/cache_cmeta.

Does anyone have a suggestion how I can activate this volume in order to 
extract the information Zdenek asked for?

For more context please see the start of this thread.  The gist is that my 
cached LV cannot be activated anymore, and `lvconvert --repair` reports:
bad checksum in superblock
  Repair of cache metadata volume of cache ernie/system failed (status:1). 
Manual repair required!

My most important questions are:
* What is broken?
  - What information does the superblock carry / what is its purpose?
  - Where is it located / which part of my disk was damaged?
  - What will be the consequence of it being irrecoverably lost?
* What does "manual repair" mean in detail?
  - Using a specific tool?
  - Flipping bits using a hex editor?
* Is there some way to recover the cache?  Or is it at least possible to 
uncache the LV forcibly, to hopefully recover the data on the origin LV?
* What is your recommendation to minimise data loss?

--Dennis
--nextPart1653596.EixhxDBoGf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEE0Ngi/nirHnbsz3NFz+h/M161qdwFAlsFw4MACgkQz+h/M161
qdxqpwwAkGQv0p8Ofk5/w3Oxl7iRK9PtBXLUomiR7P19hS6le5j05qXjs3t6W0zn
Wzvb98g4+WQD/7ivuqghBbJiFGk4uke+8q5mpjkPYJMnMurbmRzHvYzyACugobz0
CwKcCNCeJ2yJaMXm705ByckuhIBkDBX8cJEJ4vD59X97N3LB2REZpnDWSU0KjqIN
5jSYO79PQOpwCgcgdlNz15cXaEo/1tEreCujAL7TYiKRRpJs4WmtjbotfFXgkzaz
vsqwaoo5UKz9pprvpVKScHuK1XKoPrvyjGcWW51DK2f9VqwHstlax5qgmxjpOJ7m
NXAK49+SgJWF92WdtUO9D9Ob6sJojYrklmSEZpYeJWRVLFCAGkV9VNz60sOBAq5c
2wxgdxq3Wbrvs5ooZ6K26wJUj5hpu5W8VMJI7ncmQhtN6pJxa00YVnT17EuovkJ+
3lsdM8fChN0hfrB+P7VtzNfUXY+qSEZcskndJLkILjHTd4EfV13EgvVF9DUGwZPp
Ti4NH6Il
=Ne2T
-----END PGP SIGNATURE-----

--nextPart1653596.EixhxDBoGf--
