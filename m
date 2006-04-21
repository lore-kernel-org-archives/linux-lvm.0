Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3LKYKBm000968
	for <linux-lvm@redhat.com>; Fri, 21 Apr 2006 16:34:20 -0400
Received: from orca.ele.uri.edu (orca.ele.uri.edu [131.128.51.63])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3LKY97i027975
	for <linux-lvm@redhat.com>; Fri, 21 Apr 2006 16:34:14 -0400
Subject: Re: [linux-lvm] LVM. Do i loose everything?
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <4442C7D0.40206@ee.duth.gr>
References: <4442C7D0.40206@ee.duth.gr>
Date: Fri, 21 Apr 2006 16:33:55 -0400
Message-Id: <1145651636.8556.200.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: mingz@ele.uri.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
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

On Mon, 2006-04-17 at 01:40 +0300, kyr wrote:
> Hello,
> 
>      I wound be thankful if you can answer one simple question that I 
> haven't found the answer in all the LVM manuals, FAQ, howtos.
> 
> I have a continuous (not stiped) VG consisting of 3 PV (Hard Disks) with 
> one LV on EXT3.
> 
> If one hard disk fails (hardware) will i loose everything on all disks?

depends on how u define everything. if u have 3 disk and 1 disk fail,
then u lose the data bytes on that disk only. but since u run ext3 on
it. ext3 will not be able to run properly with that. then u will not be
able to read u file out. so u lose u "files".

try not do that with u important data.

ming


> 
> 
> I thank you in advance.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
