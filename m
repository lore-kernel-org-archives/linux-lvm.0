Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j1BMo9MR024254
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 22:50:09 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Czjc1-0005Lk-4i
	for linux-lvm@redhat.com; Fri, 11 Feb 2005 22:50:09 +0000
Date: Fri, 11 Feb 2005 22:50:09 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Feature Request (revert a logical volume back to its
	snapshot sta te)
Message-ID: <20050211225008.GI14093@agk.surrey.redhat.com>
References: <420D2BC6.3040905@dogpad.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <420D2BC6.3040905@dogpad.net>
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

On Fri, Feb 11, 2005 at 05:03:50PM -0500, Joe Harvell wrote:
> Recently, though I found myself wanting to use a snapshot logical volume 
> to preserve the state of a filesystem while I experimented with 
> changes.  When I needed to revert, I had to copy the contents from the 
> snashot logical volume, destroy the snapshot and snapshot source, and 
> then replace the snapshot source with the copy I made of the snapshot.
 
How about performing your tests on the snapshot device instead of the 
original?

Alasdair
-- 
agk@redhat.com
