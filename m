From: Eike Kowallik <E.Kowallik@tu-bs.de>
Subject: Re: [E.Kowallik@tu-bs.de: [linux-lvm] lvm and raw devices (with Oracle 9 RAC)]
Message-ID: <20020719212754.A1121@portatile.milano.dt>
References: <20020703195115.E999@portatile.milano.dt> <20020704113000.C9129@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020704113000.C9129@sistina.com>; from mauelshagen@sistina.com on Thu, Jul 04, 2002 at 11:30:00AM +0200
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
Date: Fri Jul 19 14:31:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Eike Kowallik <E.Kowallik@tu-bs.de>

Hello!

On Thu, Jul 04, 2002 at 11:30:00AM +0200, Heinz J . Mauelshagen wrote:
> On Wed, Jul 03, 2002 at 07:51:15PM +0200, Eike Kowallik wrote:

> > Hmm...  nobody can give me a hint? Are my problems and my questions
> > so strange??
> 
> No, it is because we are all at the beach ;-)

Oh, sorry, I didn't know... ;-)


> You are using a rather old LVM version. In case you can afford an upgrade
> to LVM 1, your problem will be gone.

Yes, now the following command works here without any problems! :-))

> # raw -qa
> /dev/raw/raw1:  bound to major 58, minor 0
> dd if=/dev/raw/raw1 of=/dev/null bs=512 count=10
> 10+0 records in
> 10+0 records out

Before I wrote my first email to this list I had read the CHANGELOG,
because I hadn't found any hint for my problem. Now, knowing the
solution, I would like to understand the problem - a little bit. ;-)
Which fix made the above command work?

Of course, this isn't a real important thing...


> Heinz    -- The LVM Guy --

Thanks a lot, Heinz! Bye, Eike
