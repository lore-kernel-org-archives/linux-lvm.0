Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q739v7h1029135
	for <linux-lvm@redhat.com>; Fri, 3 Aug 2012 05:57:07 -0400
Received: from v041420.home.net.pl (v041420.home.net.pl [89.161.211.18])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id q739v3v2003027
	for <linux-lvm@redhat.com>; Fri, 3 Aug 2012 05:57:04 -0400
From: Hubert Kario <hubert@kario.pl>
Date: Fri, 03 Aug 2012 11:56:50 +0200
Message-ID: <2880362.MGFE1dnqg0@bursa22>
In-Reply-To: <20120802015017.GH11876@agk-dp.fab.redhat.com>
References: <1912398.2IYGSI2Xbi@bursa22> <2392219.d0OTJVWRfz@bursa22>
	<20120802015017.GH11876@agk-dp.fab.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4438047.9UKQEsTVuo";
	micalg="pgp-sha1"; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7Bit
Subject: Re: [linux-lvm] [lvm2cmd] Heap destruction by lvm2_exit()?
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
To: Alasdair G Kergon <agk@redhat.com>
Cc: linux-lvm@redhat.com


--nextPart4438047.9UKQEsTVuo
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 02 of August 2012 02:50:17 Alasdair G Kergon wrote:
> Another factor might be different contents in your lvm.conf file compared
> with mine, or different devices present causing you to hit a problem code
> path and me not to.
> 
> Or some other difference in the distribution/compiler/libraries etc.

Interesting, I've tried to run the second test application on debian squeeze 
(stable) and it worked so this could be a regression...

It works with 
lvm2 2.02.66
gcc 4.4.5
glibc 2.13

While it doesn't with
lvm2 2.02.96-2
gcc 4.7.1-1
glibc 2.15

Regards,
-- 
Hubert Kario
hubert@kario.pl     kario@wit.edu.pl    https://hubert.kario.pl
PGP: 30D7 71F5 2F6F B157 872C  D811 A1D0 6BC9 8956 DCFE
--nextPart4438047.9UKQEsTVuo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAABAgAGBQJQG6BmAAoJEKHQa8mJVtz+TecP/iuruFCVFs2dXlcqx305M4sv
8gCOHmjXvNtAQu4t4WHlQ4cJVX3K3Bq1G4IynWdPTYImUEgexpCR9VMzqW2xIY+C
3s8zcktX3AqGFlAiCA9AsiQUFVpM6ry59aUUIvJhtxmtRYvKoSZCafnVB0tIRcAs
3vHcvgwaAg7hdJs1IrjeQPz5O6OWyrHjR74xn+IwAD9bOAm0YXYTgIDaeTtYw6xD
CGAWbwoEck0NqlDRlF/bQlMhCoXMpFqd8YUsjuOCMK2Mq3IiHDz/19SIue9louYM
jGVksbVX+U2dV8NUhMHmdAXDWs+cc0sJ3eHeFb9muF0YYlpbP/ZBWXchPrGuRoZh
rB2uhkoSkxXOk+JFfBNmP3dCUWS6AEuocA4wYYchipagUn3KOGmOQHJvS3FvAG4G
8oJXkgyBTWKJLr9HknXAfnUds+f/soaU9wHMX6bwoRv4TeI1N+FbXSdXhpgKsJI1
eU3+xU9R+Afj/uO4wcn5T98iupWcI21rl6aXeUHSgr3G0w5UeuOsd7uoTpXdOQhi
PBDw4rf70+8VAV03mMcYLxoVq4foOHXKtp54Gaw7l6qoz09g/qby5lDq/On0u0kY
4Glq8xb1iWbKWTWVft/IYqlMxk45RiUMpScQXCI1t/SqvjZl8yqHra6l0pJSj6j2
E2OruSgeSs5zuhemDxoz
=ZV7k
-----END PGP SIGNATURE-----

--nextPart4438047.9UKQEsTVuo--
