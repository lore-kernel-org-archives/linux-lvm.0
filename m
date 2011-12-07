Date: Wed, 7 Dec 2011 12:17:34 +0100 (CET)
From: Lukas Czerner <lczerner@redhat.com>
In-Reply-To: <4EDF4672.9080705@draigBrady.com>
Message-ID: <alpine.LFD.2.00.1112071208190.15332@dhcp-27-109.brq.redhat.com>
References: <alpine.LFD.2.00.1112071055270.4205@dhcp-27-109.brq.redhat.com>
	<4EDF4672.9080705@draigBrady.com>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-927029420-1323256658=:15332"
Subject: Re: [linux-lvm] System Storage Manager
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
To: =?ISO-8859-15?Q?P=E1draig_Brady?= <P@draigBrady.com>
Cc: linux-kernel@vger.kernel.org, linux-lvm@redhat.com, linux-fsdevel@vger.kernel.org, Lukas Czerner <lczerner@redhat.com>, Ric Wheeler <rwheeler@redhat.com>, linux-btrfs@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-927029420-1323256658=:15332
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Wed, 7 Dec 2011, P=EF=BF=BDdraig Brady wrote:

> On 12/07/2011 10:20 AM, Lukas Czerner wrote:
> > Hello everyone,
> >=20
> > I would like to introduce to you a new tool called System Storage
> > Manager (ssm). It is supposed to provide easy to use command line
> > interface to manage your storage using various technologies like
> > lvm, btrfs, encrypted volumes and possibly more.
> >=20
> > Background
> > ----------
> >=20
> > In more sophisticated enterprise storage environments, management with
> > Device Mapper (dm), Logical Volume Manager (LVM), or Multiple Devices
> > (md) is becoming increasingly more difficult. With file systems added
> > to the mix, the number of tools needed to configure and manage storage
> > has grown so large that it is simply not user friendly. With so many
> > options for a system administrator to consider, the opportunity for
> > errors and problems is large.
>=20
> This seems like a worthwhile project given the overlap
> in functionality from the various commands.
> It echoes some of the functionality provided by libguestfs
> for VM images I think.
>=20
> > The btrfs administration tools have shown us that storage management can
> > be simplified, and we are working to bring that ease of use to Linux
> > filesystems in general.
> >=20
> >=20
> > You can also find some more information in my presentation from LinuxCon
> > Prague this year:
> >=20
> > http://people.redhat.com/lczerner/files/lczerner_fsm.pdf
>=20
> This had the name 'fsm'.

Yes I had to change it, since fsm implies file system, but it is not
only about file systems.

> I do think 'ssm' is better, however I would drop the '.py' from

Already done. But I can see that it is still present in the README file.
Will fix it, tanks.

> the command name. This is incidental and restrictive going forward.
> Note I checked the debian and freebsd man pages and 'ssm' is available.

I could not find it on http://manpages.debian.net/cgi-bin/man.cgi but I
know there is a project called ssm:

ssm.i686 : Macromolecular coordinate superposition library

but my project is called System Storage Manager and ssm is just the
executable. I could not find any binary with the same name (within
Fedora), not sure if that will be a problem...

>=20
> > The code is still under development and no release has been made yet, b=
ut
> > I would like to share with you what I have done so far, since the
> > progress has been a bit slower than I have previously expected. The
> > project lives on the sf.net :
> >=20
> > https://sourceforge.net/projects/storagemanager/
>=20
> This is a much cleaner landing page:
> http://sourceforge.net/p/storagemanager/home/Home/
>=20
> cheers,
> P=EF=BF=BDdraig.
>=20

Thanks for comments!
-Lukas
--8323328-927029420-1323256658=:15332--
