Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i31GiAj25451
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2004 11:44:10 -0500
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i31Gi9Y21623
	for linux-lvm@redhat.com; Thu, 1 Apr 2004 10:44:09 -0600
Date: Thu, 1 Apr 2004 10:44:09 -0600
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] DESTDIR is broken in 1.00.09
Message-ID: <20040401104409.T17377@homer.msp.redhat.com>
References: <200404010207.38892.arekm@pld-linux.org>
	<406B9F1A.50902@backtobasicsmgmt.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <406B9F1A.50902@backtobasicsmgmt.com>;
	from kpfleming@backtobasicsmgmt.com on Wed, Mar 31, 2004 at
	09:48:26PM -0700
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

On Wed, Mar 31, 2004 at 09:48:26PM -0700, Kevin P. Fleming wrote:
> Hmmm, I submitted a patch to fix this problem before this last release, 
> and it was accepted (with modifications) but didn't appear in the release.

The problem is fixed in make.tmpl.in in the LVM2 release, but I haven't 
synced the updates to the build process across to the device-mapper tree yet.
I'll do it soon.

Alasdair
-- 
agk@redhat.com
