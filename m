Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iBLKaSge000960
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 20:36:28 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Cgqk7-0007q9-Oh
	for linux-lvm@redhat.com; Tue, 21 Dec 2004 20:36:27 +0000
Date: Tue, 21 Dec 2004 20:36:27 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Problems with LVM
Message-ID: <20041221203627.GQ26670@agk.surrey.redhat.com>
References: <41C1E058.1020300@slacker.se>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41C1E058.1020300@slacker.se>
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

On Thu, Dec 16, 2004 at 08:22:00PM +0100, Mattias Runge wrote:
> up when i did vgreduce --removemissing?

vgcfgrestore should undo that operation

You can activate with -P to replace the missing disk with zeros
(see 'man lvm').

> I am using reiserfs on the disk.

I've never heard of anyone having much success recovering data 
from reiserfs in such circumstances.  
ext2 is much easier.

Alasdair
-- 
agk@redhat.com
