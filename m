Return-Path: <mauelshagen@sistina.com>
Date: Tue, 14 Aug 2001 15:56:36 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pvversion failure
Message-ID: <20010814155636.A25027@sistina.com>
References: <20010725214800.D27765@sistina.com> <Pine.LNX.4.33.0107261201440.5702-100000@greebo.foobarhouse.com>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.33.0107261201440.5702-100000@greebo.foobarhouse.com>; from jamesp@foobarhouse.com on Thu, Jul 26, 2001 at 12:07:09PM +0100
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jul 26, 2001 at 12:07:09PM +0100, James Pattinson wrote:
> Hi Heinz
> 
> Fixed it now - it was a different flaw I'm afraid!
> 
> Line 96 of pvversion takes the first 33 lines of the output of pvdisplay
> to determine the PE something or other, and on my system with 15 LVs, you
> get no PE info in the first 33 lines!
> 
> Changing this value to 36 solved the problem. However I suggest a value of
> 300 or so to allow for the maximum number of 256 LVs. Was this a dirty
> hack? :-)

Kind of looks like one, doesn't it ;-)
It is changed in CVS.

Heinz

> 
> Cheers
> 
> James
> 
>  On Wed, 25 Jul 2001, Heinz J . Mauelshagen wrote:
> 
> > On Wed, Jul 25, 2001 at 05:11:42PM +0100, James Pattinson wrote:
> > > Oops - hate to reply to my own message, but I just noticed the -1 in my
> > > pvversion command. To clarify, I get the same behaviour if I use -2 as
> > > well.
> >
> > Yes, I guessed that already.
> >
> > My guess is, that the long device pathes trigger a regex bug we didn't hit
> > during our tests.
> >
> > Could you switch devfs of and retry pvversion in order
> > to work around that assumed flaw?
> >
> > >
> > > James
> > >
> > > On Wed, 25 Jul 2001, James Pattinson wrote:
> > >
> > > > Hi
> > > >
> > > > Trying to upgrade from beta7 to beta8. I have 2 PVs, neither of which are
> > > > empty, that belong to a single VG, vg00.
> > > >
> > > > When trying to upgrade the PVs to version 2, I get:
> > > >
> > > > ./pvversion -1 /dev/ide/host2/bus0/target0/lun0/part1
> > > > pvversion -- created dummy LV "/dev/vg00/pvversionpart19519" on empty PV
> > > > "/dev/ide/host2/bus0/target0/lun0/part1"
> > > > pvversion -- ERROR: pv_display() failed again
> > > > pvversion -- giving up on "/dev/ide/host2/bus0/target0/lun0/part1"
> > > >
> > > > [root@greebo tools]# lvmdiskscan | grep LVM
> > > > lvmdiskscan -- /dev/ide/host2/bus0/target0/lun0/part1  [      16.02 GB]
> > > > Primary  LVM partition [0x8E]
> > > > lvmdiskscan -- /dev/ide/host2/bus1/target0/lun0/part1  [      16.02 GB]
> > > > Primary  LVM partition [0x8E]
> > > > lvmdiskscan -- 2 LVM physical volume partitions
> > > > [root@greebo tools]#
> > > >
> > > > It seems the pvversion program thinks my PV is empty, and tries to create
> > > > a dummy LV on it. But of course it's not empty.
> > > >
> > > > I created my PVs, VG and LVs using beta7 kernel and tools not too long
> > > > ago. Im using devfs as you can see.
> > > >
> > > > Any ideas?
> > > >
> > > > James
> > > >
> > > > _______________________________________________
> > > > linux-lvm mailing list
> > > > linux-lvm@sistina.com
> > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > > >
> > >
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
> >
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
