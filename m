Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id pA8K5Cet012712
	for <linux-lvm@redhat.com>; Tue, 8 Nov 2011 15:05:12 -0500
Received: from qmta04.westchester.pa.mail.comcast.net
	(qmta04.westchester.pa.mail.comcast.net [76.96.62.40])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA8K5Bdb025952
	for <linux-lvm@redhat.com>; Tue, 8 Nov 2011 15:05:11 -0500
Date: Tue, 8 Nov 2011 20:05:11 +0000 (UTC)
From: Dan White <ygor@comcast.net>
Message-ID: <254604864.2010919.1320782711864.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
In-Reply-To: <4EB9720F.1030709@q7.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Cannot unmount logical volume to reduce it
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks Joe.  That was a great suggestion.

Here's what I did (for the benefit of others trying to do this):

Boot into the rescue CD, did NOT mount the file systems.

At the prompt:
    lvm vgscan

This created /dev/volgrp01

Then:
    lvm vgchange -ay

This created /dev/volgrp01/usrVol /dev/volgrp01/varVol etc

These are the volume group and logical group names I gave the original OS installation.

Then, using /dev/volgrp01/usrVol as an example, to be resized to 10 gigabytes:
    e2fsck -pvf /dev/volgrp01/usrVol
    resize2fs -f /dev/volgrp01/usrVol 10g
    lvm lvresize -v -L 10g /dev/volgrp01/usrVol

The system warns and whines aboiut the last step, but I did not mess up my file systems.

“Sometimes I think the surest sign that intelligent life exists elsewhere in the universe is that none of it has tried to contact us.”
Bill Waterson (Calvin & Hobbes)

----- Joe Pruett <joey@q7.com> wrote:
> when you use the rescue disk, you need to tell it to skip the mounting
> of the drives.  and i hope you know that you need to shrink the file
> system first before you reduce the lv.  i don't know if the appropriate
> tools will be available on the rescue disk without mounting the main
> system drive, though.  using a livecd might be needed.
> 
> On 11/08/2011 10:00 AM, Dan White wrote:
> > RHEL5.7 x86_64
> > I want to reduce the size of the logical volumes on a server.
> > The two giving me trouble are mounted on /var and /usr
> >
> > I cannot unmount them to reduce them.  Even tried booting into a rescue disc.
> >
> > Any suggestions ?
> >
> > “Sometimes I think the surest sign that intelligent life exists elsewhere in the universe is that none of it has tried to contact us.”
> > Bill Waterson (Calvin & Hobbes)
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
