From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] pvmove -- not enough free/allocatable physical
    extends .. but: there had to be enough!
Message-Id: <20020226095642.E12832@lynx.adilger.int>
References: <E8AEFF3401E82E4699359F1EBBED6A2105BED8@exchange.his.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E8AEFF3401E82E4699359F1EBBED6A2105BED8@exchange.his.de>;
    from Muessig-Trapp@his.de on Tue, Feb 26, 2002 at 02:50:03PM +0100
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
Date: Tue Feb 26 10:56:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?M=FC=DFig-Trapp=2C_Peter?= <Muessig-Trapp@his.de>
Cc: linux-lvm@sistina.com

On Feb 26, 2002  14:50 +0100, M=FC=DFig-Trapp, Peter wrote:
> My plan is, to remove a partition (/dev/hda4) from lv and use
> it seperatly (mount it on /usr).
>=20
> I tried pvmove and get errors:
>=20
> root@icezentral:/home/muessig > pvmove /dev/hda4 /dev/hdb1
> pvmove -- moving physical extents in active volume group "daten"
> pvmove -- WARNING: if you lose power during the move you may need to
> restore your LVM metadata from backup!
> pvmove -- do you want to continue? [y/n] y
> pvmove -- not enough free/allocatable physical extents
> =20
> Than I used pvscan to check pv and see, there are no extends
> allocatable (on each partition 0 free). How is that possible?
> df tells me, there enough space available.
>=20
> root@icezentral:/home/muessig > pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/sda1" of VG "daten" [8.51 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/sdb1" of VG "daten" [8.51 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/sdc1" of VG "daten" [4.25 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hda4" of VG "daten" [5.05 GB / 0 free]
> pvscan -- ACTIVE   PV "/dev/hdb1" of VG "daten" [57.27 GB / 0 free]
> pvscan -- total: 5 [83.59 GB] / in use: 5 [83.59 GB] / in no VG: 0 [0]

This is correct, you have no PEs free on hdb1.

> root@icezentral:/home/muessig > df -h=20
> Filesystem            Size  Used Avail Use% Mounted on
> /dev/hda3             2.5G  2.2G  163M  94% /
> /dev/hda1              15M  3.3M   11M  23% /boot
> /dev/daten/1           84G   22G   61G  27% /daten

The 'df' command is telling you how much free space is in the filesystem.
Obviously you have a lot of free space in the _filesystem_ because you ha=
ve
allocated all of your PEs to it.

What you need to do is reduce the size of your /daten filesystem (it need=
s
to be unmounted to do this) and also reduce the size of the daten/1 LV by
at least 5.1 GB.  If you have ext2/ext3 filesystems on daten/1 I would
recommend using e2fsadm to do this.

Once you have done this, then the pvmove should work.  Note that dependin=
g
on where the PEs from the end of the daten/1 LV are, you may have to
just use "pvmove /dev/hda4" so that it moves the PEs from hda4 to the fir=
st
available free PE.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
