Message-ID: <4C4D4B47.8000201@redhat.com>
Date: Mon, 26 Jul 2010 09:45:59 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <1279942095.12963.1386480183@webmail.messagingengine.com>
In-Reply-To: <1279942095.12963.1386480183@webmail.messagingengine.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Disk Partitioning tools, GUI preferably- best for
 LVM Logical Volume Management ; jor
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
Cc: giovanni_re <john_re@fastmail.us>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 07/24/2010 04:28 AM, giovanni_re wrote:
> So, I've got that big LV 4th partition, with empty space (2TB drive),
> and now I want to create some more linux partitions so I can install
> some other distros.

I'm a bit confused by your requirements. Are the other distros going to
be installed as virtual machines (e.g. using KVM/Xen etc) or are you
planning to boot them on "bare metal"?

If you want VMs then partitioning an LV makes sense. You present the
entire LV as a virtual disk to the guest and the emulated devices appear
to that OS as a regular partitioned disk. This is a very common technique.

If you want to boot these directly on the hardware however you might
want to reconsider your approach. Partitioned LVs are not supported
out-of-the box by any distro that I know of. I think you would need to
mess around with custom boot scripts to get the system to boot properly
and you'll probably need to do some special tricks to get a standard
distro installer to install onto these partitioned LVs. You would also
need to figure out a way of sharing a /boot partition (on the physical
disk) between all the installed distributions to avoid conflicts since
PC BIOS boot support does not handle LVM devices.

If this is your goal then you might find it easier to allocate a single
LV to each new installation and use that directly. With a bit of fancy
footwork in grub (and as long as each distro supports installation to an
existing LVM2 volume group) I think this should work and would be easier
and simpler to set up.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org/

iEYEARECAAYFAkxNS0YACgkQ6YSQoMYUY94KLgCdFDxsO14zg5EJAxCjeKu9za9a
V8AAoNiNptjcwNnzwKGGQpnNP735W/nX
=wioh
-----END PGP SIGNATURE-----
