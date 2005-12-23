Received: from hydrogen.msp.redhat.com (hydrogen.msp.redhat.com [10.15.80.1])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id jBN1e1rW028271
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 20:40:02 -0500
Subject: Re: [linux-lvm] a question about lvm in linux
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <1135300450.1754.1.camel@localhost.localdomain>
References: <20051222131023.2E6280035DF3@relay.vip.sohu.com>
	<1135287640.9164.29.camel@seki.nac.uci.edu>
	<1135300450.1754.1.camel@localhost.localdomain>
Date: Thu, 22 Dec 2005 19:40:00 -0600
Message-Id: <1135302000.11788.8.camel@hydrogen.msp.redhat.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

You may wish to run a similar command, but here is what I found.

[jbrassow@hydrogen linux-2.6.9]$ man -k resize | grep filesystem
ext2online           (8)  - online (mounted) ext2 filesystem resizer
resize_reiserfs      (8)  - resizer tool for the ReiserFS filesystem

 brassow

On Fri, 2005-12-23 at 09:14 +0800, alexli wrote:
> thanks a lot,but I find that there is not such commands like EG or
> ext2resize. i don't konw whether i use the wrong command. can you tell
> help me ?
> 在2005年12月23日的05:40，Dan Stromberg写道：
> > Ni Hao Alex.
> > 
> > You'll probably need to not only extend the logical volume, but also
> > inform the filesystem that it needs to grow to encompass the additional
> > space.  EG, ext2resize.
> > 
> > On Thu, 2005-12-22 at 21:10 +0800, alexli wrote:
> > > Hello ,I am a linux user, because I am a Chinese ,so my English is not
> > > good ,please forgive me for language mistake. after I used the command
> > > ----- lvextend ,I find that the logical volumn space is changed .but
> > > after I mount it to the file  system , and use the df command to see
> > > the filesystem, I find that the space of the file system is not
> > > changed .
> > > 
> > > I see your mail address in the “man lvextend” , and find that you are
> > > the author , so I wonder whether you can help me with this problem.
> > > 
> > >  
> > > 
> > > Thank you 
> > > 
> > >  
> > > 
> > > Alex li
> > > 
> > > 
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@redhat.com
> > > https://www.redhat.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
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
