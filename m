Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3LEk9nk011134
	for <linux-lvm@redhat.com>; Fri, 21 Apr 2006 10:46:09 -0400
Received: from eastrmmtao05.cox.net (eastrmmtao05.cox.net [68.230.240.34])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3LEk20f006102
	for <linux-lvm@redhat.com>; Fri, 21 Apr 2006 10:46:02 -0400
Received: from [192.168.0.9] (really [70.179.95.46]) by eastrmmtao05.cox.net
	(InterMail vM.6.01.06.01 201-2131-130-101-20060113) with ESMTP
	id <20060421144556.JNZN29406.eastrmmtao05.cox.net@[192.168.0.9]>
	for <linux-lvm@redhat.com>; Fri, 21 Apr 2006 10:45:56 -0400
Message-ID: <4448F024.5020104@cox.net>
Date: Fri, 21 Apr 2006 10:45:56 -0400
From: Old Fart <rascal.jumper-747@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 release 2.02.03 / device-mapper 1.02.04
References: <20060414214357.GE4521@agk.surrey.redhat.com>	<1145564732.2658.15.camel@localhost>
	<20060421142546.GA32359@toucan.gentoo.org>
In-Reply-To: <20060421142546.GA32359@toucan.gentoo.org>
Content-Transfer-Encoding: 7bit
Reply-To: rascal.jumper-747@cox.net.spamorama.redhat.com,
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Eric Edgar wrote:
> I just wanted to add that I am seeing this issue as well.  2.02.03 and
> 2.02.04 both seem to suffer the same problem.  Downgrading to 2.02.02
>   seems to fix this issue.
>   
Same issue here.  Something definitely broken.  Had to revert mapper and 
lvm2 to previous versions:
# rpm -q device-mapper lvm2
device-mapper-1.02.02-3.2
lvm2-2.02.01-1.2.1

-- 
Regards,

Old Fart
