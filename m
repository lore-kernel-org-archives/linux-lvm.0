From: Dennis Schridde <devurandom@gmx.net>
Date: Tue, 05 Jun 2018 12:08:27 +0200
Message-ID: <13069944.niihZIYQkx@monk>
In-Reply-To: <184ec98a-a34a-1338-a520-ff7669007e5d@redhat.com>
References: <1973783.dFIIZJkBNM@monk> <2010899.yIpkChuX4T@monk>
	<184ec98a-a34a-1338-a520-ff7669007e5d@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2040634.0ZHP6vyuaY";
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
Cc: Marian Csontos <mcsontos@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>

--nextPart2040634.0ZHP6vyuaY
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 5 June 2018 10:14:16 CEST Marian Csontos wrote:
> On 06/04/2018 01:50 PM, Dennis Schridde wrote:
> > On Tuesday, 15 May 2018 13:15:55 CEST Zdenek Kabelac wrote:
> >> To get direct access to metadata - you could use your latest lvm2
> >> 2.02.177
> >> build (or even 'git master'). In these recent versions there is added
> >> support to activate directly these 'subLVs'.  So with latest lvm2 you
> >> can:
> >> 
> >> lvchange -ay  vg/lv_cmeta
> > 
> > This command was only successful in LVM 2.02.178-rc1, but failed in
> > 2.02.177.> 
> >> and then you can capture content of this LV via 'dd' into file
> >> and compress and attach 'xz' compressed to BZ.
> > 
> > I created a report in bugzilla [4], but since the `cache_cmeta` LV appears
> > to contain parts of my personal files, I cannot attach it.  However, I
> > gained
> It definitely should not. _cdata is where fragments you your data are
> stored, and _cmeta contains only metadata (e.g. counters and references
> to cdata.)
> 
> If there really are fragments of data in _cmeta LV, something must have
> gone wrong elsewhere.

Thanks for the insight.  I attached the first 4890783 bytes (i.e. those before 
the blocks of seemingly unstructured data, which I saw in `hexdump -C`) of 
that LV to the bug report [4].  Hopefully it contains enough information to 
figure out what is broken.

[4]: https://bugzilla.redhat.com/show_bug.cgi?id=1585670
--nextPart2040634.0ZHP6vyuaY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEE0Ngi/nirHnbsz3NFz+h/M161qdwFAlsWYRsACgkQz+h/M161
qdwhhgv/SC0egkSrfb9fUNOsSo3/fRjeL024z0TDXOO98JM+ohApqUV242ofmWBP
8u30lArpP8808z9r+qCbK9a6e/W5QnG2pupQvLXxAlXU4ET7oYov0fJJAzaPlWe/
16cz78zMMBIAd7dIAWHmvVdFr/JCiK9+CpRUxL5NE9rhVLSa1n++KeOtCrUDgGGj
GhbCjuc5tgIHhIdxBJwBdZsCnOla7M4E/EtM2Xde+VnPhrJVK9g2Xp49Eb9V/7NW
LawYM+VOqxzLnEJsQO0MTIHLS0R7IEySdeof3aoVX0G/tOLjOrMBt/nL8RrHzV4p
jwOvQIaTV9MQI/BwytavlFY67bk/nlKIFMUR5Tcwk7vX/RP2mYsfwJTgarFcDsYk
iASMyGInXLDsh1qbIJQsLrKLpEsXyx++MV/zKOjp/zBEOYVQ5oPADX22QqRIKG1H
qWEFDf8wVIy+WfqXAus95HuLR7l1ebZrPrb70I9cdj6jqDY2NchO/BGur8/0CO4R
yMwxQyjx
=h4vp
-----END PGP SIGNATURE-----

--nextPart2040634.0ZHP6vyuaY--
