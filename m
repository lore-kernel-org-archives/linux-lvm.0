content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: re[2]: [linux-lvm] Core questions from a LVM neophyte...
Message-ID: <08628CA53C6CBA4ABAFB9E808A5214CB0142B3B6@mercury.infiniconsys.com>
From: "Barry, Christopher" <cbarry@infiniconsys.com>
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
Date: Wed Mar 12 21:00:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Sistina's GFS will do this as well. We employ it here with good results. =
GFS can live happily in LV2.

--
Christopher Barry
Manager of Information Systems
InfiniCon Systems
http://www.infiniconsys.com

-----Original Message-----
From: Greg Freemyer [mailto:freemyer@NorcrossGroup.com]
Sent: Wednesday, March 12, 2003 6:56 PM
To: LVM Mailing list
Subject: re[2]: [linux-lvm] Core questions from a LVM neophyte...


Just to re-iterate, HPs Virtual Replicator does this.  (IIRC $10K)

They like you to put a MSA-1000 FC Array behind your VR server (IIRC =
$15K entry), but it supports/exports any FC array or local disk =
solution.

It does not provide any RAID aspects.

If you want to know more, e-mail me off-list.

Greg
  (HP certified SAN architect)


 >>  I'm interested in a block level export.  The exported space will be =
used
 >>  as the disk part of an Hierarchical Storage Manager that is backed =
up by
 >>  qualstar tape libraries.  We have several such systems and I would =
like
 >>  to try to consolidate the disk portions of each into a "SAN" like
 >>  environment.  At the same time, we are also looking at more =
customer
 >>  disk based storage.  I have several storage servers (hopefully =
running
 >>  Linux soon but running W2K now) that need access to large areas of
 >>  storage.  I would like to carve and export virtualized chunks for =
this
 >>  as well. =20

 >>  The main reason for the block level export is that the software we =
use
 >>  does not support "NAS" type network disks.  They only support =
"locally
 >>  attached" drives.  iSCSI would at least appear as a local SCSI =
disk.

 >>  For management purposes, I would like to have a single way to =
export
 >>  everything.  This may or may not be feasible at present.

 >>  - Steve

 >>  > Stephen,
 >>  >     What do you want it for - backups? Why not samba over GigE?
 >>  >=20
 >>  > --
 >>  > Christopher Barry
 >>  > Manager of Information Systems
 >>  > InfiniCon Systems
 >>  > http://www.infiniconsys.com
 >>  >=20
 >>  > -----Original Message-----
 >>  > From: Stephen Perkins [mailto:perkins@netmass.com]
 >>  > Sent: Monday, March 10, 2003 4:14 PM
 >>  > To: linux-lvm@sistina.com
 >>  > Subject: RE: [linux-lvm] Core questions from a LVM neophyte...
 >>  >=20
 >>  >=20
 >>  > Hi all,
 >>  > =20
 >>  > >     I have built a very cool NAS box, and want to use LVM2=20
 >>  > > on it. My machine is as follows:
 >>  > >=20
 >>  > > Tyan Thunder i7500 w/ 2-2.4GHz XEON processors.
 >>  > > 2GB RAM
 >>  > > 3ware Escalade 7500-12 IDE RAID controller
 >>  > > 12-160GB Maxtor IDE HDs
 >>  > > System on a separate 20GB Maxtor HD
 >>  > > Floppy, slimline CDROM, and a DVDRW drive.
 >>  > > All in a 12-bay chassis from=20
 >>  > > http://www.rackmountpro.com/productpage.cfm?> prodid=3D1460
 >>  > >=20
 >>  > > This=20
 >>  > > config gives me 1.8TB of RAID 5 for under=20
 >>  > > $8K - not too shabby.
 >>  >=20
 >>  > This is a superb value and I'm very interested in your=20
 >>  > proposed "how-to"
 >>  > site.
 >>  >=20
 >>  > I am wanting to deploy some larger virtualized storage in a mixed
 >>  > Linux/W2K environment.    Is anybody out there exporting =
virtualized
 >>  > volumes to Win2K boxes?  If so, how?  I checked HyperSCSI and =
they do
 >>  > not appear to have a Win2K client (although a beta is supposed to =
be
 >>  > coming soon).  I have not yet found target information for Linux =
along
 >>  > with a known interoperable Win2K initiator.  Anybody doing it?
 >>  >=20
 >>  > Disk performance is not so much an issue for me since the disk =
arrays
 >>  > will be replacing large tape libraries.  Even with pathetic=20
 >>  > performance,
 >>  > they should behave much faster than large AIT libraries. =20
 >>  >=20
 >>  > Question 1:  Is it possible today to:
 >>  >=20
 >>  > Have a large IDE RAID5 array that is virtualized through LVM and =
then
 >>  > exported to a Dynamic Disk on Win2K over a LAN (not necessarily =
WAN)?
 >>  >=20
 >>  > I believe iSCSI and HyperSCSI would both work... However I have =
not
 >>  > found the approporiate interoperable software drivers.
 >>  >=20
 >>  > Question 2: The system that is described above is a linux system =
with
 >>  > direct attached storage.  It is a SPOF.  Any inexpensive=20
 >>  > solutions that
 >>  > would allow the Linux portion to be clustered for active/pasive
 >>  > failover?  Is FC the only alternative here?
 >>  >=20
 >>  > TIA,
 >>  >=20
 >>  > - Steve
 >>  >=20
 >>  >=20
 >>  >=20
 >>  >=20
 >>  > _______________________________________________
 >>  > linux-lvm mailing list
 >>  > linux-lvm@sistina.com
 >>  > http://lists.sistina.com/mailman/listinfo/linux-lvm
 >>  > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
 >>  >=20



 >>  -- NextPart --
 >>  Attached File: c:\program =
files\goldmine\MailBox\Attach\gaf\smime(2).p7s

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
