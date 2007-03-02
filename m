Received: from [10.32.64.203] (dhcp-0-203.surrey.redhat.com [10.32.64.203])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l22BwBcO013657
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2007 11:58:11 GMT
Message-ID: <45E81174.206@redhat.com>
Date: Fri, 02 Mar 2007 11:58:44 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] moving logical volumes to another system *remotely*
	-	how?
References: <45DED477.8040809@wpkg.org>	<20070223124452.GB22388@homer.panici.net>	<45DF0F5B.6000506@wpkg.org>	<20070223173220.GD9124@soda.linbit>
	<45E80D9A.6050409@wpkg.org>
In-Reply-To: <45E80D9A.6050409@wpkg.org>
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
> The kernel oopsed after I created a snapshot, made it full
> (invalidated), and tried to remove it.
> The kernel I used was 2.6.17.8 running on Debian-ARM:
> 

<snip>

> # dmesg
> Unable to handle kernel paging request at virtual address 31376632
> pgd = 8cce8000
> [31376632] *pgd=00000000
> Internal error: Oops: f3 [#1]
> Modules linked in: iscsi_trgt bonding dm_snapshot dm_mirror loop
> CPU: 0

<snip>

> [<7f00bba0>] (exit_exception_table+0x0/0x70 [dm_snapshot]) from
> [<7f00bcb0>] (snapshot_dtr+0xa0/0xf4 [dm_snapshot])
> [<7f00bc10>] (snapshot_dtr+0x0/0xf4 [dm_snapshot]) from [<8016791c>]
> (dm_table_put+0x80/0xe4)

This is a known issue in older kernels that was fixed upstream in
2.6.19. See:

http://www.uwsg.iu.edu/hypermail/linux/kernel/0612.1/2301.html
https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=204791

Kind regards,

Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFF6BF06YSQoMYUY94RAtZBAKC0+h3dCuTXr6lZ5M2eNfCfF8CPBgCgqMpY
rQV9Bm+kHTBVRQoSDdUH7Nw=
=oa4U
-----END PGP SIGNATURE-----
