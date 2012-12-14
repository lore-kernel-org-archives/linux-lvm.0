Message-ID: <50CBA28E.5070806@ubuntu.com>
Date: Fri, 14 Dec 2012 17:05:02 -0500
From: Phillip Susi <psusi@ubuntu.com>
MIME-Version: 1.0
References: <50C9F2D6.7090802@ubuntu.com> <20121214192953.GB3148@redhat.com>
	<50CB8477.30708@ubuntu.com> <20121214201049.GA3859@redhat.com>
In-Reply-To: <20121214201049.GA3859@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Non 512 byte sectors
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12/14/2012 3:10 PM, Mike Snitzer wrote:
> DM has no role in fabricating devices with artificial limits. What
> do you hope to accomplish with this?

I am trying to fix dmraid on pdc arrays that are > 2TB.  It seems that
pdc has the virtual disk use a larger sector size so that you can
partition it with MBR.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (MingW32)
Comment: Using GnuPG with undefined - http://www.enigmail.net/

iQEcBAEBAgAGBQJQy6KOAAoJEJrBOlT6nu752aYH/Ax4h69oPwncDf4YGCheE9KQ
WpVV5koPqaUkBd2hrB6Uj6XPjxl+ohr7amiT8w+KRfvKZcOGnWXJUre3cY/DbqBv
8nPL6aD5e2IRMPP1zVf4kaeVDc2FGEcT1GYcS7pmYZQjBxTJYS6a6zsYjkrfpNvZ
l6k/Jvyfn/0zOHDWJ6w1FFO5u83vArva6hvY0HcwhZMUuTP3+U2fH/vge+GhQQWE
+TD8Bv6fcjl7mZsF7dwKGUjZkPaFQ6yxnDALYiUw7O0tjtwnHf+3HAsAjCeYo7Nm
L2TSjtHuAVd6ddpLMEO2SUNLcM1oropgaXL4Fuj2aoAhLjKWAgQtTOQ9dtjsWfM=
=bn9p
-----END PGP SIGNATURE-----
