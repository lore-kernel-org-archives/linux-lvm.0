Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8T9BwZM005055
	for <linux-lvm@redhat.com>; Mon, 29 Sep 2008 05:11:59 -0400
Received: from thunderbird6.fab.redhat.com (vpn-10-10.bos.redhat.com
	[10.16.10.10])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m8T9BuLK020888
	for <linux-lvm@redhat.com>; Mon, 29 Sep 2008 05:11:57 -0400
Message-ID: <48E09B18.6030908@redhat.com>
Date: Mon, 29 Sep 2008 10:08:40 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm over loop device
References: <db00b3d70809260504j1754c205v9044f069c37e2c24@mail.gmail.com>
In-Reply-To: <db00b3d70809260504j1754c205v9044f069c37e2c24@mail.gmail.com>
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

geert Geurts wrote:
> So what I did first create a LVM partition of 1MB on a memorystick and then 
> change the if of dd to point to the LVM partition, I'm now able to pvcreate 
> /dev/loop0, vgcreate SmallDisk /dev/loop0.
> But I'm unable to create a logical volume in the SmallDisk group...
> what am I doing wrong here? is it even possible if not why?

Hi Geert,

What was the error you were getting at this point? If possible, can you
use a service like pastebin.com to post the complete output of "lvcreate
- -vvv" with the options you're using for the SmallDisk VG. That should
give enough detail to have some idea where it's failing.

I think the idea is reasonable enough although you'll probably need to
do some fiddling around to get the size/number of the gmailfs volumes
right to give good performance.

Snapshots could definitely work here but I think it might be a bit
tricky without some of the patches that are currently outstanding for
device-mapper, esp. Mikulas' snapshot merging patches which you'd need
to "restore" one of the COW areas. See the thread here:

http://kerneltrap.org/Linux/LVM_Snapshot_Merging

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iEYEARECAAYFAkjgmxgACgkQ6YSQoMYUY96LegCcCHPZNLfhTUjIrsLiJcgROTDV
+SwAoLFQDiGpkZl5tpEFW5hjFH+6OuAj
=i+W8
-----END PGP SIGNATURE-----
