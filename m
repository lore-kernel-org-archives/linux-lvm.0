Received: from [192.168.1.100] (vpn-248-114.boston.redhat.com [10.13.248.114])
	by pobox.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7DFWplJ018184
	for <linux-lvm@redhat.com>; Mon, 13 Aug 2007 11:32:52 -0400
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <1187015794.2799.11.camel@localhost>
References: <1187015794.2799.11.camel@localhost>
Message-Id: <330CCC1A-5400-472C-8DCE-59CCE61E739C@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] Some questions on "Mirrors cannot be resized while
	active yet"
Date: Mon, 13 Aug 2007 10:29:21 -0500
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

I don't remember all the reasons, but I *think* two of them were:
1) 186304 - potential to spoil redundancy
2) cluster mirroring needed ability to hold to identical logs for a  
short period

Both of these issues have been resolved, so it may be a simple matter  
of turning it on...

  brassow

On Aug 13, 2007, at 9:36 AM, Simone Gotti wrote:

> Hi all,
>
> lvresize gives the message "Mirrors cannot be resized while active  
> yet."
> when trying to resize an active lv.
>
> Simple tests using directly dmsetup let me resize a mirror on the fly
> without problems (maybe I'm missing some problematic corner cases).  
> With
> a core log everything was resynced every time while with disk log only
> the extended part was resynced.
>
> So, is there only missing code in lvm2 (curious to know if I should be
> able to write the missing part) or also the kernel parts (dm-raid1,
> dm-log and future dm-clog) needs some more code?
>
> Thanks!
>
> Bye!
> -- 
> Simone Gotti
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
