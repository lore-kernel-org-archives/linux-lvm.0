Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m9NKS5K3010820
	for <linux-lvm@redhat.com>; Thu, 23 Oct 2008 16:28:05 -0400
Received: from scidubsmtp01.stercomm.com (scidubsmtp01.stercomm.com
	[209.95.244.35])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m9NKRoBt021775
	for <linux-lvm@redhat.com>; Thu, 23 Oct 2008 16:27:51 -0400
Received: from IWDUBCORMSG001.sci.local (iwdubcormsg001.sci.local
	[10.105.142.31])
	by boamail1.stercomm.com (Postfix) with ESMTP id 935D233FE7
	for <linux-lvm@redhat.com>; Thu, 23 Oct 2008 16:28:12 -0400 (EDT)
Subject: Re: [linux-lvm] LVM corruption possibilites??
From: Chris Cox <chris_cox@stercomm.com>
In-Reply-To: <20081023193142.GA17753@netfirms.com>
References: <20081023193142.GA17753@netfirms.com>
Content-Transfer-Encoding: 7bit
Date: Thu, 23 Oct 2008 15:27:46 -0500
Message-Id: <1224793666.30118.16.camel@behemoth.csg.stercomm.com>
Mime-Version: 1.0
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

On Thu, 2008-10-23 at 15:31 -0400, Steve Shorter wrote:
> Howdy!
> 
> 	I intend a simple minimal setup  of LVM. I have a number
> of hardware nodes connected to a SAN. On the SAN is a pool of  drives.
> If I assign whole drives to Volume Groups and dedicate each Volume Group
> to a single node, am I correct in assuming that data/metadata corruption
> will/can not occur? Each node will only modify the VG that it is assigned.
> Are there any other issues that need to be considered? Am I correct
> in assuming that Volume/LVM metadata for a volume is written only
> to disks in that volume and volumes are independent of each other and
> that in this simple setup some kind of clustering solution  is not
> neccessary? 

Well... if the LVM metas are VISIBLE to all hosts, then yes... there
are situations where this will cause some confusion.

Let's just say that even it is possible... it just doesn't
sound like something wise to do.

Usually you perform LUN masking on storage areas you expose to
prevent other hosts within the same zone from seeing each others
storage.

The problem without masking is that a scan will find all of the
metas if the drives (LUNs) are visible to all.

For safety and to avoid some consistency issues, I'd use
LUN masking.  Just my opinion.
