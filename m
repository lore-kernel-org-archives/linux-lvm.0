Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m1DAb6dk010540
	for <linux-lvm@redhat.com>; Wed, 13 Feb 2008 05:37:06 -0500
Message-ID: <47B2C7FA.3020206@redhat.com>
Date: Wed, 13 Feb 2008 10:35:38 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvcreate problem
References: <b646832c0802130013x2081fe55y10f6e2c079134acf@mail.gmail.com>	<47B2AC45.6030901@redhat.com>	<b646832c0802130104i7d8eb37fkb61d49c5127f316b@mail.gmail.com>	<b646832c0802130106v3d7c6f6ene7475edc2c599fec@mail.gmail.com>	<47B2BF41.8070701@redhat.com>
	<b646832c0802130213l3b7eaaf5t1fa0246553904b07@mail.gmail.com>
In-Reply-To: <b646832c0802130213l3b7eaaf5t1fa0246553904b07@mail.gmail.com>
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

Yajith Ajantha Dayarathna | ????? ????? ??????? wrote:
> i will try the mapper device.
> yes, the partitioning scheme is quite inflexible.
> Does LVM use the same technique to get around this limitation ? I have
> seen devices getting created under /dev/mapper.
> Always thought its a part of LVM.

Yes, device-mapper is the kernel component that LVM2 uses to create
logical volumes so it can also support pretty much arbitrary numbers of
logical volumes (although LVs aren't normally partitioned unless you use
a tool like kpartx).

Device-mapper's also used by applications like multipath-tools, dmraid
and kpartx itself.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHssf66YSQoMYUY94RApWlAKDQzLnk3Z/WRBk0dWVBfpI+rUmgUQCglSWj
4txeSYQCaODkwWlyO8oP9Rw=
=QPO0
-----END PGP SIGNATURE-----
