Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0501hr08741
	for <linux-lvm@redhat.com>; Tue, 4 Jan 2005 19:01:43 -0500
Received: from storix.com (mill-adnc_internal-206-71-178-18.adnc.com
	[206.71.178.18] (may be forged))
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0501WgR001082
	for <linux-lvm@redhat.com>; Tue, 4 Jan 2005 19:01:38 -0500
Received: from [192.168.1.126] (65.106.88.139.ptr.us.xo.net [65.106.88.139])
	by storix.com (Postfix) with ESMTP id D2401158F7
	for <linux-lvm@redhat.com>; Tue,  4 Jan 2005 15:40:01 -0800 (PST)
Subject: Re: [linux-lvm] root filesystem snapshots
From: rich turner <rich@storix.com>
In-Reply-To: <1104879571.10802.17.camel@rich>
References: <1104877190.10802.15.camel@rich>
	<20050104223247.GF26670@agk.surrey.redhat.com>
	<1104879571.10802.17.camel@rich>
Message-Id: <1104883422.10802.33.camel@rich>
Mime-Version: 1.0
Date: Tue, 04 Jan 2005 16:03:43 -0800
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

sorry to be a pest about this, but can anyone tell me what the criteria
for snapshots on root to fail?

all LVM2?
LVM2 with 2.6 kernel only?

On Tue, 2005-01-04 at 14:59, rich turner wrote:
> is only not supported with LVM2? i am almost certain this worked with
> earlier versions of LVM.
> 
> On Tue, 2005-01-04 at 14:32, Alasdair G Kergon wrote:
> > On Tue, Jan 04, 2005 at 02:19:51PM -0800, rich turner wrote:
> > > in the past i have read a number of posts related to problems with doing
> > > snapshots of logical volumes that contain the root filesystem. 
> > 
> > Simply not supported yet.
> > 
> > Some changes in WHATS_NEW move towards supporting it - in particular 
> > a kernel with headers supporting the O_NOATIME change in 2.00.23 is a
> > pre-requisite.
> > 
> > Alasdair
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
