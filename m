Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7QGDhV27841
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2005 12:13:43 -0400
Received: from shell.wgops.com (postfix@free.wgops.com [69.51.116.66])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7QGDhWf018798
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2005 12:13:43 -0400
Received: from [10.1.2.206] (localhost [127.0.0.1])
	by shell.wgops.com (Postfix) with ESMTP id BC16A25875
	for <linux-lvm@redhat.com>; Fri, 26 Aug 2005 10:13:33 -0600 (MDT)
Date: Fri, 26 Aug 2005 10:13:32 -0600
From: Michael Loftis <mloftis@wgops.com>
Subject: Re: [linux-lvm] pvmove on broken disk
Message-ID: <3361914A535DD23CBBC6B90F@dhcp-2-206.wgops.com>
In-Reply-To: <1125062786.2225.34.camel@pc7.dolda2000.com>
References: <1125062786.2225.34.camel@pc7.dolda2000.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



--On August 26, 2005 3:26:26 PM +0200 Fredrik Tolf <fredrik@dolda2000.com> 
wrote:

> Dear List,
>
<...>
> I've got a related question as well, but it's not really LVM-related.
> The thing is that there's something strange with either the IDE chipset
> (a Promise card) or the corresponding driver that this disk is connected
> to, which causes a kernel panic every time a read from a bad sector is
> attempted. I figure I can "fix" that by connecting the drives to a
> different computer while pvmoving, but I wouldn't prefer to do that, as
> it causes downtime. Does someone on the list know of this problem and
> how to work around it? I figure that I can attempt to fix the driver
> bug, but I wouldn't prefer to experiment with that system...

Actually, if you're having PV errors, it might be the filesystem driver 
that's panic-ing....you'll need to run the output through ksymoops and find 
out where it's dieieng.  If you've corrupted filesystem data, that's the 
much more likely target (although what you're hypothesizing isn't 
impossible, I've just never seen that).

>
> Thanks for your time!
>
> Fredrik Tolf
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



--
"Genius might be described as a supreme capacity for getting its possessors
into trouble of all kinds."
-- Samuel Butler
