Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k3EEoqgI026471
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2006 15:50:52 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1FUPdM-0003mw-OC
	for linux-lvm@redhat.com; Fri, 14 Apr 2006 15:50:52 +0100
Date: Fri, 14 Apr 2006 15:50:52 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM2, NFS and random device (major:minor) numbers
Message-ID: <20060414145052.GD10725@agk.surrey.redhat.com>
References: <Pine.LNX.4.62.0604131143270.21727@gate.nmr.mgh.harvard.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.62.0604131143270.21727@gate.nmr.mgh.harvard.edu>
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

On Fri, Apr 14, 2006 at 10:08:40AM -0400, Paul Raines wrote:
> I have a NFS server still running CentOS 4.0 (kernel 2.6.9-5.0.5.ELsmp, 
> lvm2-2.00.31-1.0.RHEL4).  

man exports
/fsid

Alasdair
-- 
agk@redhat.com
