From: Wolfgang Weisselberg <weissel@netcologne.de>
Message-ID: <20011025013135.C1502@tiger.bigcats.invalid>
References: <B45465FD9C23D21193E90000F8D0F3DF0178FF87@mailsrv.linkvest.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <B45465FD9C23D21193E90000F8D0F3DF0178FF87@mailsrv.linkvest.com>; from Jean-Eric.Cuendet@linkvest.com on Wed, Oct 24, 2001 at 05:31:44PM +0200
Subject: [linux-lvm] OT: Tainted flag in Kernels (explanation) (was: Kernel 2.4.12 bug?)
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
Date: Wed Oct 24 18:51:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, Jean-Eric!

Jean-Eric Cuendet (Jean-Eric.Cuendet@linkvest.com) wrote 1 lines:

> > > The tainted flag is set because the
> > > vfat module I think. Kernel says: no license, will taint the kernel (or
> > > similar to this).

> > Aha, I'd heard there were a few of those :-(

> Could you please explain in more details what are those license things
> and taint things?

There are modules for which there is no source code available.
While it's OK to use these modules[1] it is absolutely
impossible to debug kernels with these modules inserted.
(And there's no reason for the open source community to
debug closed source which uses the open source in that rather
intimate way.)

Thus the kernel gains a 'tainted' flag and any oops report
will show that fact, saving the developers a heap of time
'cause they won't have to chase e.g. vmware bugs.

As some modules have no or misleading license information,
they get tainted as well, until the information has been added.

-Wolfgang

[1] vmware comes to mind, but several graphics cards etc. do
    the same dance
