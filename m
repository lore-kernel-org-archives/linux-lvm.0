Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j5TGXd3N030731
	for <linux-lvm@redhat.com>; Wed, 29 Jun 2005 17:33:39 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DnfVK-0001dn-SP
	for linux-lvm@redhat.com; Wed, 29 Jun 2005 17:33:38 +0100
Date: Wed, 29 Jun 2005 17:33:38 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] my volume group disappeared!
Message-ID: <20050629163338.GS27078@agk.surrey.redhat.com>
References: <Pine.LNX.4.44.0506291211180.15781-100000@algiers.clic.cs.columbia.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0506291211180.15781-100000@algiers.clic.cs.columbia.edu>
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

On Wed, Jun 29, 2005 at 12:17:15PM -0400, Dan B. Phung wrote:
> configured, and I do see the /dev/sda where the data lives, 
> and I can fdisk that device to see my array, but the physical
> volume also seems to be missing!
 
check for partition table

Alasdair
-- 
agk@redhat.com
