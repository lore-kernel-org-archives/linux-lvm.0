Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j0IK1Sxg027237
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2005 20:01:28 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CqzXc-0002wa-MF
	for linux-lvm@redhat.com; Tue, 18 Jan 2005 20:01:28 +0000
Date: Tue, 18 Jan 2005 20:01:28 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] snapshots and nfs
Message-ID: <20050118200128.GS26670@agk.surrey.redhat.com>
References: <dff37527050118093648e504e@mail.gmail.com>
	<20050118194449.GQ26670@agk.surrey.redhat.com>
	<dff3752705011811541b040c4e@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dff3752705011811541b040c4e@mail.gmail.com>
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

On Tue, Jan 18, 2005 at 02:54:41PM -0500, Kristina Clair wrote:
> Now, if I run lvcreate shortly after the machine is booted, it runs
> successfully.  However, if I try to run the same command the next day,
> after it's been online and the webservers have had the filesystem
> mounted, it hangs when trying to suspend the volume.
 
How does it hang?  Do you get kernel error messages?
Try watching kernel memory usage just before the failures:
It could be one of the out-of-memory problems with snapshots 
that we're working on fixing.

Alasdair
-- 
agk@redhat.com
