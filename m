From: Thomas Bader <thomasb@trash.net>
Subject: Re: [linux-lvm] Does LVM compile on Sparc64?
Message-ID: <20011214224027.A122@trash.net>
References: <20011214185558.A11845@trash.net> <20011214191520.GA19114@tykepenguin.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20011214191520.GA19114@tykepenguin.com>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Dec 14 15:38:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi

In alphanet.ml.linux.lvm, you wrote:
>  See http://lists.sistina.com/pipermail/linux-lvm/2001-December/009950.ht=
ml
> =20
>  for a patch that should work.

Oh nice.  I didn't found this patch yet (searched with
google).

I applied it and it compiled without error.  But now, my
machine does not boot anymore - it hangs directly after it
has detected my raid arrays:

-->-->-->--
md: updating md0 RAID superblock on device
sdb1 [events: 00000022](write) sdb1's sb offset: 3145664
md: serializing resync, md0 has overlapping physical units
with md2!
sda1 [events: 00000022](write) sda1's sb offset: 3145664
=2E
=2E.. autorun DONE.
--<--<--<--

After this, it won't continue booting up.  I booted a backup
copy of my kernel image.  I saw, that after the above step
("... autorun DONE.") the kernel tries to mount my root
partition read-only.

My / is on a RAID1 array (/dev/md0) with ext2.  Does the LVM
code touch anything of these two?

Any other hints?

Thanks & Cheers
Thomas
--=20
  .-.   Thomas Bader =B7 thomasb@trash.net.remove =B7 http://www.t-bader.ch=
/  .-.
  oo|                                                                     o=
o|
 /`'\     Einen Unix-Shellaccount gibt es unter http://www.trash.net/    /`=
'\
(\_;/)       PGP Key-ID: 0x3A4B7F5D (RSA)  0x7584F5D8 (DSA/EG)          (\_=
;/)
