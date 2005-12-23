Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBN1m5132044
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 20:48:05 -0500
Received: from relay.vip.sohu.com (relaybak.vip.sohu.com [61.135.132.53])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBN1ltKU018315
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 20:47:56 -0500
Received: from localhost.localdomain (unknown [218.64.67.198])
	by relay.vip.sohu.com (Postfix) with ESMTP id 20E7704F497C
	for <linux-lvm@redhat.com>; Fri, 23 Dec 2005 09:47:12 +0800 (CST)
Subject: Re: [linux-lvm] a question about lvm in linux
From: alexli <alexli@vip.sohu.com>
In-Reply-To: <20051222212231.GA30568@dogpound.rdu.redhat.com>
References: <20051222131023.2E6280035DF3@relay.vip.sohu.com>
	<20051222212231.GA30568@dogpound.rdu.redhat.com>
Message-Id: <1135302583.2031.5.camel@localhost.localdomain>
Mime-Version: 1.0
Date: Fri, 23 Dec 2005 09:49:44 +0800
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

hello, Mr White. i am sorry for disturb you again , today i try the
command --- resize2fs on the system :redhat linux as4 , but i find that
the system shows me a message telling that there is not such a command.
can you help me? 

> Hello,
> 
> You are halfway there.  You also have to extend your filesystem to fill up the space you just made by extending your LV.  If your filesystem is ext2/3 you can use
> 
> resize2fs
> 
> to increase the filesystem.  Thank you,
> 
> Josef
> 
> On Thu, Dec 22, 2005 at 09:10:12PM +0800, alexli wrote:
> > Hello ,I am a linux user, because I am a Chinese ,so my English is not good
> > ,please forgive me for language mistake. after I used the command -----
> > lvextend ,I find that the logical volumn space is changed .but after I mount
> > it to the file  system , and use the df command to see the filesystem, I
> > find that the space of the file system is not changed .
> > 
> > I see your mail address in the "man lvextend" , and find that you are the
> > author , so I wonder whether you can help me with this problem.
> > 
> >  
> > 
> > Thank you 
> > 
> >  
> > 
> > Alex li
> > 
> 
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
