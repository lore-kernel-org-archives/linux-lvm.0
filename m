Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2SMGRfn007114
	for <linux-lvm@redhat.com>; Tue, 28 Mar 2006 17:16:27 -0500
Received: from xproxy.gmail.com (xproxy.gmail.com [66.249.82.198])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k2SMGRnd027603
	for <linux-lvm@redhat.com>; Tue, 28 Mar 2006 17:16:27 -0500
Received: by xproxy.gmail.com with SMTP id h30so38685wxd
	for <linux-lvm@redhat.com>; Tue, 28 Mar 2006 14:16:27 -0800 (PST)
Message-ID: <9ab217670603281416i5fc3766bh1aae102dce49d14f@mail.gmail.com>
Date: Tue, 28 Mar 2006 14:16:23 -0800
From: "Devon H. O'Dell" <devon.odell@gmail.com>
Subject: Re: [linux-lvm] LVM2 with disks greater than 2TB
In-Reply-To: <4429ACEC.6050701@volved.com>
MIME-Version: 1.0
Content-Disposition: inline
References: <44286D9D.405@the-rusty-nail.com> <442885D1.5070509@volved.com>
	<44297A4A.7070909@the-rusty-nail.com> <44298C92.90206@ist.ucf.edu>
	<4429A9A2.6040907@the-rusty-nail.com> <4429ACEC.6050701@volved.com>
Content-Transfer-Encoding: 8bit
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

2006/3/28, Barnaby Claydon <bclaydon@volved.com>:
> Dan, you should still be able to use LVM. The pvcreate create command
> should still work on each of the two 4.6TB partitions and then use those
> two PVs in your LVM.
>
> How far did you get after using Parted and GPT ? Did you get LVM-related
> errors that I may not be considering? :)
>
> -Barnaby

I had this problem earlier. The issue ended up being the same: I
forgot to create GPT labels for the partitions. I had 2x4TB arrays I
needed to span into a single 8TB array for several systems. The steps
I use when making these LVM partition are as follows:

parted /dev/sdb
mklabel gpt
mkpart
primary
xfs
0
4196049
select /dev/sdc
mklabel gpt
mkpart
primary
xfs
0
4196049
quit

At the shell, type:

pvcreate --metadatasize 1M /dev/sd{b,c}1
vgcreate -s 128M vg0 /dev/sd[bc]1
lvcreate -n lv0 -L8T vg0
mkfs.xfs /dev/vg0/lv0

The sizes are arbitrary numbers that I got while playing around with
them and are the first ones that actually worked without whining at me
about metadata sizes when creating the logical volume. Dan, LVM
doesn't really care about the partition label. You should be able to
do what I did above (but then with ReiserFS) to get what you need.

With standard DOS partitions this will not work, as they only support
2^32-1 bytes.

--Devon

> Dan wrote:
> > It was indeed a partition problem.  Thanks.  fdisk does not support
> > partitions over 2TB so I had to use GNU Parted to setup the partition
> > with a GPT label that supports over 2TB.  I could then create reiserfs
> > filesystems and got two 4.6TB partitions.  Unfortunately Parted and
> > GPT do not support LVM so I could not raid the two partitions into one
> > giant one unless I am missing something.  But the 2 partitions will
> > work fine for what I need.  For anyone who might be interested I found
> > the info I needed at the links below:
> > http://www.coraid.com/support/linux/contrib/chernow/gpt.html
> > http://www.gnu.org/software/parted/manual/html_chapter/
> > http://www.wlug.org.nz/GPT
> >
> > Judd Tracy wrote:
> >> I recall having a similar problem when I setup a large array a long
> >> time ago and it was related to the partition table if I remember
> >> correctly.  I wish I could remember more, but that was atleast 2
> >> years ago.  Hopefully it can lead you in the right direction.  I
> >> think I ended up using and EFI partion table if I remember correctly.
> >>
> >> Judd
> >>
> >> Dan wrote:
> >>
> >>> What concerns me is if I just try and make a single 4.54TB partition
> >>> as reiserfs without using LVM2 and mount it, it still only shows up
> >>> as ~560GB using df -h.  This makes me think it maybe an os issue.
> >>> Any thoughts?
> >>>
> >>> Barnaby Claydon wrote:
> >>>
> >>>> Dan wrote:
> >>>>
> >>>>> I have 24 - 500GB drives raided such that 11 drives + 1 hot spare
> >>>>> per raid to get 4.54TB times 2.  I want to use LVM2 to make this
> >>>>> into one ~9TB disk, but when I create the partitions and do a df
> >>>>> -h they show up as about 560GB each instead of 4.5TB each.  I do
> >>>>> an fdisk -l and they show up correctly.  I am using Slackware
> >>>>> 10.0.  I have device-mapper and LVM2 correctly installed.  I am
> >>>>> obviously hitting a 2TB limit from what I have read, but does
> >>>>> anyone know if it is possible to even do what I want?  If so, any
> >>>>> suggestions on what I need to install to get this to work?  I am
> >>>>> running the 2.6.15.4 kernel.  Thanks
> >>>>>
> >>>> Dan, from the LVM2 FAQ (
> >>>> http://www.tldp.org/HOWTO/LVM-HOWTO/lvm2faq.html ) it mentions:
> >>>>
> >>>> * For 32-bit CPUs on 2.6 kernels, the maximum LV size is 16TB.
> >>>> * For 64-bit CPUs on 2.6 kernels, the maximum LV size is 8EB. (Yes,
> >>>> that is a very large number.)
> >>>>
> >>>> From what I recall when I built my last LVM, it's a matter of
> >>>> setting the PE size during creation (hopefully you haven't started
> >>>> filling with data yet). I think the default causes you to hit the
> >>>> 2TB limit, but it can definitely be set higher. The default PE Size
> >>>> seems to depend on Linux distribution, but mine is at 4MB and I'm
> >>>> at 1.5TB right now so the references to a 32MB default would
> >>>> definitely get you to 9TB.
> >>>>
> >>>> Sorry I can't offer any other specifics - hope that helps.
> >>>>
> >>>> -Barnaby
> >>>>
> >>>>
> >>>> _______________________________________________
> >>>> linux-lvm mailing list
> >>>> linux-lvm@redhat.com
> >>>> https://www.redhat.com/mailman/listinfo/linux-lvm
> >>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >>>
> >>>
> >>> _______________________________________________
> >>> linux-lvm mailing list
> >>> linux-lvm@redhat.com
> >>> https://www.redhat.com/mailman/listinfo/linux-lvm
> >>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >>
> >>
> >>
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
