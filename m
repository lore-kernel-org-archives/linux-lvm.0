Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i5BDoTbI008420
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2004 14:50:29 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1BYmQO-0004GB-Nd
	for linux-lvm@redhat.com; Fri, 11 Jun 2004 14:50:28 +0100
Date: Fri, 11 Jun 2004 14:50:28 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Running vgscan while swap on LVM is already active
Message-ID: <20040611135028.GM6302@agk.surrey.redhat.com>
References: <m2n03a6wxk.fsf@isnogud.escape.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m2n03a6wxk.fsf@isnogud.escape.de>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Jun 11, 2004 at 03:33:59PM +0200, Urs Thuermann wrote:
> /dev/vg0/swap (deleted)         partition       262136  0       -2

> But is the active swap space somehow tied to the device node
> /dev/vg0/swap in the file system.  

That certainly used to be the case - if you deleted an active swap file
it then became impossible to 'swapoff': don't do it and avoid running
tools that do it.

Don't know if this kernel issue's been addressed or not.

Alasdair
-- 
agk@redhat.com
