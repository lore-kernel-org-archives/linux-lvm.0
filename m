Received: from [10.33.1.214] (dhcp-1-214.fab.redhat.com [10.33.1.214])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l4LFidnp013544
	for <linux-lvm@redhat.com>; Mon, 21 May 2007 11:44:39 -0400
Message-ID: <4651BE67.2070105@redhat.com>
Date: Mon, 21 May 2007 16:44:39 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Disk /dev/dm-0 doesn't contain a valid partition table
References: <352095.69660.qm@web38204.mail.mud.yahoo.com>
In-Reply-To: <352095.69660.qm@web38204.mail.mud.yahoo.com>
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

Sean McGlynn wrote:
> Bryn,
>  
> Thank you for taking the time to reply.
>  
> I'm glad to see this is not an issue. 
>  
> As for "dev253," if I only have three physical devices, why four dm entries?
>  
> Thanks again.
> 

The "dev253" entries are the logical volumes (or other device-mapper
devices), not the physical devices themselves.

I see you have three PVs in the volume group (sda1, sdb2 & sdc1), but
how many LVs do you have in your volume group?

Just post the output of the "lvs" command if you're unsure.

Kind regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGUb5n6YSQoMYUY94RAomyAKDAbKh46jVdf/rnfjPrx8deodF4tQCZAWJj
aBE96ivGnSiu1/X1lNX4QIM=
=Tvod
-----END PGP SIGNATURE-----
