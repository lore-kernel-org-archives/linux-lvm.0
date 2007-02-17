Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1HCurrZ007154
	for <linux-lvm@redhat.com>; Sat, 17 Feb 2007 07:56:53 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l1HCuosd001192
	for <linux-lvm@redhat.com>; Sat, 17 Feb 2007 07:56:51 -0500
Date: Sat, 17 Feb 2007 13:56:44 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] vgdisplay - checksum error - what does it mean?
Message-ID: <20070217125644.GC11919@percy.comedia.it>
References: <45D448F5.3000301@wpkg.org> <45D47AF5.2040106@wpkg.org>
	<20070216074737.GA14119@percy.comedia.it>
	<45D57D16.8060902@wpkg.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45D57D16.8060902@wpkg.org>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Fri, Feb 16, 2007 at 10:44:54AM +0100, Tomasz Chmielewski wrote:
>>>So this basically means, that LVM was set up on /dev/sda2 some time 
>>>ago, but it was never removed from there - instead, RAID-10 was set up 
>>>on that partition?
>>
>>I don't think so. if sda2 is part of a raid10 md array probably the
>>beginning sector of the md device maps to the beginning sector of the
>>real device, hence lvm will find an lvm signature on /dev/sda2.
>
>Is there a way to check if it's really the case?

dd?

>There's something wrong with /dev/sda2 - lvmdiskscan claims it's a 
>371.58 GB LVM physical volume, while /dev/md2 is the physical volume I use.
>
>   /dev/sda2                     [      371.58 GB] LVM physical volume
>   /dev/md2                      [      743.16 GB] LVM physical volume
>
>
>>>Should I do something to fix the things? What?
>>yes, re-enable md_component_detection in lvm.conf, why did you disable
>>that?
>
>Certainly I didn't touch anything in /etc/lvm/*.
>If I look into /etc/lvm/lvm.conf, it says:
>
>devices {
>(...)
>     # By default, LVM2 will ignore devices used as components of
>     # software RAID (md) devices by looking for md superblocks.
>     # 1 enables; 0 disables.
>     md_component_detection = 1
>}
>
>It's enabled.
>
>So the problem is somewhere else. Where?

with md_component_detection enabled lvm should ignore /dev/sda2.
can you send the output of lvmdiskscan -vvv?

>BTW, the machine is running Debian etch (ARM port).
mmm i don't have an arm maybe this is the issue why lvm does not
understand that sda2 is a md component?!?

>"smartctl" says all four disks are fine (they are quite new, too), so 
>it's definitely not a hardware problem.
sure it is not an hw problem do not worry.

>I guess one way to fix it would be mark all partitions faulty on 
>/dev/sda, and then, to recreate the RAIDs.
>But I'm curious to know how could I handle such a situation if I didn't 
>have RAID.
what would it fix? you have no problem except lvm2 believing sda2 is an
lvm volume which is not.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
