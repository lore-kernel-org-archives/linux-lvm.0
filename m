Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1Q3oW830251
	for <linux-lvm@redhat.com>; Wed, 25 Feb 2004 22:50:32 -0500
Received: from ms-smtp-03.nyroc.rr.com (ms-smtp-03.nyroc.rr.com [24.24.2.57])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1Q3oWb30161
	for <linux-lvm@redhat.com>; Wed, 25 Feb 2004 22:50:32 -0500
Received: from dman13.dyndns.org (roc-66-66-61-253.rochester.rr.com [66.66.61.253])
	by ms-smtp-03.nyroc.rr.com (8.12.10/8.12.10) with ESMTP id i1Q3oTlK021116
	for <linux-lvm@redhat.com>; Wed, 25 Feb 2004 22:50:29 -0500 (EST)
From: "Derrick 'dman' Hudson" <dman@dman13.dyndns.org>
Message-ID: <20040226035421.GA13065@dman13.dyndns.org>
References: <20040224031633.GA7431@dman13.dyndns.org> <20040224072602.GB23439@percy.comedia.it> <20040224131632.GA20556@dman13.dyndns.org> <20040224222521.GA31185@percy.comedia.it> <20040225014950.GA5519@dman13.dyndns.org> <20040225193630.GC15582@percy.comedia.it>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <20040225193630.GC15582@percy.comedia.it>
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
Date: Wed Feb 25 22:49:30 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 25, 2004 at 08:36:31PM +0100, Luca Berra wrote:
| On Tue, Feb 24, 2004 at 08:49:50PM -0500, Derrick 'dman' Hudson wrote:
| >On Tue, Feb 24, 2004 at 11:25:22PM +0100, Luca Berra wrote:
| >| look in /etc/lvm/lvm.conf
| >| there is a log section, you can make lvm log to a different file, so
| >| you can save and post logs from lvm activation commands.
| >
| >Ok, I found that.
| >
| >Here is the log file, in its entirety :
| >
| >----
| >toollib.c:298 vgscan  No volume groups found
| >----
| >
| >I did set verbosity=3D3 because the comments in lvm.conf said that is
| >the highest verbosity.
| try changing other parameters in the log {} section, eg 'level'

Ah, finally I find some real information in the log!  Thanks for your
patience.

---- booting with kernel 2.6.3
filters/filter-composite.c:22 vgscan  Using /dev/hdb
device/dev-io.c:315 vgscan  Opened /dev/hdb
label/label.c:174 vgscan  /dev/hdb: No label detected
device/dev-io.c:339 vgscan  Closed /dev/hdb
label/label.c:266 vgscan  <backtrace>
filters/filter-composite.c:22 vgscan  Using /dev/hdb1
device/dev-io.c:315 vgscan  Opened /dev/hdb1
label/label.c:174 vgscan  /dev/hdb1: No label detected
device/dev-io.c:339 vgscan  Closed /dev/hdb1
label/label.c:266 vgscan  <backtrace>
toollib.c:298 vgscan  No volume groups found
filters/filter-persistent.c:170 vgscan  Dumping persistent device cache to =
/etc/lvm/.cache
----

The label wasn't found.  I guess that's a good enough reason to not
find the vg.

---- kernel 2.4.23
filters/filter-composite.c:22 vgscan  Using /dev/hdb
device/dev-io.c:315 vgscan  Opened /dev/hdb
label/label.c:174 vgscan  /dev/hdb: No label detected
device/dev-io.c:339 vgscan  Closed /dev/hdb
label/label.c:266 vgscan  <backtrace>
filters/filter-composite.c:22 vgscan  Using /dev/hdb1
device/dev-io.c:315 vgscan  Opened /dev/hdb1
label/label.c:156 vgscan  /dev/hdb1: lvm2 label detected
device/dev-io.c:339 vgscan  Closed /dev/hdb1
device/dev-io.c:315 vgscan  Opened /dev/hdb1
device/dev-io.c:339 vgscan  Closed /dev/hdb1
filters/filter-persistent.c:209 vgscan  /dev/initrd: Skipping (cached)
locking/file_locking.c:154 vgscan  Locking /var/lock/lvm/V_MaxtorDisk RB
toollib.c:309 vgscan  Finding volume group "MaxtorDisk"
device/dev-io.c:315 vgscan  Opened /dev/hdb1
label/label.c:156 vgscan  /dev/hdb1: lvm2 label detected
format_text/format-text.c:279 vgscan  Read MaxtorDisk metadata (1) from /de=
v/hdb1 at 2560 size 1469
vgscan.c:41 vgscan  Found volume group "MaxtorDisk" using metadata type lvm2
locking/file_locking.c:51 vgscan  Unlocking /var/lock/lvm/V_MaxtorDisk
device/dev-io.c:339 vgscan  Closed /dev/hdb1
filters/filter-persistent.c:170 vgscan  Dumping persistent device cache to =
/etc/lvm/.cache
----

The second log continues to find the lvs and works there.


Any ideas as to why it doesn't find the lvm label with kernel 2.6?
What should I do to try correcting it?

TIA,
-D

--=20
Pride only breeds quarrels,
but wisdom is found in those who take advice.
        Proverbs 13:10
=20
www: http://dman13.dyndns.org/~dman/            jabber: dman@dman13.dyndns.=
org

--a8Wt8u1KmwUX3Y2C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAPW3siB6vp1xAVUARAiz4AJ4iQ2MvdikNB4PltJMNSIdAAD5G7QCfeQZ3
GYS+mKEzmpxnYHIWddBLXbc=
=KraR
-----END PGP SIGNATURE-----

--a8Wt8u1KmwUX3Y2C--
