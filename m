Received: from [127.0.0.1] (sebastian-int.corp.redhat.com [172.16.52.221])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kARKGFCw014110
	for <linux-lvm@redhat.com>; Mon, 27 Nov 2006 20:16:17 GMT
Message-ID: <456B47EB.50905@redhat.com>
Date: Mon, 27 Nov 2006 20:17:47 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2: vgcfgrestore lvm behavior
References: <889212.64055.qm@web31807.mail.mud.yahoo.com>
In-Reply-To: <889212.64055.qm@web31807.mail.mud.yahoo.com>
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

Gerry Reno wrote:
> Is there some undocumented syntax change for vgcfgrestore under LVM2?
> 
> According to the man page it should work the way I am using it.
> 
> ??:(
> 
> 

Hi Gerry,

Under LVM2, the --file option is only used when you are actually
restoring metadata. For example:

vgcfgrestore --file /tmp/vg0_backup.vg vg0

Would restore the vg0 volume group's metadata from /tmp/vg0_backup.vg.

Currently, -l and -ll will only look at the backups in the
/etc/lvm/archive directory.

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFFa0fq6YSQoMYUY94RAsPhAJ9xRBkcU5Z59zBBp7Vlk4F+9D/7KgCfb+0p
5VIEC7yyu5pglNZJQBWip/w=
=9L+j
-----END PGP SIGNATURE-----
