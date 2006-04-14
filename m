Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k3ELWpgI014198
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2006 22:32:51 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1FUVuN-0004Ay-3T
	for linux-lvm@redhat.com; Fri, 14 Apr 2006 22:32:51 +0100
Date: Fri, 14 Apr 2006 22:32:51 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM2, NFS and random device (major:minor) numbers
Message-ID: <20060414213251.GH10725@agk.surrey.redhat.com>
References: <20060414145052.GD10725@agk.surrey.redhat.com>
	<Pine.LNX.4.62.0604141708370.4454@gate.nmr.mgh.harvard.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.62.0604141708370.4454@gate.nmr.mgh.harvard.edu>
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

On Fri, Apr 14, 2006 at 05:22:20PM -0400, Paul Raines wrote:
> that depend on a persistent device id.

2.4 kernel supported both persistent major and persistent minor

But the changes to do that came after 2.6 forked off and they have
never been ported to 2.6.

So the tools pretend to let you specify the major - on 2.4 this
works - but on 2.6 it's ignored by the kernel.  I expect someone 
will fix the kernel side of this some day so it works like
the 2.4 version in which device-mapper can use different major
numbers for different devices.

You should be able to specify the device-mapper major number 
at boot/module load time though, as the 'major' parameter, instead
of having a dynamic one.

Persistent minors, as you discovered, should be allocated from
the top of the range.
 
Alasdair
-- 
agk@redhat.com
