Received: from pobox.corp.redhat.com (pobox.corp.redhat.com [10.11.255.20])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3OLFe7k007879
	for <linux-lvm@redhat.com>; Thu, 24 Apr 2008 17:15:40 -0400
Received: from [192.168.1.101] (vpn-248-22.boston.redhat.com [10.13.248.22])
	by pobox.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3OLFc9v020703
	for <linux-lvm@redhat.com>; Thu, 24 Apr 2008 17:15:39 -0400
Message-Id: <6DEE1975-4C6A-4471-9F63-ADD44C0A1D4C@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <alpine.LRH.1.10.0804241155020.4181@cpe-76-90-113-66.socal.rr.com>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v919.2)
Subject: Re: [linux-lvm] question about mirrors
Date: Thu, 24 Apr 2008 16:15:37 -0500
References: <20080424172021.E3A06619B4C@hormel.redhat.com>
	<alpine.LRH.1.10.0804241155020.4181@cpe-76-90-113-66.socal.rr.com>
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

There is not a way to do what you want right now through a simple lvm  
command.

If you are willing to hand edit some metadata, then it can be done.

  brassow

On Apr 24, 2008, at 1:56 PM, chekov@ucla.edu wrote:

> I created a lvm mirror on two seperate storage arrays.
>
> now I want to break the mirror but use _both_ copies of the data.   
> it seems that whenever I break a test mirror the mirror just goes  
> back in to the storage pool and can't be accessed any more.  is  
> there a way to mount both mirror halfs?
> -alan
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
