Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r56B6ZVX019920
	for <linux-lvm@redhat.com>; Thu, 6 Jun 2013 07:06:35 -0400
Received: from nm28.access.bullet.mail.mud.yahoo.com
	(nm28.access.bullet.mail.mud.yahoo.com [66.94.237.93])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r56B6YXk027849
	for <linux-lvm@redhat.com>; Thu, 6 Jun 2013 07:06:34 -0400
Message-ID: <1370516793.18941.YahooMailClassic@web181501.mail.ne1.yahoo.com>
Date: Thu, 6 Jun 2013 04:06:33 -0700 (PDT)
From: matthew patton <pattonme@yahoo.com>
In-Reply-To: <51B0296D.4090702@pse-consulting.de>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Teigland <teigland@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

--- On Thu, 6/6/13, Andreas Pflug <pgadmin@pse-consulting.de> wrote:

> On a machine being Xen host with 20+ running VMs I'd clearly
> prefer to clean those orphaned memory space and go on.... I

This is exactly why it is STRONGLY suggested you split your storage tier from your compute tier. The lowest friction method would be a pair that hold the disks (or access a common disk set) and export it as NFS. The compute nodes can speed things up with CacheFS for their local running VMs assuming you shepherd the live-migration process.

If the VMs all want to have a shared filesystem for a running app and the app can't be written to work safely with NFS (why not?) then you can run corosync and friends +GFS2 at that level.
