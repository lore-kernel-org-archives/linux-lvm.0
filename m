Message-Id: <200209202150.RAA15711@www22.ureach.com>
From: Ali Zaidi <smaliz@ureach.com>
Subject: Re: Re: [linux-lvm] vgscan not returning UPDATE
Mime-Version: 1.0
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
Date: Fri Sep 20 16:50:29 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/Plain; charset="us-ascii"
To: James Hawtin <linux-lvm@sistina.com>

I seem to have LVM working for me now.
This is just so some of you guys can tell me if i have done something horribly 
wrong.
As vgscan was never returning, i did a strace on it and found out that it was 
getting stuck at a read call for /dev/nb0.

As i would only be using /dev/hd devices for LVM, i figured if i can comment 
out references to "nb" from the LVM source, that might do the trick.
I ended up commenting out two lines from tools/lib/lvm_dir_cache.c and one line 
from tools/lib/lvm_check_partitioned_dev.c.
After recompiling, vgscan now returns and i was also able to run pvcreate and 
vgcreate successfully.

As i understand, if i am not going to be using Network Block devices under LVM, 
i should be fine with the above arrangement.

Ali



---- On Thu, 19 Sep 2002, James Hawtin (oolon@ankh.org) wrote:

> 
> 
> On Thu, 19 Sep 2002, Ali Zaidi wrote:
> 
> > Hi:
> > I am a novice with LVM but after going through the man pages and howtos i 
was
> > unable to find a solution to my problem. I am hoping one of you might find 
some
> > time to point me in the right direction.
> >
> > I am trying to setup LVM on a RH box. I run vgscan before i can create the
> > volumes but it never returns. Same thing happens with lvmdiskscan and 
pvscan.
> > Here is a -v and -d output of vgscan
> 
> Ok and now to try to answer your problem....
> 
> Did you do a pvcreate?
> 
> did the disk have existing data on it?
> 
> Try dd to write /dev/zero to the first bit of the partitions you want to
> put into lvm. then do you vgscan which should then return with an error
> saying it found nothing.... you can then use pvcreate on them
> 
> Of course your LAME disk layout could be confusing lvm in which case as a
> work arround just have one lvm partion and use lvm to allocate the disk,
> which is what you should be doing in the first place!
> 
> 
> ------
> 
> And now a few quick questions and answers....
> 
> Q: I can allocate my disk better than LVM!
> 
> A: No you cannot! or rather you can allocate your disk when you
> first get the machine to produce nice continuous partions. YOU CAN DO THIS
> WITH LVM. If you have a brand new volume group and just add partions to
> it they will be continuous with LVM as well.... Don't trust LVM.. you can
> do a pvdisplay to show you this fact!
> 
> A2: Sure, but what happens if you want to remove 2 partions, that are not
> next door to each other, and them make the one big partion... with fdisk
> its a dd nigtmare... with LVM its easy.
> 
> Q: but how can I move my stuff onto another disk... I use DD!
> 
> A: SO? There is nothing special about lvm devices apart from the fact they
> make things easer for you... You want to work that way, make your new
> device using LVM or fdisk and do your dd! But you could save yourself time
> by using pvmove!
> 
> Q: LVM adds a level of indirection to my disk.. surely its better to use
> the real disk
> A: Theoritically yes... but the translation to where on the disk is a
> calculation done on your computer not on the disk the slowest part of the
> operation is pulling stuff from your disk! Think about is a software raid
> faster or slower? Its faster cos the slow part was the disk and now there
> is more than one disk!
> 
> Q: I like to micromanage my disk...
> A: You can do that with LVM if you like or you can let LVM do the best it
> can for you and use your bonus time to go down the pub.
> 
> 
> James
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
> 
