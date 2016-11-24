From: =?utf-8?Q?Stefan_Bauer?= <sb@plzk.de>
Date: Thu, 24 Nov 2016 15:02:32 +0100
Mime-Version: 1.0
Sender: =?utf-8?Q?Stefan_Bauer?= <stefan.bauer@cubewerk.de>
Message-Id: <kcim.5836f2f8.25f.657975b133937972@ucs.cubewerk.intern>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] auto_activation_volume_list in lvm.conf not honored
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
To: =?utf-8?Q?Peter_Rajnoha?= <prajnoha@redhat.com>, =?utf-8?Q?linux-lvm=40redhat=2Ecom?= <linux-lvm@redhat.com>

Hi Peter,

now all make sense. On this ubuntu machine upstartd with udev is taking car=
e of vgchange.

After some digging, /lib/udev/rules.d/85-lvm2.rules shows, that vgchange is=
 only executed with -a y

We will test this on weekend but I'm certain now, that this was the problem.

We wanted to keep things simple and do not use clvmd. We have master/slave =
setup without concurrent write/read.

So according to your documentations ;) it should work without clvmd.

Thank you!

Stefan

=20
-----Urspr=C3=BCngliche Nachricht-----
> Von:Peter Rajnoha <prajnoha@redhat.com>
> Gesendet: Don 24 November 2016 14:39
> An: linux-lvm@redhat.com
> CC: sb@plzk.de
> Betreff: Re: [linux-lvm] auto_activation_volume_list in lvm.conf not hono=
red
>=20
> On 11/24/2016 01:21 PM, Stefan Bauer wrote:
> > hi folks,=20
> >=20
> > howto avoid pvescan to initialize lvm volume groups on startup (it's fo=
r a cluster setup)? auto_activation_volume_list was filled with the remaini=
ng VGs we want to setup. Manually it does what it should=20
> >=20
> > /sbin/lvm pvescan --config 'activation { auto_activation_volume_list =
=3D "vg2" }'  only activates vg2 but keeps vg1 "untouched".
> >=20
> > But on system startup, all VGs are activated. (ubuntu 14.04.5 LTS)
> >=20
> > We also updated the ramdisk and verified, the changes are also in the r=
amdisks lvm.conf
> >=20
> > However vg1 is also enabled.
> >=20
> > Any help is greatly appreciated.
>=20
> It's important that all scripts which handle LVM activation at boot are
> executed with vgchange -aay that honours the auto_activation_volume_list
> (so not "vgchange -ay").
>=20
> All init scripts and systemd units which upstream LVM2 provides are
> executed with "-aay" already.
>=20
> You mentioned cluster setup - so are your VGs clustered and are you
> using clvmd? If that's the case, the clustered VGs are activated either
> by clvmd init script/systemd unit or external cluster resource agent
> (e.g. pacemaker and clvm ocf file) which calls the vgchange to activate
> the clustered VGs - that one needs to use "-aay" too.
>=20
> --=20
> Peter
>=20
