Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8QG8PrF028003
	for <linux-lvm@redhat.com>; Wed, 26 Sep 2007 12:08:25 -0400
Received: from shuttlerun.csg.stercomm.com (scidalsmtp02.csg.stercomm.com
	[204.214.3.25])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l8QG8NFX027423
	for <linux-lvm@redhat.com>; Wed, 26 Sep 2007 12:08:24 -0400
Message-ID: <46FA83EB.103@stercomm.com>
Date: Wed, 26 Sep 2007 11:08:11 -0500
From: Chris Cox <chris_cox@stercomm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Copy LVs
References: <46FA2B68.8040908@ciber.com>
In-Reply-To: <46FA2B68.8040908@ciber.com>
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

Peter Larsen wrote:
> What's the "official" procedure of cloning Volume Groups or Logical
> Volumes across systems?
> 
> Let's say I want to clone the OS to a new box. Do I dd everything over,
> or is there a better "lvm" way?

Across platforms on a network?  Probably no "lvm" way.  I'd use
rsync, but you could to a compressed/gzip'd tar, or whatever depending
on your bandwidth.

(I'd setup the vg's and lv's independently before doing the copy)

If it's a pure migration, in the future you might want to look
at a standalone subsystem that could simply be moved from one
platform to the next (or some other migratable drive soln... even
if it's just moving the drives themselves).

> 
> Regards
>   Peter Larsen
> 
