From: "Jonathan DeHaan" <jdehaan@home.com>
Subject: RE: [linux-lvm] lvcreate is segfaulting
Date: Sun, 9 Sep 2001 12:58:37 -0400
Message-ID: <000101c13950$ab0e69e0$0400a8c0@ci696011a.lxintn1.ky.home.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20010908214133.88257.qmail@web13908.mail.yahoo.com>
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

I had the same problem - it was fixed when I configured
with --enable-static_link.

Jonathan DeHaan
jdehaan@home.com

> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of William Vadnais
> Sent: Saturday, September 08, 2001 5:42 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] lvcreate is segfaulting
>
>
>
> [root@mp3gimp /root]# lvcreate -L6G -nnew -v test
> lvcreate -- checking volume group name "test"
> lvcreate -- checking volume group existence
> lvcreate -- checking volume group activity
>  [other verbosity removed]
> lvcreate -- setting up logical volume
> lvcreate -- setting read ahead sectors
> lvcreate -- creating logical volume VGDA in kernel
> Segmentation fault (core dumped)
>
> >>>>>>>>>>>>>>>>>>>>>>>>>>>
>
> [root@mp3gimp linux]# dmesg | ksymoops
> No modules in ksyms, skipping objects
> Warning (read_lsmod): no symbols in lsmod, is
> /proc/modules a valid lsmod file?
> cpu: 0, clocks: 997540, slice: 498770
>   Receiver lock-up bug exists -- enabling work-around.
> ds: no socket drivers loaded!
>
> 2 warnings issued.  Results may not be reliable.
>
> >>>>>>>>>>>>>>>>>>>>>>>>>>>>
>
> LVM is compiled directly into kernel, not as a module.
>
> I did remove completely the tools from the non CVS
> version and then reinstalled LVM from the CVS source
> (i did this previously, not just now ;)
>
> [root@mp3gimp src]# strings /sbin/lvcreate | grep CVS
> liblvm-10.so.CVS
> Logical Volume Manager CVS
> Heinz Mauelshagen, Sistina Software  CVS_DATE
> [root@mp3gimp src]#
>
> Thanks for the help, btw, it is much appreciated.
>
> Cheers,
> -Willie
>
>
> --- svetljo <galia@st-peter.stw.uni-erlangen.de>
> wrote:
> > my mistake
> >
> > have you tried
> > lvcreate -L6G -nnew -v test
> > and you did installed the tools and lib form the cvs
> > tree
> >
> > is there smth  in "demsg | ksymoops"
> >
> > William Vadnais wrote:
> >
> > >it was a typo on my part. The patch is installed
> > >correctly. I don't have a /proc/lvm/general, but
> > here
> > >is /proc/lvm/global:
> > >
> > >[root@mp3gimp lvm]# ls /proc/lvm
> > >global  VGs
> > >[root@mp3gimp lvm]# cat /proc/lvm/global
> > >LVM driver LVM version CVS(CVS_DATE)
> > >
> > >Total:  1 VG  1 PV  0 LVs (0 LVs open)
> > >Global: 3167 bytes malloced   IOP version: 10
> > >5:49:19 active
> > >
> > >VG:  test  [1 PV, 0 LV/0 open]  PE Size: 4096 KB
> > >  Usage [KB/PE]: 8949760 /2185 total  0 /0 used
> > >8949760 /2185 free
> > >  PV:  [AA] sdb                    8949760 /2185
> >
> > >    0 /0        8949760 /2185
> > >    LVs: none
> > >[root@mp3gimp lvm]#
> > >
> > >
> > >--- svetljo <galia@st-peter.stw.uni-erlangen.de>
> > >wrote:
> > >
> > >>>
> > >>>dir then a cd /usr/src/linux and a patch < p1
> > using
> > >>>
> > >>that's a typo i couldn't be misstaken ?
> > >>
> > >>you could do
> > >>
> > >>.... ; cd PATCHES ;make ; cat lvm-CVS-2.4.9.patch
> > |
> > >>patch -p1 -d
> > >>/usr/src/linux
> > >>
> > >>and what tells  " cat /proc/lvm/general " , could
> > >>you attach it
> > >>
> > >>
> > >>_______________________________________________
> > >>linux-lvm mailing list
> > >>linux-lvm@sistina.com
> >
> >>http://lists.sistina.com/mailman/listinfo/linux-lvm
> > >>read the LVM HOW-TO at
> > >>
> > >http://www.sistina.com/lvm/Pages/howto.html
> > >
> > >
> > >__________________________________________________
> > >Do You Yahoo!?
> > >Get email alerts & NEW webcam video instant
> > messaging with Yahoo! Messenger
> > >http://im.yahoo.com
> > >
> > >_______________________________________________
> > >linux-lvm mailing list
> > >linux-lvm@sistina.com
> > >http://lists.sistina.com/mailman/listinfo/linux-lvm
> > >read the LVM HOW-TO at
> > http://www.sistina.com/lvm/Pages/howto.html
> > >
> >
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at
> http://www.sistina.com/lvm/Pages/howto.html
>
>
>
> __________________________________________________
> Do You Yahoo!?
> Get email alerts & NEW webcam video instant messaging with Yahoo!
> Messenger
> http://im.yahoo.com
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
