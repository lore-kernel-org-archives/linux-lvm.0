Received: from bmr.usersys.redhat.com (dhcp-1-199.fab.redhat.com [10.33.1.199])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q4IAPmr8002425
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 18 May 2012 06:25:50 -0400
Message-ID: <4FB623AC.9060900@redhat.com>
Date: Fri, 18 May 2012 11:25:48 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <CAGQjrKb6_HuVc2Ro8vnkMwEmHg-H4gJHJVf_Q5GVaZfSM1p7yA@mail.gmail.com>
	<20120517181350.2922a70b@bettercgi.com>
In-Reply-To: <20120517181350.2922a70b@bettercgi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvreduce nightmare
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
Hash: SHA1

On 05/18/2012 12:13 AM, Ray Morris wrote:
> Stop. Don't do anything else until you are sure of what to do next.
>  You will not lose data by studying. You can lose data by trying to
> fix it.
> 
>> resize2fs /dev/vg0/data 100G lvreduce -L -100G -n /dev/vg0/data*
> 
> A 100 GB filesystem needs a block device of around 110 GB.  So
> this cut off the end of your filesystem. (The device needs to hold
> the journal as well as the FS, for example.)

Not with most file systems. When you ask resize2fs to make a file
system 100G it will make it (within rounding limits) 100G's worth of
blocks in length. This is the actual space required on the disk (i.e.
the argument is the size of the file system image not the maximum free
space within it).

E.g.:

# lvcreate -L 100M -n l0 tvg0
  Logical volume "l0" created
# mke2fs -j /dev/tvg0/l0
mke2fs 1.41.9 (22-Aug-2009)
Filesystem label=
OS type: Linux
Block size=1024 (log=0)
Fragment size=1024 (log=0)
25688 inodes, 102400 blocks
[...]

102400 1024-byte blocks is exactly 100M (MiB to be pedantic).

Resize to 50M gives:

# resize2fs /dev/tvg0/l0 50M
resize2fs 1.41.9 (22-Aug-2009)
Resizing the filesystem on /dev/tvg0/l0 to 51200 (1k) blocks.
The filesystem on /dev/tvg0/l0 is now 51200 blocks long.

51200 1024 byte blocks is exactly 50MiB.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk+2I6wACgkQ6YSQoMYUY96SlACfTAzVIzeym6iM3fzGhsR0P9YK
iG8Amwfu9AwTnwHvCUddMdzhKxlW0uCA
=+ITm
-----END PGP SIGNATURE-----
