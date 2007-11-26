Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id lAQGwbef024047
	for <linux-lvm@redhat.com>; Mon, 26 Nov 2007 11:58:37 -0500
Message-ID: <474AFB3D.2010309@redhat.com>
Date: Mon, 26 Nov 2007 16:58:37 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Steps to "clone" a volume group
References: <47459DD3.5090901@redhat.com>
	<20071122160540.GA22843@agk.fab.redhat.com>
In-Reply-To: <20071122160540.GA22843@agk.fab.redhat.com>
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

Alasdair G Kergon wrote:
> Fine for testing, but if running this on a production system
> you should tweak this so that your machine remains bootable
> should it crash at any stage of the procedure.
> 
> On Thu, Nov 22, 2007 at 03:18:43PM +0000, Bryn M. Reeves wrote:
>> 1. Deactivate the VG
>  
> Not necessary if done as follows.

Thanks Alasdair!

I'll incorporate your fixes into the instructions and add them to the wiki.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHSvs96YSQoMYUY94RApYJAKDZ0fkcF2+IqS+w6iWER66BvXZ/zwCaA9tw
INz7sk+N8WuS8pNG9ZjnRxY=
=R5TP
-----END PGP SIGNATURE-----
