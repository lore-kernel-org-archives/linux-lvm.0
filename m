Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBN1BV126093
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 20:11:31 -0500
Received: from relay.vip.sohu.com (relay.vip.sohu.com [61.135.132.53])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBN1BIYv008705
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 20:11:23 -0500
Received: from localhost.localdomain (unknown [218.64.67.198])
	by relay.vip.sohu.com (Postfix) with ESMTP id 4A1A300C3E50
	for <linux-lvm@redhat.com>; Fri, 23 Dec 2005 09:11:14 +0800 (CST)
Subject: Re: [linux-lvm] a question about lvm in linux
From: alexli <alexli@vip.sohu.com>
In-Reply-To: <1135287640.9164.29.camel@seki.nac.uci.edu>
References: <20051222131023.2E6280035DF3@relay.vip.sohu.com>
	<1135287640.9164.29.camel@seki.nac.uci.edu>
Message-Id: <1135300450.1754.1.camel@localhost.localdomain>
Mime-Version: 1.0
Date: Fri, 23 Dec 2005 09:14:10 +0800
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

thanks a lot,but I find that there is not such commands like EG or
ext2resize. i don't konw whether i use the wrong command. can you tell
help me ?
在2005年12月23日的05:40，Dan Stromberg写道：
> Ni Hao Alex.
> 
> You'll probably need to not only extend the logical volume, but also
> inform the filesystem that it needs to grow to encompass the additional
> space.  EG, ext2resize.
> 
> On Thu, 2005-12-22 at 21:10 +0800, alexli wrote:
> > Hello ,I am a linux user, because I am a Chinese ,so my English is not
> > good ,please forgive me for language mistake. after I used the command
> > ----- lvextend ,I find that the logical volumn space is changed .but
> > after I mount it to the file  system , and use the df command to see
> > the filesystem, I find that the space of the file system is not
> > changed .
> > 
> > I see your mail address in the “man lvextend” , and find that you are
> > the author , so I wonder whether you can help me with this problem.
> > 
> >  
> > 
> > Thank you 
> > 
> >  
> > 
> > Alex li
> > 
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
