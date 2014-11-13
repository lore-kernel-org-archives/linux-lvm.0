Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sADJmLV6003097
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2014 14:48:21 -0500
Received: from nm26-vm6.access.bullet.mail.gq1.yahoo.com
	(nm26-vm6.access.bullet.mail.gq1.yahoo.com [216.39.63.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sADJmKUB002482
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2014 14:48:20 -0500
Message-ID: <1415908098.760.YahooMailBasic@web181504.mail.ne1.yahoo.com>
Date: Thu, 13 Nov 2014 11:48:18 -0800
From: matthew patton <pattonme@yahoo.com>
In-Reply-To: <54650631.4020707@ttux.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] broken fs after removing disk from group
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
To: LVM general discussion and development <linux-lvm@redhat.com>

> https://www.novell.com/coolsolutions/appnote/19386.html#DiskPermanentlyRemoved
 
 >  pvdisplay shows the 3 disks exactly like before I had the one that

> The filesystem size (according to the superblock) is 675863552 blocks
> The physical size of the device is 597721088 blocks

what about LVdisplay? Clearly the replacement chunk from the new device isn't the correct size. It's short by 39071232KB or roughly 37GB.

Is the VG configuration restore file human readable?
