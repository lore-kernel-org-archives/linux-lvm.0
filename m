Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i32Mgvj14505
	for <linux-lvm@redhat.com>; Fri, 2 Apr 2004 17:42:57 -0500
Received: from mwinf0403.wanadoo.fr (smtp4.wanadoo.fr [193.252.22.27])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i32Mgujj015902
	for <linux-lvm@redhat.com>; Fri, 2 Apr 2004 17:42:56 -0500
Subject: Re: [linux-lvm] root on lvm
From: Garcia Pascal <dld.pascal.garcia@wanadoo.fr>
In-Reply-To: <1080073262.2189.16.camel@pascal>
References: <1079478024.2432.9.camel@rich>
	<1079705946.29353.6.camel@tesla.mmt.bellhowell.com>
	<1079729272.2126.12.camel@pascal> <1079922026.2361.7.camel@localhost>
	<20040323192451.GE24728@percy.comedia.it>
	<1080073262.2189.16.camel@pascal>
Message-Id: <1080945751.2422.9.camel@pascal>
Mime-Version: 1.0
Date: Sat, 03 Apr 2004 00:42:32 +0200
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Here is the test I have been doing. Sory but I have to translate the
french message then they will bot be exact.
Installing Mandrake,
When partitionning I ask for personal, then for expert.
- hda1 : LVM for linuw.
- Add to vg rootvg
In root vg
- 1rst partition / 3000 mb reiserfs
- 2nd partition swap 1500 mb
- 3rd partition 15000 mb

rest of the vg unaffected.

All installation went well until stage : installation of boot manager.
Then a window came saying 
=================================
L'installation du programme d'amor�age a �chou�
pour la raison suivante
: Fatal: Sorry, don't know how to handle device 0xfe00
=================================

That means : The installation of the boot loader failed because of the
following reason : Fatal ...

And of corse the system is not able to boot!

Regards

Pascal Garcia

Le mar 23/03/2004 � 21:21, Garcia Pascal a �crit :
> Hello
> I do not know what the problem is.
> May be the problem has nothing to see with lvm!
> I reinstalled0 the system two times with the same problem. In fact there
> is a warning when configuration lilo at installation time.
> 
> As I did not have that much time to analyse and solve the problem (if I
> would have been able to), I just made a / reisefs partition, and the
> problem went away.
> 
> I have a remark on that, / partition in a logical volume without
> reiserfs (or a fs that can be resized without unmounting) is non sense
> for me, because one can not unmount / partition, and one of the interest
> of the lvm is to adapt the size of a partition when needed.
> 
> I have a spare disk and when I have some time and my General let me do
> it, I reinstall the system and write all the problems. May be this
> week-end.
> 
> regards
> Pascal garcia
> 
> 
> Le mar 23/03/2004 � 20:24, Luca Berra a �crit :
> > On Sun, Mar 21, 2004 at 09:20:26PM -0500, Jeff Layton wrote:
> > >My solution for this (so far) is to make a non-LVM2 /boot partition and
> > >store a kernel and initrd in that. You can then build everything else as
> > >a LVM partition. Perhaps when the available bootloaders become LVM2
> > >aware we'll be able to do away with a seperate /boot, but for now it
> > >seems to be the best way to deal with it.
> > >Cheers,
> > >-- Jeff
> > >
> > >
> > >On Fri, 2004-03-19 at 15:47, Garcia Pascal wrote:
> > >> Hello,
> > >> I experienced also difficulties with / and lvm2.
> > >> configuration: 
> > >>    MANDRAKE 10.0, 
> > >>    kernel 2.6.3, 
> > >>    lilo 22.5.8, 
> > >>    reiserfs 3.6.11 ?
> > >>    lvm 2.00.08
> > 
> > lilo on mandrake 10.0 is lvm2 aware.
> > i don't know if there are reiserfs related problems that affect Pascal
> > configuration.
> > 
> > L.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
