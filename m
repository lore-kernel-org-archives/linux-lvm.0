Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB3LcRr17513
	for <linux-lvm@redhat.com>; Fri, 3 Dec 2004 16:38:27 -0500
Received: from nexredback-216-168-119-94.nexicom.net (vpn.triplepc.com
	[216.168.105.38] (may be forged))
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id iB3LcQQF012150
	for <linux-lvm@redhat.com>; Fri, 3 Dec 2004 16:38:26 -0500
Message-ID: <41B0DCAE.6040207@mikebabcock.ca>
Date: Fri, 03 Dec 2004 16:37:50 -0500
From: "Michael T. Babcock" <mike@mikebabcock.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Replacing a physical volume
References: <OFF09DC32C.3675605C-ON86256F5F.005FB33E-86256F5F.006275BC@austinlogistics.com>
In-Reply-To: <OFF09DC32C.3675605C-ON86256F5F.005FB33E-86256F5F.006275BC@austinlogistics.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Jetkins@austinlogistics.com wrote:

>What will happen when the system reboots and finds /dev/sdb is now blank?
>Will LVM get upset, or will it simply forget about the PV that used to be
>there, so that I can create a new PV on a partition on the new disk
>(/dev/sdb1)?
>  
>

I've done this.

Once you pvremove the disk/partition, it is no longer needed.  Unplug 
it, and reboot in runlevel 1 if you wish and you should see no errors.

Personally the whole physical volume concept needs reworking, but thats 
just my $0.02.
-- 
Michael T. Babcock
