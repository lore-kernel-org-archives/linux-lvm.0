Message-ID: <3BF2C1F9.197C1D2C@divsol.com>
From: Jim Cromie <jcromie@divsol.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] patch to fix segfault complaints.
References: <3BF14F8E.477BC73E@divsol.com> <20011114013315.A3564@tiger.bigcats.invalid>
Content-Transfer-Encoding: 7bit
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
Date: Wed Nov 14 13:10:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Wolfgang Weisselberg <weissel@netcologne.de>, "linux-lvm@sistina.com" <linux-lvm@sistina.com>

Wolfgang Weisselberg wrote:

> Hi, Jim!
>
> Jim Cromie (jcromie@divsol.com) wrote 62 lines:
>
> > [root@groucho 1.0.1-rc4]# diff -u configure configure~
> > --- configure Tue Nov 13 09:35:54 2001
> > +++ configure~ Thu Sep  6 07:02:34 2001
> > @@ -796,33 +796,22 @@
>
> This patch seems reversed...
>
> -Wolfgang

yes, I suppose it is, judging from the --- and +++ associated with ARGS.

but before its used, Id like to see discussion on;

whether its accurate enough wrt 2.96-85 or -O1
whether compiler / vendor / phase-of-moon accomodations are appropriate.

how to do it better.

in other words, it probably wont be applied to CVS unless and until
tested by us (the users) ..

so -

did you reverse apply it ? successfully ?
did you formerly have a segfault problem due to -O2 ?  does -O1 fix it
for you ?
