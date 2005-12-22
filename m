Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBMI7s112057
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 13:07:54 -0500
Received: from dcs.nac.uci.edu (dcs.nac.uci.edu [128.200.34.32])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBMI7pFk030065
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 13:07:51 -0500
Subject: Re: [linux-lvm] Recovery of data in LVM from a corrupt disk
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
In-Reply-To: <20051222072735.85108.qmail@web36208.mail.mud.yahoo.com>
References: <20051222072735.85108.qmail@web36208.mail.mud.yahoo.com>
Date: Thu, 22 Dec 2005 10:07:38 -0800
Message-Id: <1135274858.9164.5.camel@seki.nac.uci.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>


Please allow me to restate what I believe you've just said, in my own
words, to be sure we're understanding each other?

You were finding that because your data was inside of LVM, when your
machine died, you could not just move your disk to another machine that
didn't have LVM to get your data back.

You got past this problem by putting a mini/recovery distribution on a
USB key that does have LVM support, making your data easy to access.

True?

Thanks!

On Wed, 2005-12-21 at 23:27 -0800, Hale India wrote:
> Hi Dan
> 
> Very nice to you to give us this link.
> 
> What I was talking about is a problem for recovery specific to LVM :
> If you machine crash, (not your disk) with ext2, ext3, reiserfs, JFS
> you can put your disk in any other machine as second or third disk
> etc.. and access your data's.
> If you have a LVM : you are in the trap. With reiserfs you have many
> good way to recover. With JFS you can even take advantage of the
> situation to switch to a raid mode.
> 
> For my concern I have now my solution : I start Linux in an USB key
> using ext3 (using SLAX) and if the machine crash I can start  in very
> short term using any else machine. I loose less than 30 mn and no
> data's and for my job 30mn is already a lot.
> 
> LVM is suppose to give better function than ext2 or ext3 etc.
> Sucurity ofd data's is the first priority of disk system and should be
> the very first one for LVM.
> 
> I have personaly daily backup. But many peopl! e have not what must we
> say ?
> For me I just advice them to not use LVM, because they would not have
> a good exit way. (even if you loose only one day it can be a problem).
> I consider that a good disk system should allow to get back data if
> disk is good working. Not only if the whole machine is good working.
> 
> If any people has a good solution they are welcome and I would
> appologize.
> 
> Best regards
> 
> Andre
> 
> 
> 
> Dan Stromberg <strombrg@dcs.nac.uci.edu> wrote:
>         
>         Please see http://dcs.nac.uci.edu/~strombrg/data-recovery.html
>         -
>         especially the link about ext3 and LVM2.
>         
>         On Tue, 2005-12-20 at 23:30 -0800, Hale India wrote:
>         > Hi 
>         > 
>         > I had a recovery problem with LVM before : I failed. I
>         > got no real help from this mailing list.
>         > I finaly succeed to start the disk for a short! term on
>         > another machine and I will never use LVM before to see
>         > succeful recovery process.
>         > Nobody at redhat take care about such problem........
>         > In the future take ext2, ext3, reiserfs and you will
>         > have plenty good recovcery solutions.
>         > 
>         > Sorry to not be able to help you more.
>         > Good luke.
>         > 
>         > Best regards
>         > 
>         > Andre Legendre
>         > 
>         > --- mymail mymail  wrote:
>         > 
>         > > 
>         > > 
>         > > Michael Loftis  wrote: 
>         > > LVM is not a filesystem, it's a block device layer. 
>         > > If you're 
>         > > running/using LVM on the existing system it's vgscan
>         > > and vgchange on 
>         > > startup should have activated all the old LVs/VGs
>         > > and mapped them to 
>         > > /dev/VGNAME/LVNAME -- those are the devices you
>         > > mount.
>         > > Thanks.
>         > > 
>         > >! I realise this. But the disk I'm trying to mount is
>         > > built the same way as the new disk I've built. So
>         > > the both have a VolGroup00. What I would like to do
>         > > is to either understand how I can change the volume
>         > > group info so it will become a distinct volume
>         > > group, and then I can 'import' this into my new
>         > > environment, or how I can get into the block system
>         > > so I can access the filesystem structure it embeds.
>         > > 
>         > > This is where I'm struggling. I would like to create
>         > > a VolGroup01 device file, rename the volume group
>         > > within the physical volume, and then mount that. Is
>         > > it possible to 'hack' the old drive like this?
>         > > 
>         > > 
>         > > __________________________________________________
>         > > Do You Yahoo!?
>         > > Tired of spam? Yahoo! Mail has the best spam
>         > > protection around 
>         > > http://mail.yahoo.com >
>         > _______________________________________________
>         > > linux-lvm mailing list
>         > > linux-lvm@redhat.com
>         > > https://www.redhat.com/mailman/listinfo/linux-lvm
>         > > read the LVM HOW-TO at
>         > http://tldp.org/HOWTO/LVM-HOWTO/
>         > 
>         > _______________________________________________
>         > linux-lvm mailing list
>         > linux-lvm@redhat.com
>         > https://www.redhat.com/mailman/listinfo/linux-lvm
>         > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>         > 
>         
>         _______________________________________________
>         linux-lvm mailing list
>         linux-lvm@redhat.com
>         https://www.redhat.com/mailman/listinfo/linux-lvm
>         read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
