Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2IDjbj00817
	for <linux-lvm@redhat.com>; Thu, 18 Mar 2004 08:45:37 -0500
Received: from sccimhc02.asp.att.net (sccimhc02.asp.att.net [63.240.76.164])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2IDja4b002122
	for <linux-lvm@redhat.com>; Thu, 18 Mar 2004 08:45:36 -0500
Message-ID: <4059A7FA.6060603@mchsi.com>
Date: Thu, 18 Mar 2004 07:45:30 -0600
From: Pete Flugstad <peteflugstad@mchsi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] using DM/LVM to provide "chunked" view of devic
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hello!

I'm wondering if I can use LVM (or rather Device Mapper) to provide a
"chunked" or "split" view of a device (such as a block device or partition).

Specifically if I have a block device (i.e. /dev/hde1) that is 60GB, and
I want to view it in 1GB chunks, say /dev/hde1.000 to /dev/hde1.059 or
something like that.  That way I could, for example, setup a FTP or HTTP
server to view these and download them over the network (of course I'd
need to modify the server to be able to read from a block device),
rather than having to download the entire 60 GB block device.

Is it possible to use DM/LVM to provide a view of the device like this?
I am using Linux 2.6.X.

Thanks,
Pete
