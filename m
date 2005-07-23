Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j6NFKjUJ020553
	for <linux-lvm@redhat.com>; Sat, 23 Jul 2005 16:20:45 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DwLnx-0001ta-3e
	for linux-lvm@redhat.com; Sat, 23 Jul 2005 16:20:45 +0100
Date: Sat, 23 Jul 2005 16:20:45 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM / File descriptor .. left open / Snapshot-Problems
Message-ID: <20050723152045.GH23710@agk.surrey.redhat.com>
References: <200507231644.26202.Juergen.Vollmer@informatik-vollmer.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <200507231644.26202.Juergen.Vollmer@informatik-vollmer.de>
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Jul 23, 2005 at 04:44:22PM +0200, Dr. J=EF=BF=BDrgen Vollmer wrote:
> This is reproducable.
> If I wait long enough (some 10 minutes) everything seems to work again.

Add one or more -v options to the lvm commands to see more details.
Run 'dmsetup info -c' and 'ls -l /sys/block/dm*' between lvm commands=20
to check the changes have taken place.
Is there much or any I/O happening on the snapshotted device while you do t=
his?
Does adding 'sync' in between commands make any difference?
=20
Alasdair
--=20
agk@redhat.com
