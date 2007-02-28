Received: from [10.32.64.203] (dhcp-0-203.surrey.redhat.com [10.32.64.203])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l1SIC0Mc002142
	for <linux-lvm@redhat.com>; Wed, 28 Feb 2007 18:12:00 GMT
Message-ID: <45E5C60E.5020801@redhat.com>
Date: Wed, 28 Feb 2007 18:12:30 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Help: Mount point does not report full size of LV.
References: <5d25729a0702281007p381e10fas464177acaa614dc2@mail.gmail.com>
In-Reply-To: <5d25729a0702281007p381e10fas464177acaa614dc2@mail.gmail.com>
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

Nick Gyma wrote:
> Thanks for the reply.  The other two disks are file system ext3.  Is it
> possible to change this 3rd disk to be ext3 as well from the current
> state i'm in?  and then resize to fill?
>  
> Thanks for helping.  here are the results of vgdisplay:  (the 208.31GB
> is correct)
>  

I'm not completely sure what you mean here, but generally if you want to
change a file system type you need to do a full backup of the old file
system then create the new one and restore.

It tends to be that the only "in place" conversion tools are to update
one version of a file system to a later one, e.g. ext2->ext3 or gfs1->gfs2.

Otoh, if the 208.31G is correct for your size you should be ready to
resize the NTFS file system on it.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFF5cYO6YSQoMYUY94RAnDEAJ96mrC5ze9RNkiYolW0ZCE1JQ/+kgCeOR2a
hOype56F942Z+/Ajj9va+Wk=
=K+3p
-----END PGP SIGNATURE-----
