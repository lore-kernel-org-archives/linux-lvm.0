Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA8Enlr08300
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 09:49:47 -0500
Received: from mail.fhbb.ch (smtp.fhbb.ch [193.222.241.18] (may be forged))
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iA8EnfN1020331
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 09:49:42 -0500
Date: Mon, 8 Nov 2004 15:49:07 +0100
From: Markus Wiedmer - FHBB <markus.wiedmer@stud.fhbb.ch>
Message-ID: <1535323208.20041108154907@stud.fhbb.ch>
Subject: Re: [linux-lvm] VGs not detected at startup
In-Reply-To: <20041108135339.GA5797@dragonhold.org>
References: <88707567.20041108091624@stud.fhbb.ch>
	<20041108094008.GA26201@goldfinger.local>
	<1489446547.20041108144631@stud.fhbb.ch>
	<20041108135339.GA5797@dragonhold.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha1"; boundary="----------C61B315131C087B2"
Reply-To: Markus Wiedmer - FHBB <markus.wiedmer@stud.fhbb.ch>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@spam.dragonhold.org
Cc: LVM general discussion and development <linux-lvm@redhat.com>

------------C61B315131C087B2
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

llsdo> On Mon, Nov 08, 2004 at 02:46:31PM +0100, Markus Wiedmer - FHBB wrot=
e:
>> I now found a work-around that seems to work so far. In the
>> LVM-Start-Script I just put "mount /dev/sda5 || true" before the vgscan.=
 it
>> looks like after a mount-command the system suddenly finds the VG.
>> strange...

llsdo> Apologies if this is something that's already been
llsdo> discussed (if so I missed it), and also
llsdo> for saying something that you've almost definitely covered but......

llsdo> Check to see if there's any autoloading of modules, or
llsdo> anything, going on as a result of the
llsdo> mount/fdisk?

llsdo> Also (instead of the mount) does a 'dd' work?  E.g. dd
llsdo> if=3D/dev/sda of=3D/dev/null bs=3D512
llsdo> count=3D1?

llsdo> That's going to be faster & probably less intrusive.

llsdo> Graham

thanks a lot for your hint. it really was a module (sd_mod) that was
not loaded at boottime. everything works now like a charm

thanks

markus



--=20
Mit freundlichen Gr=FCssen
Markus Wiedmer - FHBB
mailto:markus.wiedmer@stud.fhbb.ch


------------C61B315131C087B2
Content-Type: application/pgp-signature

-----BEGIN PGP MESSAGE-----
Version: PGP SDK 3.0.4
Comment: ""

iQA/AwUBQY+HY59eUGiOXF3kEQJwfACfaLfdOs2I2cmtS3SDYL791bNS3nAAoNhh
XcASckrm/q+L72T4XiAaXUKs
=8CrP
-----END PGP MESSAGE-----

------------C61B315131C087B2--
