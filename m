Message-ID: <3DB93EA0.A96E68B1@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] still problems with removing "non existant" dead 
 snapshots :/
References: <3DB7C2FD.9C70E084@silicide.dk> <20021024132538.A30725@sistina.com> <3DB7DBBA.E24EA2FD@silicide.dk> <20021025143323.B4081@sistina.com>
Content-Transfer-Encoding: 7bit
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
Date: Fri Oct 25 07:53:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

"Heinz J . Mauelshagen" wrote:
> 
> On Thu, Oct 24, 2002 at 01:38:34PM +0200, Jon Bendtsen wrote:
> > "Heinz J . Mauelshagen" wrote:
> > >
> > > Jon,
> > >
> > > which LVM version are you using?
> > > If the driver it is older than 1.0.5 it can be a lockking bug fixed in
> > > the recent LVM1 version.
> >
> > lvm_1.1-rc2.tar.gz on default 2.4.18
> 
> This is a discontinued (and buggy) development version.

Oh ?? i didnt get that impression from the website, and
definately not from
ftp://linux.msede.com/lvm/1.1/README

 
> You should give LVM2 + device-mapper a try or downgrade to 1.0.5.

it's a production server, so i'll downgrade.



JonB
