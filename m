From: FEJF <fejf@gmx.de>
Subject: Re: [linux-lvm] pv_move_pe() error again :/
Date: Mon, 10 Sep 2001 18:13:12 +0200
References: <E15f13v-0003bs-00@hermes.sistina.com> <20010910132709.G31313@sistina.com> <20010910173851.A3751@vestdata.no>
In-Reply-To: <20010910173851.A3751@vestdata.no>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <E15gTfT-0007Q8-00@hermes.sistina.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ragnar Kj=EF=BF=BDrstad, on Montag, 10. September 2001 17:38 wrote:
> On Mon, Sep 10, 2001 at 01:27:09PM +0200, Heinz J . Mauelshagen wrote:
> > But I wonder, why in your case the locking of the PE failed. Are you ab=
le
> > to reporduce your case and provide the error code?

[cut]

> Sep  6 18:15:51 argus kernel: lvm -- lvm_blk_ioctl: unknown command 587
> Sep  6 18:15:55 argus last message repeated 213 times
> Sep  6 18:15:55 argus kernel: hdd: read_intr: status=3D0x59 { DriveReady
> SeekComplete DataRequest E rror } Sep  6 18:15:55 argus kernel: hdd:
> read_intr: error=3D0x40 { UncorrectableError }, LBAsect=3D11801433 2,
> sector=3D118014332 Sep  6 18:15:55 argus kernel: end_request: I/O error, =
dev
> 16:40 (hdd), sector 118014332
>
> The kernel is standard 2.4.8 without the LVM-patches. The usersspace
> tools are version 1.0.1-rc2.

i got similar errors - but in my box the damaged hd was slave... so i got t=
he=20
uncorrectable errors on the slave (hdh) and the dma "DriveReady=20
SeekComplete"-Errors on the master-disk (hdg)

kernel 2.4.7-ac7 without lvm-patches and lvm 0.9.1b7 tools
fejf

- --=20
Backups are usefull. Most often when you don't have one ;)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7nOaY7Xtp66ctWuIRAr/rAKDbwC5DMea+yksFvJWZ9ubIvrm7LQCfTHMa
+aAlDpsQ/RUoakNRe+iUyo8=3D
=3D93ns
-----END PGP SIGNATURE-----
