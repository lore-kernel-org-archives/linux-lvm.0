Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1G7lfu0027110
	for <linux-lvm@redhat.com>; Fri, 16 Feb 2007 02:47:41 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1G7ldkR026514
	for <linux-lvm@redhat.com>; Fri, 16 Feb 2007 02:47:39 -0500
Date: Fri, 16 Feb 2007 08:47:38 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] vgdisplay - checksum error - what does it mean?
Message-ID: <20070216074737.GA14119@percy.comedia.it>
References: <45D448F5.3000301@wpkg.org> <45D47AF5.2040106@wpkg.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45D47AF5.2040106@wpkg.org>
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

On Thu, Feb 15, 2007 at 04:23:33PM +0100, Tomasz Chmielewski wrote:
>Tomasz Chmielewski schrieb:
>>Recently, I used "vgdisplay", and noticed that it gives a "checksum error":
>>
>># vgdisplay
>>   /dev/sda2: Checksum error
....
>>
>>Should I be scared? What does it mean? What should I do about it? I 
>>wouldn't like to loose the data.
>>
>>If it helps, my setup looks like that:
>>
>>HDD1-sda2-\
>>HDD2-sdb2-|__RAID-10--LVM-2
>>HDD3-sdc2-|
>>HDD4-sdd2-/
>>
>>I'm running 2.6.17.8 kernel.
>
...
>
>So this basically means, that LVM was set up on /dev/sda2 some time ago, 
>but it was never removed from there - instead, RAID-10 was set up on 
>that partition?

I don't think so. if sda2 is part of a raid10 md array probably the
beginning sector of the md device maps to the beginning sector of the
real device, hence lvm will find an lvm signature on /dev/sda2.

>Should I do something to fix the things? What?
yes, re-enable md_component_detection in lvm.conf, why did you disable
that?

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
