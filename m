Message-Id: <007901c1e58c$f7884690$6501a8c0@bomoon>
From: "bo" <bo@sosnetwork.net>
References: <Pine.LNX.4.44.0204161951550.28284-100000@pzat.meep.org>
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
Date: Tue Apr 16 16:23:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I support RAID1 & 5.
On the top of these RAID 1 or 5 MD device I will use LVM for flexibility.
I read the WARNING I mentioned on my previous email from some LVM document
such as

"There is one important "limitation" when using whole disk. The LVM tools
used to setup  LVM will recognize a whole disk as possible device for LVM
ONLY if it has NO partition table! If the disk already has one, even an
empty
one, LVM will refuse to use it."

This was my question, "is this still TRUE or not?"

Thanks,

Bo
----- Original Message -----
From: "James Hawtin" <oolon@ankh.org>
To: <linux-lvm@sistina.com>
Sent: Tuesday, April 16, 2002 12:57 PM
Subject: Re: [linux-lvm] LVM tool limitation on using whole disk


> On Tue, 16 Apr 2002, Dustin Cooper wrote:
>
> > You can make MD devices out of entire disks, but they won't be
> > autodetected by the kernel.  For MD autodetection to work you have to
have
> > partitions of type 0xfd on your disks.
> >
> > If you still want to use whole disks, make sure /etc/raidtab is up to
date
> > and use raidstart before vgscan.
> >
>
> In that case i recon you should use a partition table just for simplity.
> A partition table only wastes one disk block at the end of the day, you
> going to lose much more space with lvm and the raid in rounding. I have to
> admit I aways use a partition table even when a whole disk has been used
> for lvm.
>
> What kind of raid you going to use? Lvm does do striping and
> Concatination on PEs. (forget what "numbers" those are called ;-)
>
> Mirroring or raid 5 your going to have to use the the linux raid to make
> those devices.
>
> James
>
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
