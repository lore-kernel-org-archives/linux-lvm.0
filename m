Message-ID: <5241D3E0.9090904@gmail.com>
Date: Tue, 24 Sep 2013 14:03:12 -0400
From: =?ISO-8859-2?Q?Jorge_F=E1bregas?= <jorge.fabregas@gmail.com>
MIME-Version: 1.0
References: <5238A190.2050000@gmail.com>
	<alpine.LFD.2.00.1309241512590.2049@localhost.localdomain>
	<alpine.LFD.2.00.1309241649340.2049@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.00.1309241649340.2049@localhost.localdomain>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] LVM & fstrim behaviour (Fedora 19)
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com
Cc: =?ISO-8859-2?Q?Luk=E1=B9_Czerner?= <lczerner@redhat.com>

ok Luk=EF=BF=BD I think I found where the problem is. I just realized that I
created that filesystem without journaling (in order to increase perform
for the VM disks).  I created it with:

mkfs.ext4 -O ^has_journal /dev/vgthin1/lvol2

I went back and created the filesystem again (on a thin lvol) with
default options and indeed fstrim works as expected.  I created ANOTHER
thinvol (without journaling) and fstrim doesn't work.

Is this a bug or does fstrim requires ext4 with journal by design?

My apologies for not stating this since the beginning!

--=20
Jorge
