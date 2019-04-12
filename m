MIME-Version: 1.0
References: <CAKM4AeyUFr1PQB8jSVR2iaa9tTozwij0cCOfFWdTaX+txru0mg@mail.gmail.com>
	<00ae05c4-5ad8-1137-076d-57a24f093fd3@redhat.com>
	<CAKM4Aexiy-iXuNs6Nn-JudytKQRizovjg_3TVL0_xn_7+e3wXg@mail.gmail.com>
In-Reply-To: <CAKM4Aexiy-iXuNs6Nn-JudytKQRizovjg_3TVL0_xn_7+e3wXg@mail.gmail.com>
From: Eric Ren <renzhengeek@gmail.com>
Date: Fri, 12 Apr 2019 22:56:11 +0800
Message-ID: <CAKM4Aezz1N14MuLcQdJkzvrLFf4f2h-H+UjgL2jVRrBhxVOPow@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] lvcreate hangs forever and udev work timeout
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
Content-Type: text/plain; charset="windows-1252"
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM2 development <lvm-devel@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

Hi,

> Since the /dev/dm-x has been created, I don't understand what it waits
> udev to do?
> Just waits udev rules to create device symbol links?

Although the /dev/dm-26 is visible, but the device seems not ready in kerne=
l.

[root@iZuf6dbyd7ede51sykedamZ ~]# dmsetup udevcookies
Cookie       Semid      Value      Last semop time           Last change ti=
me
0xd4d0b57    225214464  2          Fri Apr 12 17:33:14 2019  Fri Apr
12 17:33:14 2019

[root@iZuf6dbyd7ede51sykedamZ ~]# dmsetup info /dev/dm-26
Device dm-26 not found
Command failed.

[root@iZuf6dbyd7ede51sykedamZ ~]# ls -l /dev/dm-26
brw-rw---- 1 root disk 252, 26 4=E6=9C=88  12 17:33 /dev/dm-26

Regards.
