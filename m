Message-ID: <530E67E9.9060005@ubuntu.com>
Date: Wed, 26 Feb 2014 17:17:13 -0500
From: Phillip Susi <psusi@ubuntu.com>
MIME-Version: 1.0
References: <530E1EA8.9020301@ubuntu.com> <530E30B4.6020505@redhat.com>
	<530E3464.3050606@ubuntu.com> <530E3CAA.1070308@redhat.com>
	<530E541C.9040001@ubuntu.com> <530E5F36.5070002@redhat.com>
In-Reply-To: <530E5F36.5070002@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] libdevmapper's handling of devices with spaces in
	the name
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
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 2/26/2014 4:40 PM, Zdenek Kabelac wrote:
> It would also probably help to describe what kind of app which
> uses libdevmapper you are trying to develop...

I'm trying to fix parted to not fail on such devices.  As I said
originally it fails because it calls dm_task_get_name() to find out
the true /dev/mapper/ name of the device, so that it can add the
partition number to it and be able to open the partition.  Now that I
look at the comment in the headers, it sounds like perhaps it just
should be using dm_task_get_name_mangled() instead.

I'm also still wondering why udev can't simply handle quoted names
with spaces in them.  People have been dealing with this sort of thing
in shell for years...


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (MingW32)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBAgAGBQJTDmfpAAoJEI5FoCIzSKrw+0YH/3i/a7dihHXuM1nGxkL16E+e
Er2X7PoVnowBKVW7kk9bHXKOO5vZeSAArcYflmgcernBXTjBhyXFi8wtwuxtWIRc
nesNV26dQz5I7Qh9l9tVt9kCuCwGs/UT/V4vnyPAIf+O5pnwFyy32d2CjnMVztTa
QBRmS9CoeurQkj5s+BFGI+vyM3Uul5SA3Ymaf/qIWC8xQXMNUisro5ytwzXT5tJ5
jT5yK754wxw8V6bgFOTBssOaLKOetMklMHSgfW2+XWuhFduGNAOdeM5dbqJlW1Wr
RSxEaTu4EvvuBcnYe/APuuOW6JUwG+Uf4Ut/gyMoWc8dRKXsPb2UMm694FRy8Rk=
=6ZPG
-----END PGP SIGNATURE-----
