Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBMLf0110730
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 16:41:00 -0500
Received: from dcs.nac.uci.edu (dcs.nac.uci.edu [128.200.34.32])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBMLerD9026077
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 16:40:53 -0500
Subject: Re: [linux-lvm] a question about lvm in linux
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
In-Reply-To: <20051222131023.2E6280035DF3@relay.vip.sohu.com>
References: <20051222131023.2E6280035DF3@relay.vip.sohu.com>
Date: Thu, 22 Dec 2005 13:40:40 -0800
Message-Id: <1135287640.9164.29.camel@seki.nac.uci.edu>
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
Cc: Linux-LVM@Sistina.com


Ni Hao Alex.

You'll probably need to not only extend the logical volume, but also
inform the filesystem that it needs to grow to encompass the additional
space.  EG, ext2resize.

On Thu, 2005-12-22 at 21:10 +0800, alexli wrote:
> Hello ,I am a linux user, because I am a Chinese ,so my English is not
> good ,please forgive me for language mistake. after I used the command
> ----- lvextend ,I find that the logical volumn space is changed .but
> after I mount it to the file  system , and use the df command to see
> the filesystem, I find that the space of the file system is not
> changed .
> 
> I see your mail address in the �man lvextend� , and find that you are
> the author , so I wonder whether you can help me with this problem.
> 
>  
> 
> Thank you 
> 
>  
> 
> Alex li
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
