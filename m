From: Andrew Theurer <habanero@us.ibm.com>
References: <3D2F6464.60908@us.ibm.com> <20020715085954.GB3432@fib011235813.fsnet.co.uk>
In-Reply-To: <20020715085954.GB3432@fib011235813.fsnet.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200207150939.15138.habanero@us.ibm.com>
Subject: [linux-lvm] Re: [Announce] device-mapper beta3 (fast snapshots)
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
Date: Mon Jul 15 09:44:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Cc: linux-kernel@vger.kernel.org, linux-lvm@sistina.com

On Monday 15 July 2002 03:59, Joe Thornber wrote:
> Andrew,
>
> On Fri, Jul 12, 2002 at 06:21:08PM -0500, Andrew Theurer wrote:
> > Thanks for the results.  I tried the same thing, but with the latest
> > release (beta 4) and I am not observing the same behavior.  Your resu=
lts
> > show very little difference in performance when using different chunk
> > sizes for snapshots, but I observed a range of 10 to 24 seconds for t=
his
> > same test on beta4 (I have also included EVMS 1.1 pre4):
>
> I must admit your results are strange to say the least, the only
> explanation that I can think of at the moment is that you have been
> running LVM1.
>
> Just to reassure me that this is not the case, can you please make
> sure that the LVM1 driver is not available, and that your path are not
> picking up old LVM1 tools by mistake.  There was a time when the tools
> were installed in /usr/sbin rather than /sbin.

Joe,=20

I assure you this is not LVM1.  I have both tools installed, but they are=
=20
under different directories, and my test scripts call them with full path=
s. =20
I have also done some tracing to verify I am in device-mapper code.  Also=
,=20
the kernel I tested with has only device mapper and evms, no lvm1.=20

-Andrew Theurer
