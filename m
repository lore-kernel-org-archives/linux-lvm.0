Received: from ns3.rdu.redhat.com (ns3.rdu.redhat.com [10.11.255.199])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8AIi4ef013327
	for <linux-lvm@redhat.com>; Wed, 10 Sep 2008 14:44:04 -0400
Received: from [192.168.1.104] (vpn-12-28.rdu.redhat.com [10.11.12.28])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id m8AIi4wf004987
	for <linux-lvm@redhat.com>; Wed, 10 Sep 2008 14:44:04 -0400
Message-Id: <F6CA41F2-D34F-40CD-A4DE-D9ABD92ECFFD@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <425904320809092221i700af066h4072234624b5bf60@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v928.1)
Subject: Re: [linux-lvm] Problem in understanding code
Date: Wed, 10 Sep 2008 13:44:03 -0500
References: <425904320809092221i700af066h4072234624b5bf60@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

You aren't the first person to stumble on this...  The learning curve  
is pretty steep.

You might want to have a look in the 'tools' directory to get your  
head around that stuff (check tools.h, commands.h, and args.h).  There  
is some clever macro work going on that you don't see very often -  
neat stuff, but not always as clear as it could be.

  brassow

On Sep 10, 2008, at 12:21 AM, Vineet Agarwal wrote:

> hello
> i was going through the code of lvcreate and pvcreate LVM2 and i was
> not able to understand it. there were few arguments var like
> stripes_ARG etc . Can anyone please provide me with any documentation
> related to LVM2 code .
> thankyou
>
> -- 
>> From :
> Vineet Agarwal
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
