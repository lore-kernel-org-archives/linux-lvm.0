Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2NKLBj04898
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 15:21:11 -0500
Received: from mwinf0304.wanadoo.fr (smtp3.wanadoo.fr [193.252.22.28])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2NKLAWA001444
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 15:21:10 -0500
Subject: Re: [linux-lvm] root on lvm
From: Garcia Pascal <dld.pascal.garcia@wanadoo.fr>
In-Reply-To: <20040323192451.GE24728@percy.comedia.it>
References: <1079478024.2432.9.camel@rich>
	<1079705946.29353.6.camel@tesla.mmt.bellhowell.com>
	<1079729272.2126.12.camel@pascal> <1079922026.2361.7.camel@localhost>
	<20040323192451.GE24728@percy.comedia.it>
Message-Id: <1080073262.2189.16.camel@pascal>
Mime-Version: 1.0
Date: Tue, 23 Mar 2004 21:21:02 +0100
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

Hello
I do not know what the problem is.
May be the problem has nothing to see with lvm!
I reinstalled the system two times with the same problem. In fact there
is a warning when configuration lilo at installation time.

As I did not have that much time to analyse and solve the problem (if I
would have been able to), I just made a / reisefs partition, and the
problem went away.

I have a remark on that, / partition in a logical volume without
reiserfs (or a fs that can be resized without unmounting) is non sense
for me, because one can not unmount / partition, and one of the interest
of the lvm is to adapt the size of a partition when needed.

I have a spare disk and when I have some time and my General let me do
it, I reinstall the system and write all the problems. May be this
week-end.

regards
Pascal garcia


Le mar 23/03/2004 � 20:24, Luca Berra a �crit :
> On Sun, Mar 21, 2004 at 09:20:26PM -0500, Jeff Layton wrote:
> >My solution for this (so far) is to make a non-LVM2 /boot partition and
> >store a kernel and initrd in that. You can then build everything else as
> >a LVM partition. Perhaps when the available bootloaders become LVM2
> >aware we'll be able to do away with a seperate /boot, but for now it
> >seems to be the best way to deal with it.
> >Cheers,
> >-- Jeff
> >
> >
> >On Fri, 2004-03-19 at 15:47, Garcia Pascal wrote:
> >> Hello,
> >> I experienced also difficulties with / and lvm2.
> >> configuration: 
> >>    MANDRAKE 10.0, 
> >>    kernel 2.6.3, 
> >>    lilo 22.5.8, 
> >>    reiserfs 3.6.11 ?
> >>    lvm 2.00.08
> 
> lilo on mandrake 10.0 is lvm2 aware.
> i don't know if there are reiserfs related problems that affect Pascal
> configuration.
> 
> L.
