From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [E.Kowallik@tu-bs.de: [linux-lvm] lvm and raw devices (with Oracle 9 RAC)]
Message-ID: <20020722125828.A23420@sistina.com>
References: <20020703195115.E999@portatile.milano.dt> <20020704113000.C9129@sistina.com> <20020719212754.A1121@portatile.milano.dt>
Mime-Version: 1.0
In-Reply-To: <20020719212754.A1121@portatile.milano.dt>; from E.Kowallik@tu-bs.de on Fri, Jul 19, 2002 at 09:27:54PM +0200
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
Date: Mon Jul 22 06:08:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jul 19, 2002 at 09:27:54PM +0200, Eike Kowallik wrote:
> Hello!
> 
> On Thu, Jul 04, 2002 at 11:30:00AM +0200, Heinz J . Mauelshagen wrote:
> > On Wed, Jul 03, 2002 at 07:51:15PM +0200, Eike Kowallik wrote:
> 
> > > Hmm...  nobody can give me a hint? Are my problems and my questions
> > > so strange??
> > 
> > No, it is because we are all at the beach ;-)
> 
> Oh, sorry, I didn't know... ;-)
> 
> 
> > You are using a rather old LVM version. In case you can afford an upgrade
> > to LVM 1, your problem will be gone.
> 
> Yes, now the following command works here without any problems! :-))
> 
> > # raw -qa
> > /dev/raw/raw1:  bound to major 58, minor 0
> > dd if=/dev/raw/raw1 of=/dev/null bs=512 count=10
> > 10+0 records in
> > 10+0 records out
> 
> Before I wrote my first email to this list I had read the CHANGELOG,
> because I hadn't found any hint for my problem. Now, knowing the
> solution, I would like to understand the problem - a little bit. ;-)
> Which fix made the above command work?

We had 1024 byte minimal block sizes earlier.
Recent versions are back to 512 byte :)

> 
> Of course, this isn't a real important thing...
> 
> 
> > Heinz    -- The LVM Guy --
> 
> Thanks a lot, Heinz! Bye, Eike
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
