Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0SMIerO019875
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2008 17:18:40 -0500
Received: from carlit.cesca.es (carlit.cesca.es [84.88.0.2])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0SMHQbt014890
	for <linux-lvm@redhat.com>; Mon, 28 Jan 2008 17:17:26 -0500
Message-ID: <479E7054.3060901@cesca.es>
Date: Tue, 29 Jan 2008 01:16:20 +0100
From: Jordi Prats <jprats@cesca.es>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM limits?
References: <479DAD35.1080209@cesca.es>
	<479E2BEF.1090703@cesca.es>	<1201541894.30560.24.camel@behemoth.csg.stercomm.com>	<200801281801.m0SI10Xi010185@beta.mvs.co.il>
	<1C8CF1EA1A5B5940B81B0710B2A4C9385030AC683C@an-ex.ActiveNetwerx.int>
In-Reply-To: <1C8CF1EA1A5B5940B81B0710B2A4C9385030AC683C@an-ex.ActiveNetwerx.int>
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

Agree. But, at least in my case, I've been studying better alternatives
(this means testing) but I've been required to grow the file system
because of our needs.

So, It's not the best solution, but until I can move to a better one
(this probably means buy more hardware) this is my best option to
provide space.

JFS, XFS and other file systems seems ok, but it wouldn't be a better
solution something like Lustre, Ceph or GlusterFS? They seems to provide
better scalability been also POSIX-compliant. What do you think?

Any inputs will be welcome :)

regards,
Jordi

Joseph L. Casale wrote:
>> It took less then 90 minutes.
>>
>> Ehud.
> 
> 90 Minutes, how "enterprisable" is that? Just cause you can, doesn't mean you should: What if that server tanked during working hours at the corp? You would have to sit and wait for it to come back up. Worse than that are the rebuild times for degraded arrays. Try to rebuild a **huge** array on **huge** discs during production with lots of IO and hope you don't lose another disc. There are practical alternatives with thoughtful management to circumvent the need for and 8EB or larger array, but YMMV :)
> 
> jlc
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
