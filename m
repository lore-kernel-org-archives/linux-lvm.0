Message-Id: <200203280951.g2S9p8h23250@lorus.lonx.net>
Content-Type: text/plain; charset="iso-8859-1"
From: daniel amthor <da@dertext.com>
Subject: Re: [linux-lvm] VG lost, VG restorable without lvmconf? Need help!
References: <19654.1017261644@www26.gmx.net>
In-Reply-To: <19654.1017261644@www26.gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Date: Thu Mar 28 03:50:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

On Wednesday 27 March 2002 21:40, you wrote:
> =A0
> I have no lvmconf etc. :-(
> Is it possible to recover the VG from the data of the PVs?
> =A0
I had a similar problem.  There seems to be a problem with vgscan erasing=
 the=20
conf sometimes. I tried hgetting an answer on this list, but maybe we can=
=20
push it together. Are your disks Maxtor ?=20
This is what I did to recover :=20
1. Installed backups of vgconf-files (vgcfgbackup/recover seems broken to=
o)=20
2. Ran vgchange -a y =20
3. Disabled vgscan alltogether, as it wrecked everything always.

Keep us posted :-)
HTH=20
Dan
