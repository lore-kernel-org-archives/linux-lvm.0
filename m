Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iBLII7ge024778
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 18:18:08 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CgoaF-0007gP-VB
	for linux-lvm@redhat.com; Tue, 21 Dec 2004 18:18:07 +0000
Date: Tue, 21 Dec 2004 18:18:07 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] PVs that are reused / reformatted as filesystems
Message-ID: <20041221181807.GK26670@agk.surrey.redhat.com>
References: <41C650A3.2090302@vilain.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41C650A3.2090302@vilain.net>
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

On Mon, Dec 20, 2004 at 05:10:11PM +1300, Sam Vilain wrote:
> I have a system on which a partition that was once a PV was recycled as
> a filesystem.  Now, it has a valid ext3 filesystem on it, but also the
> PV signature appears to be there.  

In future use pvremove to wipe a PV - the opposite of pvcreate.
And first use vgreduce to remove it from its volume group.

Alasdair
-- 
agk@redhat.com
