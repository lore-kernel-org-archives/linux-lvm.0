Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB7LOvOv021154
	for <linux-lvm@redhat.com>; Sun, 7 Dec 2014 16:24:57 -0500
Received: from cdptpa-oedge-vip.email.rr.com
	(cdptpa-outbound-snat.email.rr.com [107.14.166.230])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB7LOu1H026089
	for <linux-lvm@redhat.com>; Sun, 7 Dec 2014 16:24:56 -0500
Message-ID: <5484C5A7.8080601@ubuntu.com>
Date: Sun, 07 Dec 2014 16:24:55 -0500
From: Phillip Susi <psusi@ubuntu.com>
MIME-Version: 1.0
References: <5480E939.3070702@ubuntu.com>
	<CADxRZqxjvrp3MhW4rAxaBvxeJ7qev=KE=0H92rNcKGBAD1VMaA@mail.gmail.com>
In-Reply-To: <CADxRZqxjvrp3MhW4rAxaBvxeJ7qev=KE=0H92rNcKGBAD1VMaA@mail.gmail.com>
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

On 12/05/2014 05:12 AM, Anatoly Pugachev wrote:
> Phillip,
> 
> can you please paste the commands you've used to convert the
> volume? I don't have ubuntu , but rhel7 manual page for lvconvert,
> example section is pretty clear on how to convert back to flat
> (-m0) volume and what physical device you remove from logical
> volume, quote:
> 
> 
> Converts mirror logical volume "vg00/lvmirror1" to linear, freeing 
> physical extents from /dev/sda:
> 
> lvconvert -m0 vg00/lvmirror1 /dev/sda

I simply used lvconvert -m0 vg/lv.  I did not think I would need to
specify which leg should be kept; obviously it should be the one
currently in use rather than the out of date copy.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBCgAGBQJUhMWnAAoJENRVrw2cjl5RVKMH/3j5a4RMudXELHbEn5JpGs2r
I9UY+ioN1OZC25FpUkopP1C6agpjX3ZoLduPgLekigHmTQZk6YvnpTsxC81dSQJD
9wK9n4fzuUA0mDu6fBruiAZ0pJFzQ8PE/3uQBDNH0Be61NsBALlNSaoy7QzsdsOe
/v1GlWLVqOMftTIhtmg6p8MIa3f8zegdSsL6YsGr06F9uqZxQgKq8RwZi/YYmbHc
GAeWGl8QUZCjRvnOIFsS/UTt+JcDufTCk/p22QWPB18iWLIwnuuecE5dbA7KgT56
H5ct150LBLlGdjhzBEUT/dK00II1eMDOUAuaucr8j4jOJYM6GEZ1VsdX4hp1M4w=
=F78H
-----END PGP SIGNATURE-----
