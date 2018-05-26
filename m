From: Dennis Schridde <devurandom@gmx.net>
Date: Sat, 26 May 2018 12:15:35 +0200
Message-ID: <2792567.HtBFFn6iJN@monk>
In-Reply-To: <7415801.S7CYg4Nbn9@monk>
References: <1973783.dFIIZJkBNM@monk> <254418594.lCqEE9x6Ep@monk>
	<7415801.S7CYg4Nbn9@monk>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2100842.3VW33P9Yzu";
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

--nextPart2100842.3VW33P9Yzu
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 23 May 2018 21:39:47 CEST Dennis Schridde wrote:
> On Wednesday, 16 May 2018 20:31:15 CEST Dennis Schridde wrote:
> > On Tuesday, 15 May 2018 13:15:55 CEST Zdenek Kabelac wrote:
> > > Dne 15.5.2018 v 10:11 Dennis Schridde napsal(a):
> > > To get direct access to metadata - you could use your latest lvm2
> > > 2.02.177
> > > build (or even 'git master'). In these recent versions there is added
> > > support to activate directly these 'subLVs'.  So with latest lvm2 you
> > > can:
> > > 
> > > lvchange -ay  vg/lv_cmeta
> > 
> > I tried that (using 2.02.177), but it does not work:
> > # lvchange -ay ernie/cache_cmeta
> > 
> >   Operation not permitted on hidden LV ernie/cache_cmeta.
> 
> Does anyone have a suggestion how I can activate this volume in order to
> extract the information Zdenek asked for?
> 
> For more context please see the start of this thread.  The gist is that my
> cached LV cannot be activated anymore, and `lvconvert --repair` reports:
> bad checksum in superblock
>   Repair of cache metadata volume of cache ernie/system failed (status:1).
> Manual repair required!
> 
> My most important questions are:
> * What is broken?
>   - What information does the superblock carry / what is its purpose?
>   - Where is it located / which part of my disk was damaged?
>   - What will be the consequence of it being irrecoverably lost?
> * What does "manual repair" mean in detail?
>   - Using a specific tool?
>   - Flipping bits using a hex editor?
> * Is there some way to recover the cache?  Or is it at least possible to
> uncache the LV forcibly, to hopefully recover the data on the origin LV?
> * What is your recommendation to minimise data loss?

How would I create a backup of the affected LVs, so that dangerous commands 
would not destroy the data and get me into an unrecoverable state?  Is that 
possible without activating the volumes?  Is it possible to force-activate the 
volumes, without changing the bits on the disk -- just so that I can read from 
the LV and create the backup?

--Dennis
--nextPart2100842.3VW33P9Yzu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEE0Ngi/nirHnbsz3NFz+h/M161qdwFAlsJM8cACgkQz+h/M161
qdxhlgv+KwNKTSEXKovpPUWKDfsPV9ngQlJjSCscCdM6Rgvd+t2Mj5rP50+/lTZm
mFMT4JQYQG/0Ef5JU4I1S6MBs7QXrjed505+72R1qM1XnEev8idfaI7WBpshg5pH
6fVWOBaVFtLnpd3ks5ryn++3JpquCBQMVHOqe2FELGKLyj6hde5/JlnVROQP2fl/
6DWAklAoYM4V7e8h619XhPMNIA7gE0gy/1LD8C5ReHNtr2T+uNNUgvZPcVY1Ux8m
j2XEEeIJU/eITNQhay5l93Nk1UfltUonOznmjm6WzOkg4RRuOBbjLSRazvZG65eX
iXOpfjDrgjSu8QVYvrH5g/3avY/SlXG1IVvBDvuXqxFIeZMdNs71Fl4viUQQbR0C
38OiH2nlLYY2rU+FfrCr9+HOkQUdFRw4gwqarIHuxIi1ny8YEEOmgQ7muje1X+D2
D5PErUQ+vKyMrboY2rU9Yi5KN1vK2RR/UC2gwZi7TDrHN0oX6FiqecmcVmgJe5/R
ewOryCUZ
=x/Dm
-----END PGP SIGNATURE-----

--nextPart2100842.3VW33P9Yzu--
