From: James Hawtin <oolon@ankh.org>
Subject: Re: [linux-lvm] still problems with removing "non existant" dead
 snapshots :/
In-Reply-To: <20021028101305.E16452@sistina.com>
Message-ID: <Pine.LNX.4.44.0210281427290.1432-100000@pzat.meep.org>
MIME-Version: 1.0
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
Date: Mon Oct 28 08:34:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com


On Mon, 28 Oct 2002, Heinz J . Mauelshagen wrote:

> On Fri, Oct 25, 2002 at 01:23:18PM +0000, James Hawtin wrote:
> >
> >
> > On Fri, 25 Oct 2002, Heinz J . Mauelshagen wrote:
> >
> > > You should give LVM2 + device-mapper a try or downgrade to 1.0.5.
> >
> > Hmmm what are the problems with 1.1-rc2? thats the version I am currently
> > running, 1.0.5 I beleive has a problem with pvmove > 2 gig? or am I
> > rembering the wrong version.
>
> No, there's no such problem in 1.1.

no no I ment is there a pvmove greater than 2 gig problem with 1.0.5? I
seem to rember that was why i upgraded to 1.1-rc2

>
> It is just an intermediate development version which got replaced by
> LVM2/device-mapper.
>
> Use that combination if you want stable, cutting-edge Linux LVM :)
>

Cutting or Bleeding edge?

How painful is the upgrade from 1.1-rc2 to the 2 series (which I have not
tried yet). Does it require a complete lvm system rebuild or can it use my
old pvs, vgs? Which version is the best to go for? Ie any "known problems"
why I should not use the latest....

James
