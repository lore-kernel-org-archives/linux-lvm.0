From: Martin Webster <mwebster@ntlworld.com>
Subject: Re: [linux-lvm] Removing a SCSI device
Date: Wed, 10 Oct 2001 21:00:32 +0000
References: <01100817152901.01127@lagothrix> <20011009113048.C25020@sistina.com>
In-Reply-To: <20011009113048.C25020@sistina.com>
MIME-Version: 1.0
Message-Id: <01101020400403.01123@lagothrix>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Tuesday 09 October 2001  9:30 am, Heinz J . Mauelshagen wrote:
> LVMs vgscan should happily find your VG in that changed configuration a=
gain
> and "vgchange -ay" will activate it afterwards.
> BTW: there's no need to change the SCSI id of HD 1.
>
> On Mon, Oct 08, 2001 at 05:15:29PM +0000, Martin Webster wrote:
> > I want to remove an internal Zip drive (SCSI ID#2) to make way for a =
DVD
> > drive. However, I have two SCSI drives set-up with LVM as follows and
> > realise that removing the Zip drive will cause a number of problems.
> > Here's my current configuration:
> >
> > sda Hard disk 0 (boot) - ID#0
> > sdb Zip disk - ID#1
> > sdc Hard disk 1 - ID#2
> > cdrecorder - ID#6
> >
> > / (root) is /dev/sdc5 (reiserfs)
> > /boot is /dev/sda5 (ext2)
> > swap is /dev/sda6
> > Everything else is on the LVM spanning two physical volumes: one logi=
cal
> > volume.
> >
> > And here's what I plan to do:
> >
> > 1. Unplug the Zip drive and change SCSI ID of Hard disk 1 to ID#1
> > 2. Boot system into single user mode: linux S root=3D/dev/sdb5
> > 3. Remount root filesystem and /boot as read/write:
> > mount -n -o remount, rw /
> > mount -n -o remount, rw /boot
> > 4. Edit /etc/lilo.conf and change instances of "sdc " to "sdb"
> > 5. Run mk_initrd followed by LILO:
> > mk_initrd && /sbin/lilo
> > 6. Re-boot
> >
> > What I am uncertain of is whether this approach will work with LVM. C=
an
> > any one advise?
> >
> > BTW, I'm using SuSE 7.2 Professional.

Heinz,

Many thanks! All is well with my system now.

M
--=20
Martin Webster <mwebster@ntlworld.com>
Registered Linux User #230322
http://homepage.ntlworld.com/spider-monkey/
