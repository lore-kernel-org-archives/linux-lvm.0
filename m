Received: from fentible.pjc.net (vpnuser1.surrey.redhat.com [172.16.9.1])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i6N6u6hp006327
	for <linux-lvm@redhat.com>; Fri, 23 Jul 2004 07:56:06 +0100
Received: from patrick by fentible.pjc.net with local (Exim 4.34)
	id 1BntyS-0002cv-02
	for linux-lvm@redhat.com; Fri, 23 Jul 2004 07:56:08 +0100
Date: Fri, 23 Jul 2004 07:56:07 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
Subject: Re: [linux-lvm] LVM2 and RAID 1 not working on Fedora Core 2
Message-ID: <20040723065607.GB9681@tykepenguin.com>
References: <001701c46ff1$cdcecc60$6b02a8c0@ZACK2>
	<20040722153408.GG10840@tykepenguin.com>
	<001001c47021$9accc800$6b02a8c0@ZACK2>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <001001c47021$9accc800$6b02a8c0@ZACK2>
Sender: Patrick <patrick@tykepenguin.com>
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

On Thu, Jul 22, 2004 at 03:25:09PM -0400, Zachary Hamm wrote:
> Thanks for the tip.  But "md_component_detection = 1" is already set in my
> lvm.conf file.   Any other tips?  Perhaps also linked to sometimes getting
> an "out of memory" message when running the user tools?
> 

Did you try the filter? The OOM error is almost certainly caused by the tools
reading an incorrect or corrupt header from the disk, and if your PVs are all MD
devices then there's no reason for LVM to scan the underlying disks.

patrick
