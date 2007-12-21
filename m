Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id lBLG092g000886
	for <linux-lvm@redhat.com>; Fri, 21 Dec 2007 11:00:09 -0500
Message-ID: <476BE309.1040604@redhat.com>
Date: Fri, 21 Dec 2007 16:00:09 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] how to access partitioned logical volumes?
References: <476BE284.8060800@wpkg.org>
In-Reply-To: <476BE284.8060800@wpkg.org>
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

Tomasz Chmielewski wrote:
> I have a server which uses LVM2 and "exports" these volume using iSCSI.
> 
> On iSCSI initiators, I can use those "exported" volumes, including
> partitions, just fine:

man kpartx

Cheers,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHa+MJ6YSQoMYUY94RAgnFAKDesmwLwDJ/BOtJkWIsaOd/+p3UZQCeI3er
P92PNwjYhFsvWR3zZRxWErk=
=+Fdx
-----END PGP SIGNATURE-----
