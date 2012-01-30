Message-ID: <4F26C5A4.1080907@redhat.com>
Date: Mon, 30 Jan 2012 16:30:28 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <c7cbb6bbd7b1bb221f1939dc180f29cd.squirrel@webmail.harte-lyne.ca>
	<4F26BE81.7040608@redhat.com>
	<0e76b29210b181e84d1c5762f9c8f07d.squirrel@webmail.harte-lyne.ca>
In-Reply-To: <0e76b29210b181e84d1c5762f9c8f07d.squirrel@webmail.harte-lyne.ca>
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

On 01/30/2012 04:25 PM, James B. Byrne wrote:
> At this point I could use a little more guidance.  I wish to remove
> all the lvs associated with the following defunct vm guests:
> 
> base  <--- guest name vg_vhost01-lv_vm_base (dm-5) 
> vg_vhost01-lv_vm_basep1 (dm-17) vg_vhost01-lv_vm_basep2 (dm-18)
> 
> pas.harte--lyne.ca  <--- guest name 
> vg_vhost01-lv_vm_pas.harte--lyne.ca (dm-12) 
> vg_vhost01-lv_vm_pas.harte--lyne.cap1 (dm-15) 
> vg_vhost01-lv_vm_pas.harte--lyne.cap2 (dm-16) 
> vg_vhost01-lv_vm_pas.harte--lyne.ca_01 (dm-13) 
> vg_vhost01-lv_vm_pas.harte--lyne.ca_01p1 (dm-14)
> 
> pgsql--dbms.harte--lyne.ca  <--- guest name 
> vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_00 (dm-6) 
> vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_00p1 (dm-10) 
> vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_00p2 (dm-11) 
> vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_01 (dm-7) 
> vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_01p1 (dm-9)

These LVs all have active kpartx mappings (the names with pN
suffixes). Remove them with kpartx -d:

# kpartx -d /dev/mapper/vg_vhost01-lv_vm_base
# kpartx -d /dev/mapper/vg_vhost01-lv_vm_pas.harte--lyne.ca
# kpartx -d /dev/mapper/vg_vhost01-lv_vm_pas.harte--lyne.ca_01
# kpartx -d /dev/mapper/vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_00
# kpartx -d /dev/mapper/vg_vhost01-lv_vm_pgsql--dbms.harte--lyne.ca_01

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk8mxaQACgkQ6YSQoMYUY957KACg3LuLaueEx2NDBUDyLe5vVILR
d3cAn0+qhBcPlYaEz73d2gywKHPzu5kZ
=Oi4S
-----END PGP SIGNATURE-----
