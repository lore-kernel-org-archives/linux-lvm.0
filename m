Message-ID: <48A186A7.3050901@kadzban.is-a-geek.net>
Date: Tue, 12 Aug 2008 08:48:39 -0400
From: Bryan Kadzban <bryan@kadzban.is-a-geek.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Found duplicate PVs
References: <47311dd20808120424w30a33b88uf8418db1f411a52d@mail.gmail.com>
	<48A1747A.8060808@redhat.com>
In-Reply-To: <48A1747A.8060808@redhat.com>
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
To: bmr@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: RIPEMD160

Bryn M. Reeves wrote:
> broken (split) RAID1 mirror?

Alternately, software RAID1 -- either a dm-raid type setup (most onboard
"RAID controllers", and in fact almost every consumer "RAID" device) or
md?

If the LVM PVs sit on the RAID1 array instead of the member drives, then
you'll get duplicate PVs if you're scanning the member drives themselves
instead of the entire array.  You need to scan the RAID1 array (and of
course it needs to be assembled before you do the scan).

You can control which devices get scanned by editing the "filter" option
in /etc/lvm/lvm.conf -- you can make it only include the RAID array
device (/dev/mapper/whatever or /dev/mdX), instead of the member drives
(/dev/sdXY).

(And this is probably just a special case of the "broken (split) RAID1
mirror" possibility that Bryn was talking about.)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIoYamS5vET1Wea5wRAzqpAJ4lLzECth88MHROD6T2mahDqMn0jgCfTfPR
1O2q8f2jZnocvQ1VkPCsIHg=
=ygT4
-----END PGP SIGNATURE-----
