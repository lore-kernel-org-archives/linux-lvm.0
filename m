From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] URgent - please Help - our main system is corrupt, no one can wor k!
Message-ID: <20020610143814.B28341@zealot.blacknet.de>
References: <F47B5C16711BEC4BBB0651C75F724809D5C6@qntsv14.quant.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <F47B5C16711BEC4BBB0651C75F724809D5C6@qntsv14.quant.com>; from G.SchaeferReimers@quant-forum.de on Mon, Jun 10, 2002 at 03:16:53PM +0200
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
Date: Mon Jun 10 08:36:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Mon, Jun 10 '02 at 15:16, Gesine Sch=EF=BF=BDfer-Reimers wrote:
> this is the second mail. I tried it this noon but got no answer so far, b=
ut
> our whole production is down and I really have to fix it.
did not reache the list (AFAICT)
=20
> The system was up and running. I added (with YAST2) one more logical
> volume to the volume group, applied an restarted. The restart ist
> "strange", since only parts of the systems come up.
Most likely it come up in a "something is broken, bplease try to fix it
manualy" state

> For instance the /var directory claims to be mounted but is empty and
> cannot be mounted, for they are not mounted !! In /procs/ not
The mount command takes it's information from /etc/mtap and not from
/proc, so most likely the console message was something like "unable to
run fsck on /dev/bla" please enter root password and try to fix it,
system will reboot after you left the shell.

> [ ... ]
> It looks for me as if the addition of the new logical volume wrote
> some information in a place where it does not belong. Can I recover
> the old state without loosing information?
possible there are backups in /etc/lvmtab.d, but maybe not.

It would realy help, what the system told you when it booted.

A "simple" fix might be to reboot and pray :-/, but this might fu**up
everything.

Unfortunately I've not enough informations to help you further :-(, and
I don't know how stable yast2 is so I can only guess what you might be
able to do to fix anything, but my guesses might be way off.

Cu,
    Goetz.
--
Goetz Bock                                             bock@blacknet.de
IT Consulting                                          Munich   Germany
