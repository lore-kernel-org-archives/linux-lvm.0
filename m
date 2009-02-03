Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n138Wveu006556
	for <linux-lvm@redhat.com>; Tue, 3 Feb 2009 03:32:57 -0500
Received: from s1.echoreply.us (s1.echoreply.us [216.146.143.192])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n138WadB022042
	for <linux-lvm@redhat.com>; Tue, 3 Feb 2009 03:32:36 -0500
Received: from [125.60.243.116] (helo=[10.92.1.2])
	by s1.echoreply.us with esmtpsa (SSLv3:RC4-MD5:128) (Exim 4.69)
	(envelope-from <echo@echoreply.us>) id 1LUGl5-0006PN-JE
	for linux-lvm@redhat.com; Tue, 03 Feb 2009 03:35:52 -0500
Subject: Re: [linux-lvm] Is my xen hosting tech support misleading me?
From: Tim Post <echo@echoreply.us>
In-Reply-To: <1233646457.5482.138.camel@localhost.localdomain>
References: <1233644558.21625.12.camel@box0>
	<1233646457.5482.138.camel@localhost.localdomain>
Date: Tue, 03 Feb 2009 16:32:27 +0800
Message-Id: <1233649947.5482.157.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Reply-To: echo@echoreply.us,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Sorry to top post, but of course make sure the appropriate modules are
loaded on boot (again, emphasis on not needing them to pivot_root)
unless you have a VERY cooperative provider.

Cheers,
--Tim

On Tue, 2009-02-03 at 15:34 +0800, Tim Post wrote:
> On Tue, 2009-02-03 at 09:02 +0200, Shachar Or wrote:
> > Hello.
> > 
> > Attached is a question I've asked my xen hosting provider's technical
> > support and the answer they've supplied.
> > 
> > Sam sais "There is no LVM module available, so you would need to compile
> > LVM by yourself from the Xen kernel sources." but I've no problem
> > loading dm_mod and to my understanding of LVM, this is the only module
> > needed. So is he just wrong?
> 
> Probably, however your going to need to find out if you have the entire
> dm_* family for the functionality that you want (i.e. snapshots). You
> should (on your VM) simply be able to install lvm2 via yum, apt-get or
> whatever packaging mechanism is provided by your distribution.
> 
> I use lvm2 on literally hundreds of paravirtualized Xen guests without a
> problem.
> 
> A word of warning, don't make LV's (or their snapshots) a prerequisite
> to boot .. since you have no control over your initrd. If your provider
> has given you xvda and xvdb , use xvdb for your pv, keep the root file
> system on xvda. 
> 
> Cheers,
> --Tim
> 
> 
> > 
> > Thanks.
> > email message attachment, "הודעה מועברת - <Ref1876314> DOMAIN :"
> > > -------- Forwarded Message --------
> > > From: Gandi Hosting <hosting@support.gandi.net>
> > > To: dawnlight@lavabit.com
> > > Subject: <Ref1876314> DOMAIN :
> > > Date: Mon, 2 Feb 2009 15:09:28 +0100 (CET)
> > > 
> > > Hello, 
> > > 
> > > Thank you for your patience.
> > > 
> > > There is no LVM module available, so you would need to compile LVM
> > > by yourself from the Xen kernel sources. 
> > > 
> > > You will then need to activate the module. 
> > > 
> > > You should be able to find the appropriate help online.
> > > 
> > > 
> > > I am at your disposal should you need any further information.
> > > 
> > > Best regards,
> > > Sam
> > > 
> > > ---------------------------------------
> > > Are you satisfied with the quality of the reply you received?
> > > YES: http://www.gandi.net/faq/feedback/yes
> > > NO: http://www.gandi.net/faq/feedback/no
> > > 
> > > I would like to give more detailed feedback:
> > > http://www.gandi.net/faq/feedback
> > > ---------------------------------------
> > > 
> > > 
> > > 
> > > Help about hosting / aide sur l'hébergement: http://wiki.gandi.net/
> > > 
> > > GANDI
> > > http://www.gandi.net 
> > > 
> > > 
> > > -------------------------------------- 
> > > Product     : hosting 
> > > Category    :  
> > > Question    :  
> > > FirstName   : Shachar 
> > > LastName    : Or 
> > > CompanyName :  
> > > Email       : dawnlight@lavabit.com 
> > > Domain      :  
> > > DomainNB    :  
> > > Handle      : SO866-GANDI 
> > > Anciennet  :  
> > > Transaction :  
> > > Message     : Hello. 
> > > 
> > > This is a technical question about a problem I'm experiencing with LVM on my virtual server. 
> > > 
> > > The issue is that logical volumes are not activated on bootup. This prevents me from using /etc/fstab to mount them. 
> > > 
> > > root@shacharor:~# lvdisplay | grep 'LV Status' && udevtrigger && udevsettle && lvdisplay | grep 'LV Status' 
> > >   LV Status              NOT available 
> > >   LV Status              available 
> > > root@shacharor:~# 
> > > 
> > > This shows that udev handles logical volumes correctly and does activate them. But why doesn't it do it on bootup? 
> > > 
> > > Thanks. 
> > > 
> > > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
