Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k3JGNNe3029420
	for <linux-lvm@redhat.com>; Wed, 19 Apr 2006 17:23:23 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1FWFSd-0006cE-Dh
	for linux-lvm@redhat.com; Wed, 19 Apr 2006 17:23:23 +0100
Date: Wed, 19 Apr 2006 17:23:23 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM2 release 2.02.03 / device-mapper 1.02.04
Message-ID: <20060419162323.GC24520@agk.surrey.redhat.com>
References: <20060414214357.GE4521@agk.surrey.redhat.com>
	<BAY118-F337680DC84BF4A3A2F9875AFC70@phx.gbl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BAY118-F337680DC84BF4A3A2F9875AFC70@phx.gbl>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Apr 18, 2006 at 06:28:46AM +0700, Alexey Shinkin wrote:
> And both are still "development" , not "stable" ?
> What is criteria of "stability" and do you plan to release stable versions ?

The labelling is like a 'release candidate' process: if no significant
problems reveal themselves with a particular release after a
reasonable amount of time, and I believe it is at least as 'stable' as
the existing release labelled 'stable', I'll move the label forward.

None of the lvm2 2.02 releases so far deserved that label - there was
some problem or other with each of them.  With the current release,
I think we're quite close now.

> And how stable are versions that included in RedHat/Fedora Core 
> distributions ?

RHEL aims at stability and so takes bug fixes more quickly than it
takes enhancements and other changes.

Fedora tracks upstream development more closely.

Alasdair
-- 
agk@redhat.com
