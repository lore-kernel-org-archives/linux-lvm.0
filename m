From: James Hawtin <oolon@ankh.org>
Subject: Re: [linux-lvm] vgscan not returning
In-Reply-To: <200209192114.RAA28859@www23.ureach.com>
Message-ID: <Pine.LNX.4.44.0209192137300.5967-100000@pzat.meep.org>
MIME-Version: 1.0
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
Date: Thu Sep 19 17:10:52 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com


On Thu, 19 Sep 2002, Ali Zaidi wrote:

> Hi:
> I am a novice with LVM but after going through the man pages and howtos i was
> unable to find a solution to my problem. I am hoping one of you might find some
> time to point me in the right direction.
>
> I am trying to setup LVM on a RH box. I run vgscan before i can create the
> volumes but it never returns. Same thing happens with lvmdiskscan and pvscan.
> Here is a -v and -d output of vgscan

Ok and now to try to answer your problem....

Did you do a pvcreate?

did the disk have existing data on it?

Try dd to write /dev/zero to the first bit of the partitions you want to
put into lvm. then do you vgscan which should then return with an error
saying it found nothing.... you can then use pvcreate on them

Of course your LAME disk layout could be confusing lvm in which case as a
work arround just have one lvm partion and use lvm to allocate the disk,
which is what you should be doing in the first place!


------

And now a few quick questions and answers....

Q: I can allocate my disk better than LVM!

A: No you cannot! or rather you can allocate your disk when you
first get the machine to produce nice continuous partions. YOU CAN DO THIS
WITH LVM. If you have a brand new volume group and just add partions to
it they will be continuous with LVM as well.... Don't trust LVM.. you can
do a pvdisplay to show you this fact!

A2: Sure, but what happens if you want to remove 2 partions, that are not
next door to each other, and them make the one big partion... with fdisk
its a dd nigtmare... with LVM its easy.

Q: but how can I move my stuff onto another disk... I use DD!

A: SO? There is nothing special about lvm devices apart from the fact they
make things easer for you... You want to work that way, make your new
device using LVM or fdisk and do your dd! But you could save yourself time
by using pvmove!

Q: LVM adds a level of indirection to my disk.. surely its better to use
the real disk
A: Theoritically yes... but the translation to where on the disk is a
calculation done on your computer not on the disk the slowest part of the
operation is pulling stuff from your disk! Think about is a software raid
faster or slower? Its faster cos the slow part was the disk and now there
is more than one disk!

Q: I like to micromanage my disk...
A: You can do that with LVM if you like or you can let LVM do the best it
can for you and use your bonus time to go down the pub.


James
