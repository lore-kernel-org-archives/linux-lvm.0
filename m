Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1P1k8i28922
	for <linux-lvm@redhat.com>; Tue, 24 Feb 2004 20:46:08 -0500
Received: from ms-smtp-03.nyroc.rr.com (ms-smtp-03.nyroc.rr.com [24.24.2.57])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1P1k8b27702
	for <linux-lvm@redhat.com>; Tue, 24 Feb 2004 20:46:08 -0500
Received: from dman13.dyndns.org (roc-66-66-61-253.rochester.rr.com [66.66.61.253])
	by ms-smtp-03.nyroc.rr.com (8.12.10/8.12.10) with ESMTP id i1P1k5lK028283
	for <linux-lvm@redhat.com>; Tue, 24 Feb 2004 20:46:05 -0500 (EST)
From: "Derrick 'dman' Hudson" <dman@dman13.dyndns.org>
Message-ID: <20040225014950.GA5519@dman13.dyndns.org>
References: <20040224031633.GA7431@dman13.dyndns.org> <20040224072602.GB23439@percy.comedia.it> <20040224131632.GA20556@dman13.dyndns.org> <20040224222521.GA31185@percy.comedia.it>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="EeQfGwPcQSOJBaQU"
Content-Disposition: inline
In-Reply-To: <20040224222521.GA31185@percy.comedia.it>
Subject: [linux-lvm] Re: upgrade from kernel 2.4 to 2.6
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Tue Feb 24 20:44:15 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--EeQfGwPcQSOJBaQU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2004 at 11:25:22PM +0100, Luca Berra wrote:
| On Tue, Feb 24, 2004 at 08:16:32AM -0500, Derrick 'dman' Hudson wrote:
| >| >(I'm using devfsd).  What did I miss?
| >| logs.
| >
| >Hmm.  How can I get logs?  /var is an lvm lv, and since lvm isn't
| >working nothing can be written to /var/log.  (/usr and /home are also
|
| look in /etc/lvm/lvm.conf
| there is a log section, you can make lvm log to a different file, so
| you can save and post logs from lvm activation commands.

Ok, I found that.

Here is the log file, in its entirety :

----
toollib.c:298 vgscan  No volume groups found
----

I did set verbosity=3D3 because the comments in lvm.conf said that is
the highest verbosity.

-D

--=20
Folly delights a man who lacks judgement,
but a man of understanding keeps a straight course.
        Proverbs 15:21
=20
www: http://dman13.dyndns.org/~dman/            jabber: dman@dman13.dyndns.=
org

--EeQfGwPcQSOJBaQU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAO/8+iB6vp1xAVUARAtE6AKCaaOH9wLhFzgi94bi1J8XrSCmcLgCdG4tF
D1DlhbvHVSlIxsb2r5WeBNo=
=2Urh
-----END PGP SIGNATURE-----

--EeQfGwPcQSOJBaQU--
