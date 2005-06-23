Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5NHGPu24646
	for <linux-lvm@redhat.com>; Thu, 23 Jun 2005 13:16:25 -0400
Received: from mail.antispamx.com ([202.85.226.213])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5NHG7NN022970
	for <linux-lvm@redhat.com>; Thu, 23 Jun 2005 13:16:13 -0400
Message-Id: <200506231716.j5NHG7NN022970@mx1.redhat.com>
From: "Felix Chu" <felixchu@powernetix.com>
Subject: RE: [linux-lvm] Logical volume > 2TB question
Date: Fri, 24 Jun 2005 01:16:01 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1119530043.5503.4.camel@localhost.localdomain>
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
To: mingz@ele.uri.edu, 'LVM general discussion and development' <linux-lvm@redhat.com>


I am using IETD, linux-iscsi initiator.

By "lvdisplay" , it shows that LV 3TB was created successfully. Is that mean
the LVM can support 3TB?

By the way, what is the mean of "max cdb len" ? also what is the meaning of
"12"? Which file I should change if I use "linux-iscsi" initiator?

Thanks.

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
Behalf Of Ming Zhang
Sent: Thursday, June 23, 2005 8:34 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] Logical volume > 2TB question

On Thu, 2005-06-23 at 11:38 +0800, Felix Chu wrote:
> Hi all,
> 
assumed u use iet as target. it support >2TB device.

> I have a 4TB storage on iscsi target(Linux). Volume group can show 4TB.
When
> I create a 3TB logical volume, I find that Windows initiator cannot use
this
for windows, that is windows problem.

> 3TB storage. If I use Linux initiator, it can connect but only 2TB is
> available. 
for linux, which iscsi initiator u use? check the source code and change
the max cdb len to 16 instead of 12, which is default.

> 
> I know that there is limitation of LV with 2TB max. Any method to solve
it?
what u mean? u already create a 3TB lv...

> I am using Fedora core 3 with kernel 2.6.11.12.
> 
> Thanks,
> Felix
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
