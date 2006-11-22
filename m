Received: from [127.0.0.1] (sebastian-int.corp.redhat.com [172.16.52.221])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kAMN8Yo2009067
	for <linux-lvm@redhat.com>; Wed, 22 Nov 2006 23:08:35 GMT
Message-ID: <4564D8CC.7050705@redhat.com>
Date: Wed, 22 Nov 2006 23:10:04 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Big question ...
References: <200611222304.28368.martial.paupe@nagra.com>	<4564CF3F.1060009@redhat.com>
	<200611222343.16722.martial.paupe@nagra.com>
In-Reply-To: <200611222343.16722.martial.paupe@nagra.com>
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

Martial Paupe wrote:
> Hello Bryn,
> 
> On Wednesday 22 November 2006 23:29, Bryn M. Reeves wrote:
> I think that you speak about LVM2. I use RHES 3.5 and the version of lvm are 
> lvm-1.0.8-14.
> 

Yes, I was referring to LVM2. LVM1 doesn't have the --removemissing flag
to vgreduce.

By default LVM1 should make a backup of the volume group metadata before
the vgextend command adds a new PV- it's worth checking /etc/lvmconf to
see if you can restore the old metadata.

Use vgcfgrestore -f <file> -n <vgname> -ll to see the physical & logical
volumes in the backups and restore from the last good one (only the
metadata is restored - data in the LVs remains unchanged).

See the man page for vgcfgbackup/vgcfgrestore for more details.

Regards,

Bryn.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFFZNjM6YSQoMYUY94RAl+BAJ9Uk4x6vBPyd3t/yNRn5dsKF1+DSQCg1n4r
LV8bL4p55bumwzSbmQXunok=
=RPre
-----END PGP SIGNATURE-----
