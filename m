Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1ODCqi01906
	for <linux-lvm@redhat.com>; Tue, 24 Feb 2004 08:12:52 -0500
Received: from ms-smtp-03.nyroc.rr.com (ms-smtp-03.nyroc.rr.com [24.24.2.57])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1ODCqb05534
	for <linux-lvm@redhat.com>; Tue, 24 Feb 2004 08:12:52 -0500
Received: from dman13.dyndns.org (roc-66-66-61-253.rochester.rr.com [66.66.61.253])
	by ms-smtp-03.nyroc.rr.com (8.12.10/8.12.10) with ESMTP id i1ODCnlK004379
	for <linux-lvm@redhat.com>; Tue, 24 Feb 2004 08:12:50 -0500 (EST)
From: "Derrick 'dman' Hudson" <dman@dman13.dyndns.org>
Message-ID: <20040224131632.GA20556@dman13.dyndns.org>
References: <20040224031633.GA7431@dman13.dyndns.org> <20040224072602.GB23439@percy.comedia.it>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5vNYLRcllDrimb99"
Content-Disposition: inline
In-Reply-To: <20040224072602.GB23439@percy.comedia.it>
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
Date: Tue Feb 24 08:11:15 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--5vNYLRcllDrimb99
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2004 at 08:26:03AM +0100, Luca Berra wrote:
| On Mon, Feb 23, 2004 at 10:16:33PM -0500, Derrick 'dman' Hudson wrote:
| >The FAQ doesn't mention this hurdle.  I found that upgrading from
| >kernel 2.4.23+lvm1 to 2.4.23+lvm2 is really quite trivial
| >(particularly with debian - I didn't have to do anything).  However,
| >the 2.6 kernel won't boot because lvm can't find any volume groups.
| >I've tried 2.6.0, 2.6.2 and most recently 2.6.3.  In each case, the
| >device mapper (dm-mod) is loaded and /dev/mapper/control exists
| >(I'm using devfsd).  What did I miss?
|
| logs.

Hmm.  How can I get logs?  /var is an lvm lv, and since lvm isn't
working nothing can be written to /var/log.  (/usr and /home are also
on lvm, so when I try booting 2.6 all I have is /)  The output I get
=66rom running vgscan interactively is that no volume groups could be
found.  Likewise from pvscan and lvscan.  (if it would make a
difference, I can provide all the output, verbatim, later when I get
back to that machine's console)

-D

PS  Shame on me - I did forget to check /var/log/{messages,syslog} in
    the first place to see if they had any info.

--=20
If you want to know what God thinks about money,
just look at the people He gives it to.
    -- Old Irish Saying
=20
www: http://dman13.dyndns.org/~dman/            jabber: dman@dman13.dyndns.=
org

--5vNYLRcllDrimb99
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAO06wiB6vp1xAVUARAji0AKCXJeICmbc21e3MRklkZIowOfdLZACeI6ee
Fraws1g9xaoM4O6hCU/luvw=
=NY7c
-----END PGP SIGNATURE-----

--5vNYLRcllDrimb99--
