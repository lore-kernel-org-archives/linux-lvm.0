Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id qBEAjKY2000842
	for <linux-lvm@redhat.com>; Fri, 14 Dec 2012 05:45:21 -0500
Received: from itoolabs.net (be02.de01.itoolabs.net [188.40.74.249])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qBEAjJrl022683
	for <linux-lvm@redhat.com>; Fri, 14 Dec 2012 05:45:19 -0500
Received: from [92.239.81.7] (account dop@itoolabs.co.uk HELO [192.168.16.3])
	by be02-de01.itoolabs.net (CommuniGate Pro SMTP 5.3.10)
	with ESMTPSA id 968766 for linux-lvm@redhat.com;
	Fri, 14 Dec 2012 10:45:18 +0000
Message-ID: <50CB033D.7020102@yahoo.co.uk>
Date: Fri, 14 Dec 2012 10:45:17 +0000
From: Dmitry Panov <dmitry.panov@yahoo.co.uk>
MIME-Version: 1.0
References: <50C90FC1.4060803@yahoo.co.uk> <50C9A838.3080709@redhat.com>
	<20121214071040.GA10390@jajo.eggsoft>
In-Reply-To: <20121214071040.GA10390@jajo.eggsoft>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] clvmd on cman waits forever holding the P_#global
 lock on node re-join
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com


On 14/12/12 07:10, Jacek Konieczny wrote:
> On Thu, Dec 13, 2012 at 11:04:40AM +0100, Zdenek Kabelac wrote:
>> Hmmm this rather looks like a logical problem either in
>> the if() expression in (select_status == 0) branch,
> No fix in the (select_status == 0) branch would solve anything, as the
> branch is never executed. This is the major problem here.
>
> Select has timeout set to 60 seconds, a few fd events come each minute
> -> the select never times out, select_status is always != 0.
>
> Shortening the cmd_timeout setting would work, but that would be only a
> workaround and would work until the fd events come even more often.
Applying my patch would solve the problem with timeout code not being 
run as well. And regardless of whether the underlying issue is fixed or 
not the timeout handling must be fixed too because we can't totally 
avoid timeouts (that's why the code is there).


-- 
Dmitry Panov
