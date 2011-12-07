Message-ID: <4EDF4672.9080705@draigBrady.com>
Date: Wed, 07 Dec 2011 10:56:50 +0000
From: =?ISO-8859-1?Q?P=E1draig_Brady?= <P@draigBrady.com>
MIME-Version: 1.0
References: <alpine.LFD.2.00.1112071055270.4205@dhcp-27-109.brq.redhat.com>
In-Reply-To: <alpine.LFD.2.00.1112071055270.4205@dhcp-27-109.brq.redhat.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: Lukas Czerner <lczerner@redhat.com>
Cc: linux-fsdevel@vger.kernel.org, Ric Wheeler <rwheeler@redhat.com>, linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-lvm@redhat.com

On 12/07/2011 10:20 AM, Lukas Czerner wrote:
> Hello everyone,
>=20
> I would like to introduce to you a new tool called System Storage
> Manager (ssm). It is supposed to provide easy to use command line
> interface to manage your storage using various technologies like
> lvm, btrfs, encrypted volumes and possibly more.
>=20
> Background
> ----------
>=20
> In more sophisticated enterprise storage environments, management with
> Device Mapper (dm), Logical Volume Manager (LVM), or Multiple Devices
> (md) is becoming increasingly more difficult. With file systems added
> to the mix, the number of tools needed to configure and manage storage
> has grown so large that it is simply not user friendly. With so many
> options for a system administrator to consider, the opportunity for
> errors and problems is large.

This seems like a worthwhile project given the overlap
in functionality from the various commands.
It echoes some of the functionality provided by libguestfs
for VM images I think.

> The btrfs administration tools have shown us that storage management can
> be simplified, and we are working to bring that ease of use to Linux
> filesystems in general.
>=20
>=20
> You can also find some more information in my presentation from LinuxCon
> Prague this year:
>=20
> http://people.redhat.com/lczerner/files/lczerner_fsm.pdf

This had the name 'fsm'.
I do think 'ssm' is better, however I would drop the '.py' from
the command name. This is incidental and restrictive going forward.
Note I checked the debian and freebsd man pages and 'ssm' is available.

> The code is still under development and no release has been made yet, but
> I would like to share with you what I have done so far, since the
> progress has been a bit slower than I have previously expected. The
> project lives on the sf.net :
>=20
> https://sourceforge.net/projects/storagemanager/

This is a much cleaner landing page:
http://sourceforge.net/p/storagemanager/home/Home/

cheers,
P=EF=BF=BDdraig.
