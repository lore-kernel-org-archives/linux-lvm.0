Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j04MWl0a024367
	for <linux-lvm@redhat.com>; Tue, 4 Jan 2005 22:32:47 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1ClxEN-0003dp-KO
	for linux-lvm@redhat.com; Tue, 04 Jan 2005 22:32:47 +0000
Date: Tue, 4 Jan 2005 22:32:47 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] root filesystem snapshots
Message-ID: <20050104223247.GF26670@agk.surrey.redhat.com>
References: <1104877190.10802.15.camel@rich>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1104877190.10802.15.camel@rich>
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

On Tue, Jan 04, 2005 at 02:19:51PM -0800, rich turner wrote:
> in the past i have read a number of posts related to problems with doing
> snapshots of logical volumes that contain the root filesystem. 

Simply not supported yet.

Some changes in WHATS_NEW move towards supporting it - in particular 
a kernel with headers supporting the O_NOATIME change in 2.00.23 is a
pre-requisite.

Alasdair
-- 
agk@redhat.com
