content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] Core questions from a LVM neophyte...
Message-ID: <08628CA53C6CBA4ABAFB9E808A5214CB0142B355@mercury.infiniconsys.com>
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
Date: Tue Mar 11 20:00:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Stephen,
	What do you want it for - backups? Why not samba over GigE?

--
Christopher Barry
Manager of Information Systems
InfiniCon Systems
http://www.infiniconsys.com

-----Original Message-----
From: Stephen Perkins [mailto:perkins@netmass.com]
Sent: Monday, March 10, 2003 4:14 PM
To: linux-lvm@sistina.com
Subject: RE: [linux-lvm] Core questions from a LVM neophyte...


Hi all,
=20
> 	I have built a very cool NAS box, and want to use LVM2=20
> on it. My machine is as follows:
>=20
> Tyan Thunder i7500 w/ 2-2.4GHz XEON processors.
> 2GB RAM
> 3ware Escalade 7500-12 IDE RAID controller
> 12-160GB Maxtor IDE HDs
> System on a separate 20GB Maxtor HD
> Floppy, slimline CDROM, and a DVDRW drive.
> All in a 12-bay chassis from=20
> http://www.rackmountpro.com/productpage.cfm?> prodid=3D1460
>=20
> This=20
> config gives me 1.8TB of RAID 5 for under=20
> $8K - not too shabby.

This is a superb value and I'm very interested in your proposed "how-to"
site.

I am wanting to deploy some larger virtualized storage in a mixed
Linux/W2K environment.    Is anybody out there exporting virtualized
volumes to Win2K boxes?  If so, how?  I checked HyperSCSI and they do
not appear to have a Win2K client (although a beta is supposed to be
coming soon).  I have not yet found target information for Linux along
with a known interoperable Win2K initiator.  Anybody doing it?

Disk performance is not so much an issue for me since the disk arrays
will be replacing large tape libraries.  Even with pathetic performance,
they should behave much faster than large AIT libraries. =20

Question 1:  Is it possible today to:

Have a large IDE RAID5 array that is virtualized through LVM and then
exported to a Dynamic Disk on Win2K over a LAN (not necessarily WAN)?

I believe iSCSI and HyperSCSI would both work... However I have not
found the approporiate interoperable software drivers.

Question 2: The system that is described above is a linux system with
direct attached storage.  It is a SPOF.  Any inexpensive solutions that
would allow the Linux portion to be clustered for active/pasive
failover?  Is FC the only alternative here?

TIA,

- Steve
