From: Andrew Theurer <habanero@us.ibm.com>
Subject: Re: [linux-lvm] Re: [Announce] device-mapper beta3 (fast snapshots)
References: <3D2F6464.60908@us.ibm.com> <02071513565400.06209@boiler> <20020716084234.GA431@fib011235813.fsnet.co.uk>
In-Reply-To: <20020716084234.GA431@fib011235813.fsnet.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200207161105.49328.habanero@us.ibm.com>
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
Date: Tue Jul 16 11:11:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Joe Thornber <joe@fib011235813.fsnet.co.uk>, Kevin Corry <corryk@us.ibm.com>
Cc: linux-lvm@sistina.com, linux-kernel@vger.kernel.org

> I don't believe the benchmarks posted at the top of this thread at
> all.  Not only are you claiming poor performance for device-mapper,
> but that this performance degrades as chunk size reduces.
> device-mapper has been tested by a variety of people on many different
> machines/architectures and we've only ever seen a flat performance
> profile as chunk size increases, if anything, there is a very slight
> degradation as chunk size gets too large.

Joe, a couple of things occurred to me.  When you sent out the email abou=
t=20
device-mapper beta 3 (22/5/2002), and more specifically the user tools 95=
=2E07,=20
your results http://people.sistina.com/~thornber/snap_performance.html st=
ate=20
that the default chunk size is 8k.   This is not the case as the code for=
=20
95.07 shows it is 32k:

static int _read_params(struct lvcreate_params *lp, struct cmd_context *c=
md,
                        int argc, char **argv)
{
        /*
         * Set the defaults.
         */
        memset(lp, 0, sizeof(*lp));
        lp->chunk_size =3D 2 * arg_int_value(cmd, chunksize_ARG, 32);
        log_verbose("setting chunksize to %d sectors.", lp->chunk_size);

        if (!_read_name_params(lp, cmd, &argc, &argv) ||
            !_read_size_params(lp, cmd, &argc, &argv) ||
            !_read_stripe_params(lp, cmd, &argc, &argv))
                return 0;

And more importantly, I also could not successfully set the chunksize opt=
ion=20
with "-c" or "--chunksize" on 95.07.  I did not chase down the error, rat=
her=20
just changed the default size myself and then ran.  Since you had many pe=
ople=20
test this, is it possible the chunksize did not change at all, and they w=
ere=20
at 32k all the time?  That would explain why these results are flat, whil=
e I=20
am getting a wider range. =20

Now, this option does work in beta4, so obviously someone working on LVM2=
 knew=20
about it and fixed it.  I am wondering have any of your testers run on be=
ta4?

> For instance I just ran a test on my dev. box, this should
> not be considered a tuned benchmark by any means.
>
> dbench -2 on a 32M RAM system:
>
> no snapshot=098.22
> 8k=09=0913.59
> 16k=09=0913.99
> 32k=09=0913.33
> 64k=09=0912.90
> 128k=09=0913.442
> 256k=09=0913.654
> 512k=09=0913.84

Joe, are you absolutely sure these tests had the disk cache disabled?  Th=
at's=20
the only hardware thing I can think of that would make a difference. =20

It seems we can go 'round and 'round to no end, as long as we have HW=20
differences, so I have asked for use on a OSDL system we can both run on.=
=20
This way there is no difference in our HW.  I'll let you know when I hear=
=20
back from them, so we can both test on the same system (if you want to).

-Andrew Theurer
