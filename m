Received: from reti (vpn50-41.rdu.redhat.com [172.16.50.41])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i2IDtYJh026204
	for <linux-lvm@redhat.com>; Thu, 18 Mar 2004 13:55:35 GMT
Received: from joe by reti with local (Exim 4.30) id 1B3y1g-0000pj-Of
	for linux-lvm@redhat.com; Thu, 18 Mar 2004 13:57:36 +0000
Date: Thu, 18 Mar 2004 13:57:36 +0000
From: Joe Thornber <thornber@redhat.com>
Subject: Re: [linux-lvm] using DM/LVM to provide "chunked" view of devic
Message-ID: <20040318135736.GB628@reti>
References: <4059A7FA.6060603@mchsi.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4059A7FA.6060603@mchsi.com>
Sender: Joe Thornber <thornber@redhat.com>
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

On Thu, Mar 18, 2004 at 07:45:30AM -0600, Pete Flugstad wrote:
> Hello!
> 
> I'm wondering if I can use LVM (or rather Device Mapper) to provide a
> "chunked" or "split" view of a device (such as a block device or partition).
> 
> Specifically if I have a block device (i.e. /dev/hde1) that is 60GB, and
> I want to view it in 1GB chunks, say /dev/hde1.000 to /dev/hde1.059 or
> something like that.  That way I could, for example, setup a FTP or HTTP
> server to view these and download them over the network (of course I'd
> need to modify the server to be able to read from a block device),
> rather than having to download the entire 60 GB block device.
> 
> Is it possible to use DM/LVM to provide a view of the device like this?
> I am using Linux 2.6.X.

Yep, you can do this with either LVM (taking care not to put a label
on the PV) or just with dm by setting up simple tables with a single
linear mapping in them (see the dmsetup man page).

- Joe
