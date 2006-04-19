Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id k3JDwuVP009807
	for <linux-lvm@redhat.com>; Wed, 19 Apr 2006 09:58:57 -0400
Mime-Version: 1.0 (Apple Message framework v623)
In-Reply-To: <1145364034.3003.55.camel@localhost>
References: <1145364034.3003.55.camel@localhost>
Message-Id: <c05cb1b2cd4b2d1ca1fb7b62b0ee6e5e@redhat.com>
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] dmeventd_mirror problem and some questions.
Date: Wed, 19 Apr 2006 09:00:39 -0500
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

There are some kernel patches that you need.  Either way, the DSO 
shouldn't be crashing, so I'll look into that.

Kernel patches are located at http://www.brassow.com/mirroring.  Last 
updated on April 3rd... I'll be updating those either today or tomorrow 
as well.

  brassow

On Apr 18, 2006, at 7:40 AM, Simone Gotti wrote:

> Hi All,
>
> I was curious to try the experimental dmeventd + the mirror checking
> dso.
> Everytime I created a mirror volume, dmeventd was crashing when the
> mirror finished the syncing process.
> I tracked it down to _get_mirror_event that is expeting a return string
> from the status ioctl to dm like "2 253:4 253:5 400/400 1 AA 3 cluster
> 253:3 A" but it gets only "2 253:4 253:5 400/400" so it SIGSEGV when is
> going to read over the number of returned arguments in the "args" array
> from split_words.
>
> The same string is returned by "dmsetup status".
>
> Do these informations aren't already implemented in the ioctl, or are
> there some patches around that I can try? (my kernel is the latest
> available in fedora rawhide: 2.6.16-1.2131_FC6)
>
> Another question, If I understand it correctly, the mirror library for
> dmeventd will look to possible problems (eg the lost of a PV containing
> a mirror), and it will call the right lvm command to fix it?
> For example, if a PV containing a side of a 2 way mirrored volume is
> lost, what are the various actions that it will do (I noticed an
> lvreduce --removemissing, but my fear is that this command will also
> remove unmirrored volumes)?
>
> Thanks!
>
> Bye!
>
> Simone Gotti.
>
>
>
>
>  --
>  Email.it, the professional e-mail, gratis per te: 
> http://www.email.it/f
>
>  Sponsor:
>  Problemi di Liquidit�? Con Logos Finanziaria 30.000 � in 24 ore a 
> dipendenti e lavoratori autonomi con rimborsi fino a 120 mesi, clicca 
> qui
> *
>  Clicca qui: http://adv.email.it/cgi-bin/foclick.cgi?mid=2911&d=18-4
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
