Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1SMTBK11624
	for <linux-lvm@redhat.com>; Mon, 28 Feb 2005 17:29:11 -0500
Received: from mail02.malor.com (host.malor.com [69.93.140.74] (may be forged))
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j1SMTBil025865
	for <linux-lvm@redhat.com>; Mon, 28 Feb 2005 17:29:11 -0500
Received: from vanish (mail02.malor.com [127.0.0.1])
	by mail02.malor.com (Postfix) with SMTP id D84F04A00C
	for <linux-lvm@redhat.com>; Mon, 28 Feb 2005 16:29:05 -0600 (CST)
Message-ID: <001101c51de4$ed5448c0$32dcdc0a@vanish>
From: "Ron Watkins" <linux-lvm@malor.com>
References: <002101c51c41$f6bcfdc0$32dcdc0a@vanish><a3558a98050228031544d8f8c6@mail.gmail.com><001301c51dd5$abc80860$32dcdc0a@vanish>
	<20050228213856.GA4151@percy.comedia.it>
Subject: Re: [linux-lvm] Having duplicate PV problems,
	think there's a bug in LVM2 md component detection
Date: Mon, 28 Feb 2005 17:29:11 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: LVM general discussion and development <linux-lvm@redhat.com>

Due to another failing hard drive, I was forced to just use the md0 device 
directly and put it into use.  Once I have the dying drive replaced, I might 
be able to clear the data off again if you want to do a specific set of 
tests, but that would take many hours.  (150+ gigs over Fast Ethernet, not a 
quick process).  So please be sure you need me to do this, if you do.

I am using LVM version 2.01.04 (2005-02-09).  The Library Version is 
1.01.00-ioctl (2005-01-17).  The Driver Version is 4.1.0.  (no date given). 
I don't have any easy way to determine if the Debian maintainer is patching 
this.  Should I be submitting the bug report directly to him/her/them 
instead?

I'm not sure how to strace... I see the strace command. I assume I'd have to 
strace the pvcreate and pvdisplay, meaning I'd need to move my data again 
first.   If you do want me to do this, I can start copying data off late 
tomorrow, and can probably do the actual test on Wednesday.   I'll need the 
exact command line you want used, however, since I don't know anything about 
strace.

<<RON>>

jeeves:~# lvm version
  LVM version:     2.01.04 (2005-02-09)
  Library version: 1.01.00-ioctl (2005-01-17)
  Driver version:  4.1.0


----- Original Message ----- 
From: "Luca Berra" <bluca@comedia.it>
To: "LVM general discussion and development" <linux-lvm@redhat.com>
Sent: Monday, February 28, 2005 4:38 PM
Subject: Re: [linux-lvm] Having duplicate PV problems,think there's a bug in 
LVM2 md component detection


> On Mon, Feb 28, 2005 at 03:39:59PM -0500, Ron Watkins wrote:
>>Yes, I have two PVs with the same UUID.  The problem is that these PVs are 
>>COMPONENTS OF an MD device.  So when pvcreate writes its superblock to 
>>md0, it gets mirrored onto all the components of md0.  Later runs elicit 
>>much complaining because /dev/hda and several /dev/sd devices now have the 
>>'same' UUID.   They're SUPPOSED to, they're components of a RAID.
>>
>>LVM is supposed to detect this situation and not do that, but it doesn't 
>>seem to be working for me.
>>
> i wonder if it is a problem with largefile access ?!?
> which version of lvm2 are you using?
> does debian patch it?
> can you try stracing it an look for seeks, so we can see if it is
> wrapping around somewhere?
>
> L.
>
> -- 
> Luca Berra -- bluca@comedia.it
>        Communication Media & Services S.r.l.
> /"\
> \ /     ASCII RIBBON CAMPAIGN
>  X        AGAINST HTML MAIL
> / \
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
