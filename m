Message-ID: <48A192B7.7000108@redhat.com>
Date: Tue, 12 Aug 2008 14:40:07 +0100
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Found duplicate PVs
References: <47311dd20808120424w30a33b88uf8418db1f411a52d@mail.gmail.com>
	<48A1747A.8060808@redhat.com>
	<48A186A7.3050901@kadzban.is-a-geek.net>
In-Reply-To: <48A186A7.3050901@kadzban.is-a-geek.net>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: Bryan Kadzban <bryan@kadzban.is-a-geek.net>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Bryan Kadzban wrote:
> Bryn M. Reeves wrote:
>>> broken (split) RAID1 mirror?
> 
> Alternately, software RAID1 -- either a dm-raid type setup (most onboard
> "RAID controllers", and in fact almost every consumer "RAID" device) or
> md?

That's exactly what I meant by a split/broken RAID1 mirror - either two
disks being presented as SCSI/ATA devices when they contain an array or
an array "controller" (fakeraid) using the wrong drivers. Unlikely to be
MD since LVM2 already performs MD component detection (enabled by
default iirc) and will use the MD device in preference to components.

> You can control which devices get scanned by editing the "filter" option
> in /etc/lvm/lvm.conf -- you can make it only include the RAID array
> device (/dev/mapper/whatever or /dev/mdX), instead of the member drives
> (/dev/sdXY).

Shouldn't be needed for MD devices - just make sure you have:

devices {
[...]
    md_component_detection = 1
}

Somewhere in your lvm.conf. As you say, this is most common with dmraid
 since the "controller" is just a regular ATA part with some BIOS goop
and a bit of metadata on the disks but you can get the same sort of
behavior with "real" RAID controllers in some cases.

> (And this is probably just a special case of the "broken (split) RAID1
> mirror" possibility that Bryn was talking about.)

Yup :)

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFIoZK36YSQoMYUY94RAid3AKDFmEtVBuIBCKOhNJbsC70oVcRdzgCdFRQs
BjW8XPFFatq0y8GpER6GI+c=
=vplQ
-----END PGP SIGNATURE-----
