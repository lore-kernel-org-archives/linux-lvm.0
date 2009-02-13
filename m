Received: from [10.34.32.183] (mazybook.englab.brq.redhat.com [10.34.32.183])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n1DGdDJw012222
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2009 11:39:14 -0500
Message-ID: <4995A232.10206@redhat.com>
Date: Fri, 13 Feb 2009 17:39:14 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Using pvmove with a clustered VG
References: <49959EEB.60900@nighthawkrad.net>
In-Reply-To: <49959EEB.60900@nighthawkrad.net>
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


Christopher Smith wrote:
> I want to use pvmove to move some LVs in a clustered VG off some 
> specific PVs so those PVs can be removed.
> 
> The LVs are used for Xen VMs, running in a cluster of 4 Xen hosts.  The 
> PVs are LUNs on a fibre channel attached SAN.
> 
> I have constructed a test environment to try out the basic theory before 
> moving onto more specific testing on SAN-attached hosts, however, it 
> seems that LVs cannot be moved unless they are deactived:

For pvmove of active clustered volumes you need cmirror
(clustered mirror target kernel module + userspace)
(which is not available in 5.2 release, should be in 5.3)

You can use pvmove on exclusively activated volume (on one node) only.


> I also found another reply to the earlier thread, that only went to 
> linux-cluster:
> 
> http://www.mail-archive.com/linux-cluster@redhat.com/msg04365.html
> 
> pvmove  Error locking on node clustertest01.syd.nighthawkrad.net: 
> device-mapper: reload ioctl failed: Invalid argument
> pvmove  Unable to reactivate logical volume "pvmove0"
> pvmove  ABORTING: Segment progression failed.

hmmm. Can you report it to the bugzilla and attach output from lvmdump?
(to Red Hat Bugzilla, not CentOS)

Milan
--
mbroz@redhat.com
