Date: Thu, 31 Aug 2000 23:51:00 +0200
From: Nils Juergens <nils@muon.de>
Subject: Re: [linux-lvm] ExChange of Harddisks
Message-ID: <20000831235100.A320@guldukat.muon>
References: <30657.967667781@www17.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <30657.967667781@www17.gmx.net>; from a.kloecker@gmx.net on Wed, Aug 30, 2000 at 10:36:21PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@msede.com

On Wed, 30.08.00, Arne Kl=EF=BF=BDcker <a.kloecker@gmx.net> wrote:
> > If i understand your setup right you can just move the physical
> > extents from your IDE-Drive to the SCSI-Drives. You do this with
> > "pvmove <device>", <device> being the physical volume you want to
> > remove.
> I did this, but it stopped with an Error 208 leaving 1 PE on the IDE
> Disk...

Well, i had similar problems with pvmove before, but was to lazy to work
it out. But if you post some strace/debug output we might be able to
track this down. Might be some work but being able to clean PVs to
remove them is quite important, IMHO.

'later,

Nils

--=20
 >   Nils Juergens  | nils@muon.de | icq 7090774   <
 >  If we all work hard, we can turn this company  <
 >      around 360 degrees -- gruntbert(LOTD)      <
