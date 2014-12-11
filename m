Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sBB1GVid028407
	for <linux-lvm@redhat.com>; Wed, 10 Dec 2014 20:16:32 -0500
Received: from cdptpa-oedge-vip.email.rr.com
	(cdptpa-outbound-snat.email.rr.com [107.14.166.227])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sBB1GTQU005696
	for <linux-lvm@redhat.com>; Wed, 10 Dec 2014 20:16:30 -0500
Message-ID: <5488F06C.3010806@ubuntu.com>
Date: Wed, 10 Dec 2014 20:16:28 -0500
From: Phillip Susi <psusi@ubuntu.com>
MIME-Version: 1.0
References: <5480E939.3070702@ubuntu.com>	<CADxRZqxjvrp3MhW4rAxaBvxeJ7qev=KE=0H92rNcKGBAD1VMaA@mail.gmail.com>	<5484C5A7.8080601@ubuntu.com>
	<CADxRZqyi7Ybowtm8YXErwZY7o3NjSi7XELBSnp8xk0mKo4vOOw@mail.gmail.com>
In-Reply-To: <CADxRZqyi7Ybowtm8YXErwZY7o3NjSi7XELBSnp8xk0mKo4vOOw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Raid1 -> linear conversion = destroyed data
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

On 12/08/2014 03:30 AM, Anatoly Pugachev wrote:
> I wonder how many more people would lost their data before there
> would be changes to lvconvert -m0 to require specification of
> physicalVolume instead of optional requirement.

It should not be required.  As long as both legs are in sync, it
doesn't matter which one is kept and which one is dropped.  When one
is intentionally out of sync because it has been removed with
- --splitmirrors, then under no circumstances should that one be kept.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBCgAGBQJUiPBsAAoJENRVrw2cjl5RDDkH/i6qgKx11L/bb2rVIPGeHTdW
r9yaFegoRvLX0I7+Otrty+VmCjm1giwlDkQ3jBdj8+O+Kija9vyeWFAXwnDkkgQ/
G2cCf3tmPfiua+d+BQD6cej5rVvLBBj6evcl3nu73vVKJLgji8NiPyj/x16vj/og
8z1mTxG1Obrhagk+NLe2WXAX5GWUZOYD0bBS0pV6P/dPZKJrHNhaoVB2fAadj1n7
sW4M3Ew6K9eybahhtMBffLWRG4hVqkbTdOCC6cCgCH9wDdDzhqC/Mm+WORo3t8az
/fhjCNvGIkdOn6Itl6sZMhc91XL748qJUUAZK8JxriFVL6RrfSJ2PmBdDKzyziI=
=GpNN
-----END PGP SIGNATURE-----
