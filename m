From: Dennis Schridde <devurandom@gmx.net>
Date: Mon, 04 Jun 2018 13:50:46 +0200
Message-ID: <2010899.yIpkChuX4T@monk>
In-Reply-To: <deebd997-6278-e2a3-7b9f-3c3c58a56a51@redhat.com>
References: <1973783.dFIIZJkBNM@monk> <2230803.usHgyXdh9J@monk>
	<deebd997-6278-e2a3-7b9f-3c3c58a56a51@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1682112.51fKDhSaOO";
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

--nextPart1682112.51fKDhSaOO
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello!

On Tuesday, 15 May 2018 13:15:55 CEST Zdenek Kabelac wrote:
> To get direct access to metadata - you could use your latest lvm2 2.02.177
> build (or even 'git master'). In these recent versions there is added
> support to activate directly these 'subLVs'.  So with latest lvm2 you can:
> 
> lvchange -ay  vg/lv_cmeta

This command was only successful in LVM 2.02.178-rc1, but failed in 2.02.177.

> and then you can capture content of this LV via 'dd' into file
> and compress and attach 'xz' compressed to BZ.

I created a report in bugzilla [4], but since the `cache_cmeta` LV appears to 
contain parts of my personal files, I cannot attach it.  However, I gained 
access to the metadata LV now and would be able to provide you access to 
certain specific parts of it, if requested.

My goal is still to gain access to as much of the data as possible.

--Dennis

[4]: https://bugzilla.redhat.com/show_bug.cgi?id=1585670
--nextPart1682112.51fKDhSaOO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQGzBAABCAAdFiEE0Ngi/nirHnbsz3NFz+h/M161qdwFAlsVJ5YACgkQz+h/M161
qdxEbAv/dieICMcnADUH5PqOqQ5tYOz24ni603YFcmgsi39LvGKMHNSIxxlrXqeG
sNVbbWEauUp//mDvat6Z0DLCg3rJV2Id0s0stMFhTU6xxPpmDv47zrvKeMTZj8rU
H7/LZI/A1TZi9Po7nOQgqbI7aCIpm7P6xnmiI6Efv5HsGQxER6dRMb8fE/YWc12o
3vdE456rZOxBGHhDvsAzunC+fadhIZpt2VrpvIVPsVs6ksadBfBJFOvl9WplnEI1
HngHAPdnS2/Upi5hPCsnOpCpPU6RCBS8VUtnvGvF32YGs/BFqiwmOqowMoDSjuWy
i7KQ+LWs9mJb3qEDaPA/7QZ0GAfqe1ZJmod8enMJh1LbyXvocGkrN4I22gV2bsoV
+u5WHXjkRnRMmLrft7R6Hia7RbNbMYq9RP4KAkaJRDUC2py9cRgG6P1TCbiWFxfs
d3TmNIe+dU+rP+eAriSaUXcHRbSBcGvihu+qlHtpPKA/sFhYaXPuQgXn4pKw28kb
N/0cTvL6
=DLah
-----END PGP SIGNATURE-----

--nextPart1682112.51fKDhSaOO--
