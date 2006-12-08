Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kB8Hxscs027304
	for <linux-lvm@redhat.com>; Fri, 8 Dec 2006 12:59:55 -0500
Received: from web51008.mail.yahoo.com (web51008.mail.yahoo.com
	[206.190.38.139])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	kB8HNm02014599
	for <linux-lvm@redhat.com>; Fri, 8 Dec 2006 12:23:53 -0500
Date: Fri, 8 Dec 2006 09:23:39 -0800 (PST)
From: Richard Mollel <unixtipz@yahoo.com>
Subject: Re: [linux-lvm] LVM problem - how to recover?
In-Reply-To: <200612031426.30561.Richard.Kampmann@freenet.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <938785.41035.qm@web51008.mail.yahoo.com>
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

Hi Richard,
1. What does/did vgcfgrestore tell you when you tried
to use it? You said it did not work....

2. Does debugreiserfs /dev/mapper/VGgroup-LVlist say
that there is a filesystem there? (assuming you have
not created a new filesystem there && also assuming
you can perform "vgchange -a y VGgroup" )

_thanks

Richard



--- Richard Kampmann <Richard.Kampmann@freenet.de>
wrote:

> Hi everybody,
> 
> I'm a bit disappointed, because there was really no
> feedback to my mail.
> 
> The situation is a real problem for me - is there
> anything missing? Or is 
> there no way to recover (can't believe that ...)?
> Wrong way or place to ask? Then please tell me where
> to go ...
> 
> I tried to find a solution myself (also with help of
> Google ...), but it did 
> not help me.
> 
> Bye
> 
> Richard Kampmann
> 
> Am Dienstag, 28. November 2006 21:15 schrieb Richard
> Kampmann:
> > Hi everybody ...
> >
> > I recently had a lvm crash from which I now have
> to recover. So now I need
> > your help ...
> >
> > The system is a SUSE 10.1 system with actual
> patches.
> > # uname -rio
> > 2.6.16.21-0.25-default i386 GNU/Linux
> > # lvm version
> >   LVM version:     2.02.02 (2006-02-07)
> >   Library version: 1.02.03 (2006-02-08)
> >   Driver version:  4.5.0
> > #
> >
> > There was the unenlightened crash and before there
> was a volume goup
> > spanning two physical partitions (sda2, sdb2),
> each on one physical disk
> > (sda, sdb). The system froze (maybe in coincidence
> with some
> > snapshot-handling) and I had to press the reset
> button. When rebooting lvm
> > told me he could not open the volume group because
> one pv was missing. The
> > partition looked OK when checking the partition
> table. I tried several
> > things - and to do a vgcfgrestore but it did not
> help.
> >
> > The volume group (system_vg) contained the root
> partition, so I installed a
> > new system on a third disc and tried to recover
> the old volume group.
> > Unfortunately when doing the pvcreate for the two
> physical volumes I did
> > NOT choose the "--zero n" switch.
> >
> > Fact is: I now have the volume group containing
> two physical discs and two
> > physical volumes with the correct PV UUIDs. But
> the first sectors are
> > zeroed, aren't they?
> >
> > Any way to recover the LVs of the old volume
> group? A vgcfgrestore (YES,
> > there was a vgcfgbackup before!) does not work ...
> bad luck.
> >
> > Ah - and all logical volumes contain Reiser
> Filesystems V 3.6 - they MUST
> > still be there ...
> >
> > So - what could be my next steps?
> >
> > Bye
> >
> > Richard Kampmann
> > _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at
http://tldp.org/HOWTO/LVM-HOWTO/



 
____________________________________________________________________________________
Do you Yahoo!?
Everyone is raving about the all-new Yahoo! Mail beta.
http://new.mail.yahoo.com
