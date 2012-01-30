Message-ID: <4F26CD7D.7030400@redhat.com>
Date: Mon, 30 Jan 2012 17:03:57 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <c7cbb6bbd7b1bb221f1939dc180f29cd.squirrel@webmail.harte-lyne.ca>
	<4F26BE81.7040608@redhat.com>
	<0e76b29210b181e84d1c5762f9c8f07d.squirrel@webmail.harte-lyne.ca>
	<4F26C5A4.1080907@redhat.com>
	<cde64fbe9152535e0ec43a48c7316917.squirrel@webmail.harte-lyne.ca>
In-Reply-To: <cde64fbe9152535e0ec43a48c7316917.squirrel@webmail.harte-lyne.ca>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Cannot delete lv
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
To: "James B. Byrne" <byrnejb@harte-lyne.ca>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 01/30/2012 04:50 PM, James B. Byrne wrote:
> [root@vhost01 ~]# lsblk NAME
> MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT .  .  . 
> &#9500;&#9472;vg_vhost01-lv_vm_base (dm-5) 253:5    0   7.8G  0
> lvm &#9474; &#9500;&#9472;vg_vhost01-lv_vm_basep1 (dm-17) 253:17
> 0   500M  0 dm &#9474; &#9492;&#9472;vg_vhost01-lv_vm_basep2
> (dm-18) 253:18   0   7.3G  0 dm
> 
> .  .  .
> 
> Am I misunderstanding your instructions?

The partition maps were apparently created with kpartx's "-p p" option
to force a partition separator of 'p' (the default is to use a 'p' if
the device name ends with a numeral but no separator otherwise).

If the maps were created with -pp kpartx will refuse to remove them if
the option is not given (but helpfully doesn't report any error.. :-/):

# ls /dev/mapper/vg_mother-lv_base*
/dev/mapper/vg_mother-lv_base  /dev/mapper/vg_mother-lv_basep1
# kpartx -d /dev/mapper/vg_mother-lv_base
# ls /dev/mapper/vg_mother-lv_base*
/dev/mapper/vg_mother-lv_base  /dev/mapper/vg_mother-lv_basep1
# kpartx -d -pp /dev/mapper/vg_mother-lv_base
# ls /dev/mapper/vg_mother-lv_base*
/dev/mapper/vg_mother-lv_base

Just add the -pp to your kpartx command lines and it should remove the
devices.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk8mzX0ACgkQ6YSQoMYUY96ySwCZATKsF6+UiQ1FKtwQK/4XX2uP
G20AniKYezGGkZreHCvp0onymhIpXp8M
=tTC2
-----END PGP SIGNATURE-----
