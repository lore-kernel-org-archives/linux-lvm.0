Return-Path: <michael@auctionwatch.com>
Message-ID: <5179B27750A9D411B968009027E06E27012D729A@exback.corp.auctionwatch.com>
From: "Michael S. Fischer" <michael@auctionwatch.com>
Subject: RE: [linux-lvm] Data loss - vg gone
Date: Tue, 5 Jun 2001 20:44:37 -0700 
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Jens Benecke ' <lvm@jensbenecke.de>, "''linux-lvm@sistina.com' '" <linux-lvm@sistina.com>

Jens,

Actually, I managed to recover the volume by using vgcfgrestore.  After =
I
restored the VGDA the filesystem came right back up.

Many thanks to he LVM team for making sure the metadata is backed up! =
:-)

--Michael

-----Original Message-----
From: Jens Benecke
To: 'linux-lvm@sistina.com'
Sent: 6/5/01 4:07 PM
Subject: Re: [linux-lvm] Data loss - vg gone

On Tue, Jun 05, 2001 at 12:47:37PM -0700, Michael S. Fischer wrote:
> Hello,
>=20
> vgscan found no volumes (and vgdisplay reports none), but according =
to
> pvscan the physical volume signature is still there.  If I try to
> recreate the volume I get the error message that the physical volume
> already belongs to the volume group.

Possible solution (worked here):

You need to edit the disk signatures and for each PV, insert all the
_other_ PV signatures in the right place. Go to #lvm on
irc.openprojects.org and bug 'roadrunner', he walked me through this =
and
it
worked. ;)


--=20
Jens Benecke     No Linux user has a 'Microsoft free system'. 'make
config'
                 in the kernel configuration was originally written by =
a
MS
		 employee.
http://www.hitchhikers.de/ - Die kostenlose Mitfahrzentrale f=FCr ganz
Europa
