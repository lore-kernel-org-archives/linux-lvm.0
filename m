Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l9H8Oqxm028642
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 04:24:52 -0400
Message-ID: <4715C663.5010803@redhat.com>
Date: Wed, 17 Oct 2007 09:22:59 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] cluster LVM
References: <4714C8C6.7060204@cesca.es> <4715C594.4010406@redhat.com>
In-Reply-To: <4715C594.4010406@redhat.com>
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

Patrick Caulfield wrote:
> Jordi Prats wrote:
>> Hi all,
>> I've been googling for a while but I found nothing about the current
>> limitations of CLVM. Someone told me that you must use just one logical
>> volume for each volume group. Is that true?
> 
> No, you can have as many LVs in a VG as you like.

I think Jordi's referring to the HA-LVM agents in rgmanager, which do
(did?) require that each VG contain only a single LV in order to
guarantee metadata consistency when a HA-LVM resource is relocated
within the cluster.

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHFcZj6YSQoMYUY94RAq4vAJ9tXKh6xz7slxR+6rF8hR0HQPa32QCdED1m
rrWCvxKZVcSctaT2zPdhwXU=
=W87k
-----END PGP SIGNATURE-----
