Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r56HsGI6010212
	for <linux-lvm@redhat.com>; Thu, 6 Jun 2013 13:54:16 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de [212.227.17.8])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r56HsEx9009961
	for <linux-lvm@redhat.com>; Thu, 6 Jun 2013 13:54:15 -0400
Received: from [192.168.0.8] by pse.dyndns.org with esmtp (Exim 4.72)
	(envelope-from <pgadmin@pse-consulting.de>) id 1UkeHQ-0004PE-LN
	for linux-lvm@redhat.com; Thu, 06 Jun 2013 19:47:20 +0200
Message-ID: <51B0CCC8.6030907@pse-consulting.de>
Date: Thu, 06 Jun 2013 19:54:16 +0200
From: Andreas Pflug <pgadmin@pse-consulting.de>
MIME-Version: 1.0
References: <1370516793.18941.YahooMailClassic@web181501.mail.ne1.yahoo.com>
In-Reply-To: <1370516793.18941.YahooMailClassic@web181501.mail.ne1.yahoo.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] clvmd leaving kernel dlm uncontrolled lockspace
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Am 06.06.13 13:06, schrieb matthew patton:
> --- On Thu, 6/6/13, Andreas Pflug <pgadmin@pse-consulting.de> wrote:
>
>> On a machine being Xen host with 20+ running VMs I'd clearly
>> prefer to clean those orphaned memory space and go on.... I
> This is exactly why it is STRONGLY suggested you split your storage tier from your compute tier. The lowest friction method would be a pair that hold the disks (or access a common disk set) and export it as NFS. The compute nodes can speed things up with CacheFS for their local running VMs assuming you shepherd the live-migration process.

The Xen hosts are iscsi initiators, but their usage of the san-located 
vg has to be coordinated, using clvmd. It's just what xcp/xenserver 
does, but with clvmd to insure locking (apparently xcp/xenserver relies 
on friendly behaviour, using no locking)
>
> If the VMs all want to have a shared filesystem for a running app and the app can't be written to work safely with NFS (why not?) then you can run corosync and friends +GFS2 at that level.

The VMs have their private devices, each a LV on a san-vg.

Regards
Andreas
