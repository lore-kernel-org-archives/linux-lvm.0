From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] still problems with removing "non existant" dead snapshots :/
Message-ID: <20021028101115.D16452@sistina.com>
References: <3DB7C2FD.9C70E084@silicide.dk> <20021024132538.A30725@sistina.com> <3DB7DBBA.E24EA2FD@silicide.dk> <20021025143323.B4081@sistina.com> <3DB93EA0.A96E68B1@silicide.dk>
Mime-Version: 1.0
In-Reply-To: <3DB93EA0.A96E68B1@silicide.dk>; from jon+lvm@silicide.dk on Fri, Oct 25, 2002 at 02:52:48PM +0200
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
Date: Mon Oct 28 03:14:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Oct 25, 2002 at 02:52:48PM +0200, Jon Bendtsen wrote:
> "Heinz J . Mauelshagen" wrote:
> > 
> > On Thu, Oct 24, 2002 at 01:38:34PM +0200, Jon Bendtsen wrote:
> > > "Heinz J . Mauelshagen" wrote:
> > > >
> > > > Jon,
> > > >
> > > > which LVM version are you using?
> > > > If the driver it is older than 1.0.5 it can be a lockking bug fixed in
> > > > the recent LVM1 version.
> > >
> > > lvm_1.1-rc2.tar.gz on default 2.4.18
> > 
> > This is a discontinued (and buggy) development version.
> 
> Oh ?? i didnt get that impression from the website, and
> definately not from
> ftp://linux.msede.com/lvm/1.1/README

Sorry, we'll change that.

> 
>  
> > You should give LVM2 + device-mapper a try or downgrade to 1.0.5.
> 
> it's a production server, so i'll downgrade.

Ok.

> 
> 
> 
> JonB
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
