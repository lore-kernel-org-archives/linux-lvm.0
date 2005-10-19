Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j9JGurM0009860
	for <linux-lvm@redhat.com>; Wed, 19 Oct 2005 17:56:53 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1ESHFE-000745-N9
	for linux-lvm@redhat.com; Wed, 19 Oct 2005 17:56:52 +0100
Date: Wed, 19 Oct 2005 17:56:52 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] creating a snapshot
Message-ID: <20051019165652.GJ30611@agk.surrey.redhat.com>
References: <1129740801.29185.90.camel@joesgrill.cc.vt.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1129740801.29185.90.camel@joesgrill.cc.vt.edu>
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

On Wed, Oct 19, 2005 at 12:53:21PM -0400, Bill Ranck wrote:
>   snapshot: Required device-mapper target(s) not detected in your kernel

modprobe dm-snapshot
 
There's an untested fix for this in CVS now.

Alasdair
-- 
agk@redhat.com
