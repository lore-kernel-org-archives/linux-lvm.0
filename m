content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] Snapshot creating problem
Message-ID: <08628CA53C6CBA4ABAFB9E808A5214CB0142B4B9@mercury.infiniconsys.com>
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
Date: Mon Mar 17 15:58:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

It's odd, I pulled down the 'device-mapper-latest.tgz' from the sistina =
ftp site just last week, but the code in my dm-snapshot.c is different =
that this:
if (persistent !=3D 'P' && persistent !=3D 'N') {
                        ^^
        ti->error =3D "Persistent flag is not P or N"

Mine looks like

if ((*persistent & 0x5f) !=3D 'P' && (*persistent & 0x5f) !=3D 'N') {


Can you please point to to the 'best' patch, and I'll just start all =
over.


Thanks for all of your help,

--
Christopher Barry
Manager of Information Systems
InfiniCon Systems
http://www.infiniconsys.com

-----Original Message-----
From: Alasdair G Kergon [mailto:agk@uk.sistina.com]
Sent: Monday, March 17, 2003 2:23 PM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] Snapshot creating problem


On Mon, Mar 17, 2003 at 02:00:36PM -0500, Barry, Christopher wrote:
> Mar 17 12:47:16 debian kernel: device-mapper: internal error adding =
target to table

That's a (known) misleading error message - it's no longer necessarily
an error internal to the kernel, but can be caused by invalid=20
parameters being supplied to a device-mapper target.

> To give you more info I need some instructions on how to get you the =
debug output.
See previous messages on this list, WHATS_NEW file, example.conf,=20
lvm.conf man page etc.

e.g. Use a config file containing:

  log {
        file=3D'/tmp/lvm2.log'
        level=3D7
        overwrite=3D0
  }

And remember to say exactly which kernel patches you applied.
[The device-mapper version number is not sufficient because=20
people have produced patches that don't update it.]

For example, a set of patches before Xmas had a bug that is=20
known to stop all snapshots from working.
To see if you have that logic bug, check dm-snapshot.c
a little after line 400 - it should have:
  if (persistent !=3D 'P' && persistent !=3D 'N') {
                        ^^
        ti->error =3D "Persistent flag is not P or N";

Alasdair
--=20
agk@uk.sistina.com

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
