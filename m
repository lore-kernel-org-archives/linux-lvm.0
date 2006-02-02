Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k12NPQED032398
	for <linux-lvm@redhat.com>; Thu, 2 Feb 2006 23:25:26 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1F4npO-0007Vv-E6
	for linux-lvm@redhat.com; Thu, 02 Feb 2006 23:25:26 +0000
Date: Thu, 2 Feb 2006 23:25:26 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Expanding volume groups to fill a growing disk
Message-ID: <20060202232526.GU4280@agk.surrey.redhat.com>
References: <Pine.LNX.4.64.0602021457070.1276@localhost.localdomain>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0602021457070.1276@localhost.localdomain>
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

On Thu, Feb 02, 2006 at 03:06:31PM -0800, Ben wrote:
> Do I have to use fdisk to make a new partition, and then use pvcreate 
> followed by vgextend? 

pvresize, at least in recent releases.

Alasdair
-- 
agk@redhat.com
