Return-Path: <neilm@foobarhouse.com>
Message-ID: <008101c11f46$cb4a4ae0$6601a8c0@foobarhouse.com>
From: "Neil Macvicar" <neilm@foobarhouse.com>
References: <20010807153154.P495@hogia.net>
Subject: Re: [linux-lvm] Two computers with one shared array?
Date: Tue, 7 Aug 2001 14:42:25 +0100
MIME-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

hmm.. on HP, the LVM system lets you exclusively activate a VG.. does Linux
LVM allow you to do this ?

----- Original Message -----
From: "Sebastian Andersson" <sa@hogia.net>
To: <linux-lvm@sistina.com>
Sent: Tuesday, August 07, 2001 2:31 PM
Subject: [linux-lvm] Two computers with one shared array?


> I've got two computers connected to a JBOD array.
> On it I've got 3 VGs and a bunch of free disks.
> I'd like to use 2 of the VGs on one of the computers and the
> other VG on the other computer.
>
> Should I still vgscan on both computers at startup and then
> vgchange -a y VG1 VG2 on the first computer and
> vgchange -a y VG3 on the other computer?
>
> Is it safe to vgchange -a n  on both computers or should
> I only vgchange -a n VGx ?
>
> Can I change the LVGs in a VG or do I need to inactivate everything on
> the other computer while I do this and then vgscan after I'm done?
>
> Regards,
> /Sebastian
> --
>                              .oooO o,o Oooo.           Sex,
>                              (   ) \_/ (   )      (o_   Drugs
> "Life is not fair, but root   \ (  /|\  ) / (o_   //\    and
> password helps!" -- The BOFH   \_)     (_/  (/)_  V_/_    UNIX.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
