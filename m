Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8IJ8IdF029945
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 15:08:18 -0400
Received: from lx11.mdmiller.com (wsip-68-96-21-160.om.om.cox.net
	[68.96.21.160])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8IJ8BQo028965
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 15:08:11 -0400
Received: from [192.168.0.6] (wsip-68-96-21-155.om.om.cox.net [68.96.21.155])
	by lx11.mdmiller.com (Postfix) with ESMTP id C9C8239D60F
	for <linux-lvm@redhat.com>; Mon, 18 Sep 2006 14:08:05 -0500 (CDT)
Message-ID: <450EEEA0.7020703@mdmiller.com>
Date: Mon, 18 Sep 2006 14:08:16 -0500
From: Mitch Miller <mitch@mdmiller.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] HDD Failure
References: <1158603016.7182.12.camel@localhost.localdomain>
In-Reply-To: <1158603016.7182.12.camel@localhost.localdomain>
Content-Transfer-Encoding: 7bit
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

Nick -- if I understand your situation properly, you effectively took 
one of the platters (the bad drive) out of the drive (the vg) and now 
you still want to be able to access the entire drive ... ??  I don't 
think that's going to happen.

Off to the backups, I'd say ...

-- Mitch



Nick wrote:
> Hello List,
> 
> I have a 3x 120GB HDD that are all lumped into one LVM volume. Recently,
> one died so I removed it using.
> 
> # vgreduce --removemissing Vol1
> 
> This worked fine but now I can't mount the volume group:
> 
> root@nibiru:~# cat /etc/fstab | grep Vol
> /dev/mapper/Vol1-share /share          ext3    defaults        0       2
> root@nibiru:~# mount /share
> mount: special device /dev/mapper/Vol1-share does not exist
> root@nibiru:~#
> 
> I've no idea why it says it doesn't exist as I thought all I did was
> remove missing PE's from a VG - not remove the actual VG!
> 
> Can anyone help me get my data back? Thanks for any advice.
> 
> Nick
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
