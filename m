Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i26G3o809328
	for <linux-lvm@redhat.com>; Sat, 6 Mar 2004 11:03:50 -0500
Received: from ms-smtp-02.nyroc.rr.com (ms-smtp-02.nyroc.rr.com [24.24.2.56])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i26G3ob23323
	for <linux-lvm@redhat.com>; Sat, 6 Mar 2004 11:03:50 -0500
Received: from dman13.dyndns.org (roc-66-66-61-253.rochester.rr.com [66.66.61.253])
	by ms-smtp-02.nyroc.rr.com (8.12.10/8.12.10) with ESMTP id i26G3lhm000570
	for <linux-lvm@redhat.com>; Sat, 6 Mar 2004 11:03:47 -0500 (EST)
From: "Derrick 'dman' Hudson" <dman@dman13.dyndns.org>
Message-ID: <20040306160844.GA12844@dman13.dyndns.org>
References: <20040224031633.GA7431@dman13.dyndns.org> <20040224072602.GB23439@percy.comedia.it> <20040224131632.GA20556@dman13.dyndns.org> <20040224222521.GA31185@percy.comedia.it> <20040225014950.GA5519@dman13.dyndns.org> <20040225193630.GC15582@percy.comedia.it> <20040226035421.GA13065@dman13.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
In-Reply-To: <20040226035421.GA13065@dman13.dyndns.org>
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
Date: Sat Mar  6 11:02:00 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2004 at 10:54:21PM -0500, Derrick 'dman' Hudson wrote:

[upgrading from 2.4+lvm2 to 2.6+lvm2, vg isn't found, boot fails]

| ---- booting with kernel 2.6.3
| filters/filter-composite.c:22 vgscan  Using /dev/hdb1
| device/dev-io.c:315 vgscan  Opened /dev/hdb1
| label/label.c:174 vgscan  /dev/hdb1: No label detected
| device/dev-io.c:339 vgscan  Closed /dev/hdb1
| label/label.c:266 vgscan  <backtrace>
| toollib.c:298 vgscan  No volume groups found
| ----

| Any ideas as to why it doesn't find the lvm label with kernel 2.6?
| What should I do to try correcting it?

Well, I blasted the disk and started over using 2.6 from the beginning
this time.  That really shouldn't be necessary.  Whatever.  I have
that machine working now.

-D

--=20
You have heard the saying that if you put a thousand monkeys in a room with=
 a
thousand typewriters and waited long enough, eventually you would have a ro=
om
full of dead monkeys.
                                (Scott Adams - The Dilbert principle)
=20
www: http://dman13.dyndns.org/~dman/            jabber: dman@dman13.dyndns.=
org

--nFreZHaLTZJo0R7j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFASfeMiB6vp1xAVUARAtt1AJ0TGuUACphvPE7kOriLyUoea9rxwACghXvu
Q6AbxNe3VzCVSTX6qsIsyqk=
=6/pL
-----END PGP SIGNATURE-----

--nFreZHaLTZJo0R7j--
