Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA8Dl5r21619
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 08:47:05 -0500
Received: from mail.fhbb.ch (mail.fhbb.ch [193.222.241.18])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iA8DkvZO000373
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 08:47:03 -0500
Date: Mon, 8 Nov 2004 14:46:31 +0100
From: Markus Wiedmer - FHBB <markus.wiedmer@stud.fhbb.ch>
Message-ID: <1489446547.20041108144631@stud.fhbb.ch>
Subject: Re: [linux-lvm] VGs not detected at startup
In-Reply-To: <20041108094008.GA26201@goldfinger.local>
References: <88707567.20041108091624@stud.fhbb.ch>
	<20041108094008.GA26201@goldfinger.local>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg="pgp-sha1"; boundary="----------2C019411F849F"
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
To: "David S." <dgs@gs.washington.edu>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

------------2C019411F849F
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

I'd be happy if this would work with me. Unfortunately a few seconds
(even an hour) will do nothing with my system. the VGs are still
unavailable.

I now found a work-around that seems to work so far. In the
LVM-Start-Script I just put "mount /dev/sda5 || true" before the vgscan. it
looks like after a mount-command the system suddenly finds the VG.
strange...

markus

DS> Yes, I certainly know this problem.  I'm running LVM2 2.00.15 and device
DS> mapper 1.00.17 on a 2.6.9 (x86) kernel.  'Vgscan' fails to find an vlou=
mes
DS> running from the system initialization script, but works fine a few sec=
onds
DS> (I'm guessing) later run from 'rc.local'.  I've tried a few things to "=
fix"
DS> this, all to no effect.

DS> David S.


------------2C019411F849F
Content-Type: application/pgp-signature

-----BEGIN PGP MESSAGE-----
Version: PGP SDK 3.0.4
Comment: ""

iQA/AwUBQY94t59eUGiOXF3kEQIXXQCfUvmRWwWxco4VVlYk1yNmIAlxX/QAn3SK
lQqZtAFANMG8uPQ2Dbd9yIrV
=/9ci
-----END PGP MESSAGE-----

------------2C019411F849F--
