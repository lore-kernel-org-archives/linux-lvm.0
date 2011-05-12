Message-ID: <4DCBCD24.5090005@redhat.com>
Date: Thu, 12 May 2011 14:05:56 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <BANLkTikT7bzpAt29kUJ4QY5b9yQaVyZUVw@mail.gmail.com>
In-Reply-To: <BANLkTikT7bzpAt29kUJ4QY5b9yQaVyZUVw@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] vgchange --sysinit tries to write on filesystem.
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: =?ISO-8859-1?Q?Eric_B=E9langer?= <snowmaniscool@gmail.com>

On 05/12/2011 03:30 AM +0100, Eric B=EF=BF=BDlanger wrote:
> Since updating to lvm2 2.02.85, I'm getting the following message on
> bootup after "/sbin/vgchange --sysinit -a y" is ran by the system
> initscripts:
>=20
> /etc/lvm/cache/.cache unlink failed: Read-only filesystem

The .85 uses a new way to get the list of devices and the .cache
is obsolete in this situation and so it's being removed. Though we
missed this case with --sysinit. Thanks for the report, we'll fix
this.

Peter
