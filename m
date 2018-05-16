From: Dennis Schridde <devurandom@gmx.net>
Date: Wed, 16 May 2018 20:31:15 +0200
Message-ID: <254418594.lCqEE9x6Ep@monk>
In-Reply-To: <deebd997-6278-e2a3-7b9f-3c3c58a56a51@redhat.com>
References: <1973783.dFIIZJkBNM@monk> <2230803.usHgyXdh9J@monk>
	<deebd997-6278-e2a3-7b9f-3c3c58a56a51@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2425690.2CP8zYR4Ni";
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

--nextPart2425690.2CP8zYR4Ni
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 15 May 2018 13:15:55 CEST Zdenek Kabelac wrote:
> Dne 15.5.2018 v 10:11 Dennis Schridde napsal(a):
> To get direct access to metadata - you could use your latest lvm2 2.02.177
> build (or even 'git master'). In these recent versions there is added
> support to activate directly these 'subLVs'.  So with latest lvm2 you can:
> 
> lvchange -ay  vg/lv_cmeta

I tried that (using 2.02.177), but it does not work:
# lvchange -ay ernie/cache_cmeta
  Operation not permitted on hidden LV ernie/cache_cmeta.

--Dennis
--nextPart2425690.2CP8zYR4Ni
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEE0Ngi/nirHnbsz3NFz+h/M161qdwFAlr8ePMACgkQz+h/M161
qdxlHQv/VVD6fpE15YsaAIBMU+0nH5dW8tCuTLoOnhHPkhF2zdnkOPbT9KbcQgYF
2AuXV5NsBj6khPNfE9sJNjVhhARd4nR8ODs2FpgJhlzKFoLrkmWCDOhU7XAcmtre
bq2IGzfSOWaNL5mAfKcRKOxQVYic83Qs9IJuLx+Sbg4AaiiwO5mF+pW4JhTE+hEO
FFr/U1PzUZy6gd6fFrZVG5vPAYdEl4ZZS8FHpMTJ3jPeVC6YH4x1prFu8lCUtvwT
Dh+w096+4jJgvwMqm6CGL6b40UVt0Pcl0AoJXTszraSadB9zGk237+cHmpIhOBAE
3Zht0TVOjQmQimIGWbOToosn1CI7oTe0F2o8J33YoSGJ0Iluyya5ehUweRXpZsft
e2L4IlUAQn27xXuarDe2bOU7UW0jiC9BINH2dG62fEHQusP7lvRKjAhQdSC4w/tN
FvxOdDHOTf7Jf8UkXVLsW6KX7hAEOJD0CCRkGincIBMpApIYMq1xRQTyaksm6Y7d
KKPL4CnD
=qaU1
-----END PGP SIGNATURE-----

--nextPart2425690.2CP8zYR4Ni--
