Message-ID: <48A1ABE9.1030608@kadzban.is-a-geek.net>
Date: Tue, 12 Aug 2008 11:27:37 -0400
From: Bryan Kadzban <bryan@kadzban.is-a-geek.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Found duplicate PVs
References: <47311dd20808120424w30a33b88uf8418db1f411a52d@mail.gmail.com>	<48A1747A.8060808@redhat.com>
	<48A186A7.3050901@kadzban.is-a-geek.net>	<48A192B7.7000108@redhat.com>
	<47311dd20808120710h48268c0uc941b28dca2eb903@mail.gmail.com>
In-Reply-To: <47311dd20808120710h48268c0uc941b28dca2eb903@mail.gmail.com>
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
Hash: RIPEMD160

Pedro Gonzalez Zamora wrote:
> The messages "Found duplicate PVs" disappear when I add this line in 
> lvm.conf:
> 
> filter = [ "a/sd[a-r]$/" , "r/.*/" ]
> 
> But I don't know if it is a good solution?

Not likely, but it depends on your hardware setup -- it depends on what
exactly is on those disks.

If you're using fakeraid, then I'd reject sd.* and accept .* (which
would include the /dev/mapper/XXXX fakeraid DM device).

If you're using multipath, then I don't know -- follow the multipath docs.

If you're using LVM on md-raid, then it should be working properly by
default without this change (though md_component_detection must be set
to 1, so you may want to double-check that setting if your system is set
up like this).
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFIoavmS5vET1Wea5wRAxgxAJ0UO3Vkwudc77vS+46V5ER2uiXc+ACgvR2z
wx3Q8uYyUf/tEKAfKqeQUuo=
=TrGx
-----END PGP SIGNATURE-----
