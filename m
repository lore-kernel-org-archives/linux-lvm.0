Return-Path: <jamesp@foobarhouse.com>
Date: Wed, 25 Jul 2001 23:02:17 +0100 (BST)
From: James Pattinson <jamesp@foobarhouse.com>
Subject: Re: [linux-lvm] pvversion failure
In-Reply-To: <20010725214800.D27765@sistina.com>
Message-ID: <Pine.LNX.4.33.0107252259460.1483-100000@greebo.foobarhouse.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi

Well, I booted into my rescue partition, which has no devfs. Using kernel
2.4.7 and beta8 patch but with beta7 tools, the pvversion command gave the
same error. I'm rather confused now  - I must admit I thought that would
work around the problem - because long devfs names have caused me
problems in the past.

Any more ideas? I could just re-create my VG again like I usually do, but
that's quite a task since I have LVM-on-root.

James

On Wed, 25 Jul 2001, Heinz J . Mauelshagen wrote:

> On Wed, Jul 25, 2001 at 05:11:42PM +0100, James Pattinson wrote:
> > Oops - hate to reply to my own message, but I just noticed the -1 in my
> > pvversion command. To clarify, I get the same behaviour if I use -2 as
> > well.
>
> Yes, I guessed that already.
>
> My guess is, that the long device pathes trigger a regex bug we didn't hit
> during our tests.
>
> Could you switch devfs of and retry pvversion in order
> to work around that assumed flaw?
>
> >
> > James
> >
> > On Wed, 25 Jul 2001, James Pattinson wrote:
> >
> > > Hi
> > >
> > > Trying to upgrade from beta7 to beta8. I have 2 PVs, neither of which are
> > > empty, that belong to a single VG, vg00.
> > >
> > > When trying to upgrade the PVs to version 2, I get:
> > >
> > > ./pvversion -1 /dev/ide/host2/bus0/target0/lun0/part1
> > > pvversion -- created dummy LV "/dev/vg00/pvversionpart19519" on empty PV
> > > "/dev/ide/host2/bus0/target0/lun0/part1"
> > > pvversion -- ERROR: pv_display() failed again
> > > pvversion -- giving up on "/dev/ide/host2/bus0/target0/lun0/part1"
> > >
> > > [root@greebo tools]# lvmdiskscan | grep LVM
> > > lvmdiskscan -- /dev/ide/host2/bus0/target0/lun0/part1  [      16.02 GB]
> > > Primary  LVM partition [0x8E]
> > > lvmdiskscan -- /dev/ide/host2/bus1/target0/lun0/part1  [      16.02 GB]
> > > Primary  LVM partition [0x8E]
> > > lvmdiskscan -- 2 LVM physical volume partitions
> > > [root@greebo tools]#
> > >
> > > It seems the pvversion program thinks my PV is empty, and tries to create
> > > a dummy LV on it. But of course it's not empty.
> > >
> > > I created my PVs, VG and LVs using beta7 kernel and tools not too long
> > > ago. Im using devfs as you can see.
> > >
> > > Any ideas?
> > >
> > > James
> > >
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
>
