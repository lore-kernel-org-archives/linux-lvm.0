Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i48CAev18435
	for <linux-lvm@redhat.com>; Sat, 8 May 2004 08:10:41 -0400
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i48CAeo27420
	for linux-lvm@redhat.com; Sat, 8 May 2004 07:10:40 -0500
Date: Sat, 8 May 2004 07:10:40 -0500
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvcreate --major?
Message-ID: <20040508071040.A29383@homer.msp.redhat.com>
References: <20040508021255.GU30964@polop.usc.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040508021255.GU30964@polop.usc.edu>;
	from garrick@usc.edu on Fri, May 07, 2004 at 07:12:56PM -0700
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

On Fri, May 07, 2004 at 07:12:56PM -0700, Garrick Staples wrote:
> Adding a persistent minor number works fine, but --major appears to be
> ignored. 

To set persistent, you have to specify both major and minor 
together with --persistent y.

Only works with 2.4 kernels - multiple major number support still needs
adding to 2.6 kernels for situations like yours.  

If it's not working on 2.4 with the latest release, let me know
and I'll investigate further.

Alasdair
-- 
agk@redhat.com
