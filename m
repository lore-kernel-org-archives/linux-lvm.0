From: "Erick Calder" <e@arix.com>
Date: Mon, 17 Sep 2001 16:15:52 -0700
Message-ID: <003801c13fce$b1e19b50$0300000a@pacbell.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20010910133533.J31313@sistina.com>
Subject: [linux-lvm] LVM RPMs
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Heinz,

just a quick status update.  I'm still working on this!

had a little setback as one of the disks on the machine I'd been working on
fried and I haven't had the time to go fix that... meantime I'm continuing
on another machine I have.

my problem is that I want to get something to work on RH7.0 which is still
on the 2.2 kernel.  I would just as soon simplify things and upgrade to 7.1
with a 2.4 kernel but I've read that stuff breaks in the transition and this
is my production box so I don't want to mess with it!

In my attempt I tried Taher's procedure in the chance that I might be able
to get away with not having to distribute the kernel (i.e. just packaging
the utilities and the module) but no dice.  the module complains of
undefined symbols.

so I'm back to square one.  either I resort to packaging the patched kernel
(with all the variance of configuration files) or I upgrade to 7.1 and just
package according to Taher.

In the next few days I will attempt the first of the above choices.
apologies it has taken me so long but I'm not that savvy with this stuff and
it takes me a while to figure things out!

- e r i c k

-----Original Message-----
From:	linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com] On
Behalf Of Heinz J . Mauelshagen
Sent:	Monday, September 10, 2001 4:36 AM
To:	linux-lvm@sistina.com
Subject:	Re: [linux-lvm] ftp.sistina.com down?

On Thu, Sep 06, 2001 at 10:20:26AM -0700, Erick Calder wrote:
> Paul,
>
> I'm putting an RPM together... struggling with the changes between the
2.4.9
> configuration file and the 10+ configuration files that come with RH's
2.4.7
> .src... if you've built RPMs before help is welcome (we can take this
> off-list), otherwise I'll let you know when I've managed to put it
> together... I too have production boxes I don't want to build the tarball
> on.

Erick,

if you have put it together, we'ld be happy to put it onto our ftp server
for everybodies convenience.
Thanks.

Regards,
Heinz    -- The LVM Guy --

>
> - erick
>
> -----Original Message-----
> From:	linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com] On
> Behalf Of Paul Jakma
> Sent:	Thursday, September 06, 2001 10:08 AM
> To:	linux-lvm@sistina.com
> Subject:	Re: [linux-lvm] ftp.sistina.com down?
>
> On Wed, 5 Sep 2001, AJ Lewis wrote:
>
> > It should be up again.  Thanks for letting us know.
>
> excellent...
>
> > > also, are there any RPMS for 1.0.1?
> >
> > Nope.  Either grabbing the source tarball or talking to your distro is
the
> > best option at this point.  The source is not difficult to build and
> install
> > IMHO, so that's probably your best bet for now.
>
> ok.. i've no technical problems with source, but from experience i
> don't like installing from source onto production systems that use
> package management - bad idea for long term maintainability of the
> machine.
>
> anyway.. thanks AJ!
>
> > Regards,
>
> --paulj
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
