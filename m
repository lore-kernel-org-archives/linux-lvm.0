Message-Id: <006501c1e57a$3cf5ff50$6501a8c0@bomoon>
From: "bo" <bo@sosnetwork.net>
References: <Pine.LNX.4.44.0204161845320.27709-100000@pzat.meep.org>
Subject: Re: [linux-lvm] LVM tool limitation on using whole disk
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
Date: Tue Apr 16 14:09:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Thanks for your reply.

It should work if I make a LVM from HDD device, not using MD.
However, using fdisk to make a big ONE partition for RAID then
make it for MD.  Then I should not wife this partition block out.

I never try it yet but I think it is.

Am I wrong?

Any other suggestions?

Bo
----- Original Message -----
From: "James Hawtin" <oolon@ankh.org>
To: <linux-lvm@sistina.com>
Sent: Tuesday, April 16, 2002 11:47 AM
Subject: Re: [linux-lvm] LVM tool limitation on using whole disk


> On Tue, 16 Apr 2002, bo wrote:
>
> > Is it still TRUE?
> >
> > I am going to make several MDs on several whole disks, and then combine
them
> > as a
> > volume. How could I avoid this problem?
> >
> > Thanks,
> >
> > Bo
> >
> >
>
> So wipe the partition table!
>
> dd if=/dev/zero of=/dev/discs/disc1/disc bs=1024 count=10
>
> That would do it... make sure you change the of= bit to be the right
> device. Do it wrong and ... well thats your problem!
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
