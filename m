From: Thomas Ziegler <zie@codingtechnologies.de>
Subject: Re: [linux-lvm] kernel: zam-7001: io error in reiserfs_find_entry
Message-Id: <20020111114737.A22576@codingtechnologies.de>
References: <22543.1010745017@joergli.cocolab.de>
    <20020111103718.GA1274@tykepenguin.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20020111103718.GA1274@tykepenguin.com>
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
Date: Fri Jan 11 04:52:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Fri, Jan 11, 2002 at 10:37:18AM +0000, Patrick Caulfield wrote:
> On Fri, Jan 11, 2002 at 11:30:17AM +0100, J?rgen Vollmer wrote:
> >=20
> > Hi everybody,
> >=20
> > I use kernel-source-2.4.16.SuSE-24.i386.rpm together with reiserfs and
> > made a snapshot which I then tar'ed.
> > Writing the tape seems to be ok. After that I did:
> >=20
> > 	tar --directory=3D/ --file=3D/dev/tape --compare
> >=20
> > and got the message (while working i.e. modifying the  original filesys=
tem)
> >=20
> > Message from syslogd@joergli at Fri Jan 11 10:57:19 2002 ...
> > joergli kernel: zam-7001: io error in reiserfs_find_entry
> >=20
>=20
>=20
> >=20
> > So it seems that the snapshot is full. Is that correct, or do I have a =
serious
> > problem? Note: I'm doing my backups, so a dead backup is not a very good
> > one :-)
>=20
> Yes, your snapshot is full. When this happens LVM fails all I/O to the sn=
apshot.
> Unfortunatetly reiserfs doesn't not currently cope very well with I/O err=
ors on
> a device hence the message you saw.
>=20
> You will need to allocate more space to the snapshot LV to get around thi=
s.
>=20
> It's not a serious problem but if you are bothered by the oops I posted a
> patch to workaround to the problem here:
>=20
> http://lists.sistina.com/pipermail/linux-lvm/2001-November/009913.html
>=20
> It's not great and it doesn't stop the full snapshot being unusable, but =
it does
> stop the oopses.
>=20

Some Questions to LVM and snapshots:

- Do other filesystems cope in a better way with a full snapshot than reise=
rfs?=20

- What's the preferred fs in conjunction with lvm?

- Is there a way to get the snapshot not destroyed if it is getting full?

Thanks in advance,
Thomas


--=20
Dr.-Ing. Thomas Ziegler            |
Senior Research Engineer           | Coding Technologies
phone: +49 (0) 911 92891 -27       | Deutschherrnstr. 15-19
fax:   +49 (0) 911 92891 -99       | D-90429 N=EF=BF=BDrnberg, Germany
mailto:zie@CodingTechnologies.com  | http://www.CodingTechnologies.com
