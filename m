Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j04MvWr24862
	for <linux-lvm@redhat.com>; Tue, 4 Jan 2005 17:57:32 -0500
Received: from storix.com (mill-adnc_internal-206-71-178-18.adnc.com
	[206.71.178.18] (may be forged))
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j04MvRWa022357
	for <linux-lvm@redhat.com>; Tue, 4 Jan 2005 17:57:27 -0500
Received: from [192.168.1.126] (65.106.88.139.ptr.us.xo.net [65.106.88.139])
	by storix.com (Postfix) with ESMTP id 6460E158DA
	for <linux-lvm@redhat.com>; Tue,  4 Jan 2005 14:35:51 -0800 (PST)
Subject: Re: [linux-lvm] root filesystem snapshots
From: rich turner <rich@storix.com>
In-Reply-To: <20050104223247.GF26670@agk.surrey.redhat.com>
References: <1104877190.10802.15.camel@rich>
	<20050104223247.GF26670@agk.surrey.redhat.com>
Message-Id: <1104879571.10802.17.camel@rich>
Mime-Version: 1.0
Date: Tue, 04 Jan 2005 14:59:32 -0800
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

is only not supported with LVM2? i am almost certain this worked with
earlier versions of LVM.

On Tue, 2005-01-04 at 14:32, Alasdair G Kergon wrote:
> On Tue, Jan 04, 2005 at 02:19:51PM -0800, rich turner wrote:
> > in the past i have read a number of posts related to problems with doing
> > snapshots of logical volumes that contain the root filesystem. 
> 
> Simply not supported yet.
> 
> Some changes in WHATS_NEW move towards supporting it - in particular 
> a kernel with headers supporting the O_NOATIME change in 2.00.23 is a
> pre-requisite.
> 
> Alasdair
