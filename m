From: Donald Thompson <dlt@lunanet.biz>
Subject: Re: [linux-lvm] 2.4.20-pre4 and lvm-1.0.5
In-Reply-To: <20020827091844.B20836@sistina.com>
Message-ID: <Pine.LNX.4.44.0208271022040.20666-100000@junior.lunanet.biz>
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
Date: Tue Aug 27 11:27:39 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, 27 Aug 2002, Heinz J . Mauelshagen wrote:

> On Mon, Aug 26, 2002 at 12:21:52PM -0600, Donald Thompson wrote:
> >
> > That is correct. I boot, vgscan fails (I'm assuming it segfaults but I
> > really can't tell during the normal boot process what actually happened)
> > to detect my VGs, my system goes into a maintenance mode situation since
> > my /usr is on an LV, I login and run lsmod and absolutely no modules
> > appear in the list. I try vgscan and/or pvscan and they fail with a
> > segmentation fault. So yeah, if no module tree exists system boots fine,
> > if module tree exists vgscan fails regardless of whether modules are
> > loaded. Yes it defies logic, but I swear thats how it worked:)
>
> I wonder if there might be a single user case disabling lsmod to list?

Well I doubt that. Originally rtc.o was being loaded and was listed by
lsmod, so I figured maybe that was the problem. rtc.o gets loaded I think
automatically when my system is setting the software clock from the
hardware. But removing rtc.o from the module tree, running depmod -a, and
rebooting, I got the same result where vgscan segfaults.

-Don
