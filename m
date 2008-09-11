Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8BB6Kv1019556
	for <linux-lvm@redhat.com>; Thu, 11 Sep 2008 07:06:21 -0400
Received: from s1.echoreply.us (s1.echoreply.us [216.146.143.173])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8BB65iI021639
	for <linux-lvm@redhat.com>; Thu, 11 Sep 2008 07:06:05 -0400
Received: from [125.60.243.116] (helo=[10.92.1.100])
	by s1.echoreply.us with esmtpsa (SSLv3:RC4-MD5:128) (Exim 4.68)
	(envelope-from <echo@echoreply.us>) id 1Kdjzo-0006X1-BB
	for linux-lvm@redhat.com; Thu, 11 Sep 2008 11:05:56 +0000
Subject: Re: [linux-lvm] Problem in understanding code
From: Tim Post <echo@echoreply.us>
In-Reply-To: <F6CA41F2-D34F-40CD-A4DE-D9ABD92ECFFD@redhat.com>
References: <425904320809092221i700af066h4072234624b5bf60@mail.gmail.com>
	<F6CA41F2-D34F-40CD-A4DE-D9ABD92ECFFD@redhat.com>
Date: Thu, 11 Sep 2008 19:05:52 +0800
Message-Id: <1221131152.5569.119.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 2008-09-10 at 13:44 -0500, Jonathan Brassow wrote:
> You aren't the first person to stumble on this...  The learning curve  
> is pretty steep.

I just did too. I've been working with liblvm2cmd for a day and a half
and began working backwards through tools/ to see how things worked.

> You might want to have a look in the 'tools' directory to get your  
> head around that stuff (check tools.h, commands.h, and args.h).  There  
> is some clever macro work going on that you don't see very often -  
> neat stuff, but not always as clear as it could be.
> 
>   brassow

Thanks to all who made liblvm2cmd which makes things much simpler for
those who are just getting their first glimpse of things. It is going to
take some time to digest the rest.

I found liblvm2cmd by accident, really. I grabbed the source to LVM2
while in search of a more elegant way to use LVM in other programs
without resorting to system() or exec*() calls.


Cheers,
--Tim
