Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pB2LFK0q006634
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 16:15:21 -0500
Received: from mx.binnacle.cx (mx.binnacle.cx [74.95.187.105])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pB2LFKqA001011
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 16:15:20 -0500
Received: from CIANNAIT.binnacle.cx (ciannait [172.29.87.10])
	by mx.binnacle.cx (envelope-from <starlight@binnacle.cx>)
	(8.14.4/8.14.4) with ESMTP id pB2LFJxc001021
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2011 16:15:19 -0500
Message-Id: <6.2.5.6.2.20111202160842.063ebbf0@binnacle.cx>
Date: Fri, 02 Dec 2011 16:14:44 -0500
From: starlight@binnacle.cx
In-Reply-To: <alpine.LRH.2.00.1112021553440.5337@bmsred.bmsi.com>
References: <6.2.5.6.2.20111202121427.03b28738@flumedata.com>
	<6.2.5.6.2.20111202132949.03b2cc68@binnacle.cx>
	<alpine.LRH.2.00.1112021553440.5337@bmsred.bmsi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [linux-lvm] cmp of inactive mirrored LV fails
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

By coincidence I've just setup my first MD
RAID0 partitions on a different system.
Discovered

   echo "check" >>/sys/block/md?/md/sync_action

which triggers a mirror check.  I'm guessing that
this operation takes account of the DISCARD
discrepencies and therefore does not report
false errors.  (correct me if I'm wrong)

Does LVM have anything similar to this feature?


At 04:01 PM 12/2/2011 -0500, Stuart D. Gathman wrote:
>This is not necessarily a bug.  Both MD and LVM support
>DISCARD, and discarded blocks are not necessarily synced
>between mirror legs.  The same thing happens with MD,
>and the MD "cmp" operation reports the number of blocks
>out of sync, but not which blocks!  (So LVM is actually
>an improvement on that score.)  Swap volumes make
>heavy use of DISCARD and are especially likely to
>have blocks out of sync.
