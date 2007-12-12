Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id lBCFLqmF029004
	for <linux-lvm@redhat.com>; Wed, 12 Dec 2007 10:21:52 -0500
Message-ID: <475FFC90.6050903@redhat.com>
Date: Wed, 12 Dec 2007 15:21:52 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Inconsistent VG
References: <5485940d0712120657t54d848a0l5f40bdc209ce2d6a@mail.gmail.com>
In-Reply-To: <5485940d0712120657t54d848a0l5f40bdc209ce2d6a@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

C'est Pierre wrote:
> Does someone have any guesses?
> Aside from that, we've checked from the lvm/archive/vgdw2_* files. The
> recent-most, doesn't include lvol4. We've managed to pull the "lvol4 {
> }" part from an older file and confirmed all pv's in the segment
> definitions existed in the destination, but it didn't help either.

You need to find a version of the metadata that's consistent & contains
the LV that has gone "missing", then restore that using vgcfgrestore.

You should also probably look at the metadata backups for lines that
begin "description = ", as these contain the command that was run at the
time the archive was created. If your LV disappeared at some point in
the past there is a good chance this will tell you when & why.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHX/yQ6YSQoMYUY94RAvdEAJ97ITMjN9hFbzRWLMTc2DG0SfNzuACfW3MC
lTlIEpTQZgM4NcS978osQLM=
=oF9U
-----END PGP SIGNATURE-----
