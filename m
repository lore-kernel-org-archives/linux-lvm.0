Message-ID: <001501c15a54$bd60b970$13c4cccb@adsting.linux>
From: "stingtaogiga" <stingtao@giga.net.tw>
References: <000701c159a3$33ddcdc0$5300a8c0@adsting.linux> <20011021141346.B1096@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: can't pvcreate more than 64 dasds on Linux/390
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
Date: Sun Oct 21 12:15:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: mauelshagen@sistina.com
Cc: linux-lvm@sistina.com

I don't know if that patch is the key....
I also heard that the kernel level(2.2.19) I use has already supported
dynamic major number...
Actually, I can format and mount those disk with major number 254
individually all right. Just couldn't pvcreate with them.
Any other advise?

----- Original Message -----
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
To: "stingtaogiga" <stingtao@giga.net.tw>
Cc: <mge@sistina.com>
Sent: Sunday, October 21, 2001 8:13 PM
Subject: Re: can't pvcreate more than 64 dasds on Linux/390


> On Sun, Oct 21, 2001 at 04:10:02AM +0800, stingtaogiga wrote:
> > Dear sir,
> >     I am using lvm-0.9.1_beta7-1 with TurboLinux6.5(2.2.19) over IBM
> > mainframe S/390. I tried to pvcreate 200 dasds(disks) together, than
I'll
> > make them a vg, totally disk space around 500G.
> >     I can work with dasds whose major number is 94 (that is, 64 dasds in
> > total)all right. However, I fails to pvcreate those dasds whose major
number
> > is 253, 252.... The message is:
> >
> > [root@host96 block]# pvcreate /dev/dasdb[st]1
> > pvcreate -- invalid physical volume name "/dev/dasdbs1"
> >
>
> Well, there's a patch from IBM which should be in the LVM archives to
support
> dynamic additional major in order to work around this constraint.
>
> Not the future Linux 2.5 concept though, where minors won't be limited
> to 8 bit any longer. That's the way we want to support it BTW.
>
> >     I traced lvm kernel source and found that in
> > /usr/src/linux-2.2.19/include/linux/major.h, only dasd with major number
94
> > is defined. I think that's the reason pvcreate thought those dasds are
> > invalid. Would you advise how to get around this situation?
> >
> > ps. I am tring to subscribe to the mailing list but fails....that's why
I
> > send you email directly....
>
> Could you send mail to blutgens@sistina.com including the particular
problem
> dexription of your subscription try. He should be able to help you
> to get subscribed then.
>
> --
>
> Regards,
> Heinz    -- The LVM Guy --
>
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
>
>
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-
>
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
>
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-
