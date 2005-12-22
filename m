Received: from dogpound.rdu.redhat.com (dogpound.rdu.redhat.com [172.16.59.2])
	by pobox.corp.redhat.com (8.12.8/8.12.8) with ESMTP id jBMLXUrW000509
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 16:33:31 -0500
Date: Thu, 22 Dec 2005 16:22:31 -0500
From: Josef Whiter <jwhiter@redhat.com>
Subject: Re: [linux-lvm] a question about lvm in linux
Message-ID: <20051222212231.GA30568@dogpound.rdu.redhat.com>
References: <20051222131023.2E6280035DF3@relay.vip.sohu.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20051222131023.2E6280035DF3@relay.vip.sohu.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

You are halfway there.  You also have to extend your filesystem to fill up the space you just made by extending your LV.  If your filesystem is ext2/3 you can use

resize2fs

to increase the filesystem.  Thank you,

Josef

On Thu, Dec 22, 2005 at 09:10:12PM +0800, alexli wrote:
> Hello ,I am a linux user, because I am a Chinese ,so my English is not good
> ,please forgive me for language mistake. after I used the command -----
> lvextend ,I find that the logical volumn space is changed .but after I mount
> it to the file  system , and use the df command to see the filesystem, I
> find that the space of the file system is not changed .
> 
> I see your mail address in the "man lvextend" , and find that you are the
> author , so I wonder whether you can help me with this problem.
> 
>  
> 
> Thank you 
> 
>  
> 
> Alex li
> 

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
