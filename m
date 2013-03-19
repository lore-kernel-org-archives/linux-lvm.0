Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r2JFj2bZ008565
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 11:45:06 -0400
Received: from h01.hoster-ok.com (h01.hoster-ok.com [88.86.111.110])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2JFj0lk000540
	for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 11:45:00 -0400
Received: from bubble-sam.sam-solutions.net (r01-ge0-SH.prague.vds-ok.com
	[88.86.98.3] (may be forged)) (authenticated as <bubble>)
	by h01.hoster-ok.com (8.14.3/8.14.3/HOSTER-OK) with ESMTP id
	r2JFiwsH017689
	(using TLSv1/SSLv3 with cipher DHE-RSA-AES256-SHA (256 bits) verified
	NO) for <linux-lvm@redhat.com>; Tue, 19 Mar 2013 16:44:59 +0100
Message-ID: <514887FA.4000104@hoster-ok.com>
Date: Tue, 19 Mar 2013 18:44:58 +0300
From: Vladislav Bogdanov <bubble@hoster-ok.com>
MIME-Version: 1.0
References: <1363699970-10002-1-git-send-email-bubble@hoster-ok.com>
	<1363699970-10002-2-git-send-email-bubble@hoster-ok.com>
	<20130319152347.GA986@redhat.com> <51488550.5070201@hoster-ok.com>
In-Reply-To: <51488550.5070201@hoster-ok.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH 01/10] lvchange: Allow cluster lock
	conversion
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

19.03.2013 18:33, Vladislav Bogdanov wrote:
> 19.03.2013 18:23, David Teigland wrote:
>> On Tue, Mar 19, 2013 at 01:32:41PM +0000, Vladislav Bogdanov wrote:
>>> Allow clvm locks to be converted shared <-> exclusive with corosync/dlm.
>>>
>>> Without this it is impossible to alow both
>>> * VM migration (shared lock is required)
>>> * host-side snapshots of VM disks (exlusive lock is required)
>>>
>>> Locks are only converted if --force parameter passed to lvchange.
>>>
>>> Internally LKF_CONVERT flag is passed to dlm, so that is a real lock
>>> conversion.
>>>
>>> Also deny release of an exclusive lock on a remote note without --force
>>> flag to lvchange -an.
>>
>> I'm trying to figure out why the code doesn't already use CONVERT when
>> possible; I would have expected it to. 
> 
> Like me - that's why this patch.
> 
>> (It has to be combined with
>> NOQUEUE to avoid deadlocks.)
> 
> It is from what I see.
> 
>> What happens now without this force/CONVERT
>> patch? a new lock created/requested?
>>
> 
> No, just returns error.

After new lock creation is requested ;) It's a deep evening here, sorry
for being not correct...

> 
> ...
> #lvchange.c:153     Activating logical volume "lustre03-right.vds-ok.com_disk0" exclusively
> #activate/dev_manager.c:285         Getting device info for VG_VDS_OK_POOL_1-lustre03--right.vds--ok.com_disk0 [LVM-2nCt35tXpJcEJUErLzSM3nTjJZwr0DvX3FDOuTp381ZIEVQvUrGCqoSYs4lGhW2O]
> #ioctl/libdm-iface.c:1687         dm info  LVM-2nCt35tXpJcEJUErLzSM3nTjJZwr0DvX3FDOuTp381ZIEVQvUrGCqoSYs4lGhW2O NF   [16384] (*1)
> #locking/cluster_locking.c:563         Lock held for 2nCt35tXpJcEJUErLzSM3nTjJZwr0DvX3FDOuTp381ZIEVQvUrGCqoSYs4lGhW2O, node 3804050a : CR
> #locking/cluster_locking.c:563         Lock held for 2nCt35tXpJcEJUErLzSM3nTjJZwr0DvX3FDOuTp381ZIEVQvUrGCqoSYs4lGhW2O, node 5c04050a : CR
> #locking/cluster_locking.c:563         Lock held for 2nCt35tXpJcEJUErLzSM3nTjJZwr0DvX3FDOuTp381ZIEVQvUrGCqoSYs4lGhW2O, node 3904050a : CR
> #activate/activate.c:1050       VG_VDS_OK_POOL_1/lustre03-right.vds-ok.com_disk0 is active
> #locking/cluster_locking.c:503       Locking LV 2nCt35tXpJcEJUErLzSM3nTjJZwr0DvX3FDOuTp381ZIEVQvUrGCqoSYs4lGhW2O EX (LV|NONBLOCK|CLUSTER|LOCAL) (0xdd)
> #locking/cluster_locking.c:391   Error locking on node 3904050a: Device or resource busy
> ...
