Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k1EEkf3E022038
	for <linux-lvm@redhat.com>; Tue, 14 Feb 2006 14:46:41 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1F91Rx-0005L3-GC
	for linux-lvm@redhat.com; Tue, 14 Feb 2006 14:46:41 +0000
Date: Tue, 14 Feb 2006 14:46:41 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] can't create a PV
Message-ID: <20060214144641.GB12169@agk.surrey.redhat.com>
References: <20060206215141.GB7492@tui.site> <20060214091946.GA8977@tui.site>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20060214091946.GA8977@tui.site>
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

> >   LVM version:     2.00.25 (2004-09-29)
> >   Library version: 1.00.19-ioctl (2004-07-03)

Not a good version to use.
The md/partition detection was improved in 2.00.32.

Remember to run 'vgscan' after adding partitions;
and to reboot if fdisk fails to reload the partition table.

Newer versions let you add -vvvv and see exactly why any
device was ignored.  For older versions like your you
need to turn on debug logging to a file to get that information.

Alasdair
-- 
agk@redhat.com
