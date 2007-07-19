Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6JLp5Tc032550
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2007 17:51:05 -0400
Received: from webmail.icp-qv1-irony2.iinet.net.au
	(webmail.icp-qv1-irony2.iinet.net.au [203.59.1.107])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l6JLowP3021175
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2007 17:50:59 -0400
Message-ID: <469FDCBE.2010403@iinet.net.au>
Date: Fri, 20 Jul 2007 07:50:54 +1000
From: David Timms <dtimms@iinet.net.au>
MIME-Version: 1.0
Subject: Re: [linux-lvm] snapshots can't be deactivated
References: <Pine.LNX.4.44.0707191047010.6647-100000@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.44.0707191047010.6647-100000@bmsred.bmsi.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Stuart D. Gathman wrote:
> On Wed, 18 Jul 2007, Joachim Banzhaf wrote:
> 
>>> Are my steps right in principle? Did I forget to do something before or
>>> after removing?
>> I am by no means an expert on lvm, so dont take this too seriously: shouldn't 
>> there be an lvchange -an yourlv before lvremove? Maybe this active status is 
>> still hanging around somewhere although you can force the remove?
> 
> When I try lvchange -an C4_SNAP, it always fails.  So I have had to force
> the lvremove in the backup script.  I am nervous about this, and already asked
> why this is the case.  When reading about the "active" flag, it seems
> to have something to do with shared SAN storage volume groups, so perhaps we
> are not supposed to deactivate LVs for simple single machine systems.  But the
> error from lvremove is disconcerting.  If I force it, what if there is
> a *different* error that I really *don't* want to force?
Perhaps the command produces an errorlevel that you could test against, 
and only continue when you get the expected error ?

DaveT.
