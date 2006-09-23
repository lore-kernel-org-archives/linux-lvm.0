Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8NCZHCJ009775
	for <linux-lvm@redhat.com>; Sat, 23 Sep 2006 08:35:17 -0400
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.189])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8NCZ92R001009
	for <linux-lvm@redhat.com>; Sat, 23 Sep 2006 08:35:10 -0400
Received: by nf-out-0910.google.com with SMTP id l36so1146075nfa
	for <linux-lvm@redhat.com>; Sat, 23 Sep 2006 05:35:09 -0700 (PDT)
Message-ID: <dac45060609230535m1cdb53efw2e29da84b8e46ca7@mail.gmail.com>
Date: Sat, 23 Sep 2006 15:35:08 +0300
From: "Mark Ryden" <markryde@gmail.com>
Subject: Re: [linux-lvm] LVM partition and lvm commands in initrd
In-Reply-To: <4514F001.1050300@iki.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <dac45060609230102k2d3e6c7fq512f27d265e24b8@mail.gmail.com>
	<4514F001.1050300@iki.fi>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello ,


>...that the mkinitrd/mkinitramfs-script will sniff around your system...
>to boot a system that
> doesn't have LVM

 Luca said in an answer to this message: "LVM is much more than a
partition type,"

It is clear to me that the mkinitrd is dependant upon what I install.
But it is not clear to me what in the installation of Fedora Core
characterizes the
system as having LVM (or not having LVM).

What is a system that does have an LVM and a system that does NOT
have LVM ?
Suppose somebody goes to  an unknown fedora machine and want to know if there
is LVM on that machine. How can he know it? is the existence of LVM
partition is
a precondition ? meaning, if he runs "fdisk -l |grep LVM" and doesn't
get anything than it is not LVM , and if there is an LVM partition
than it is LVM machine? or is it not enough to to this check and there
should be some another check ?

The thing is that I made 2 installations of Fedora Core 5; in the
first I chose to format a partition as LVM and in the second I did
not. Is this is what causes the initrd to have the lvm commands in the
first case and not to have them in the second place ?
because I don't remeber that elsewhere in the installation process
that I did select
anything
connected with LVM (there is ofcouse the manual layout in which I
chode /dev/VolumeGroup... in the first case).

regards,
MR

On 9/23/06, Aleksandr Koltsoff <czr@iki.fi> wrote:
> Hi
>
> Mark Ryden wrote:
> > Hello linux-lvm,
> >  There is one point which I want to understand and I hope I can get
> > help here.
>
> initrds are created automatically for you upon kernel package
> installation in most linux distributions (fedora included). this means
> that the mkinitrd/mkinitramfs-script will sniff around your system and
> decide which modules (dm, ext3, hba-drivers, etc) to include in the
> initrd and also sometimes decide which scripts to call (vgscan and
> friends) and whether to include lvm-related tools into the initrd.
> Similar story for software raid.
>
> This means that if you take the initrd and try to boot a system that
> doesn't have LVM you're doing something wrong. initrds are not supposed
> to be portable, however this will of course depend very much on the
> distribution.
>
> Hope this answers your question.
>
> ak.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
