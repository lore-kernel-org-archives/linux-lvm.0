Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2PI9rj03322
	for <linux-lvm@redhat.com>; Thu, 25 Mar 2004 13:09:53 -0500
Subject: Re: [linux-lvm] Somewhat offtopic: Strange umount problem ....
From: David Johnston <david@littlebald.com>
In-Reply-To: <200403251534.47502.krienke@uni-koblenz.de>
References: <200403251534.47502.krienke@uni-koblenz.de>
Content-Transfer-Encoding: 7bit
Message-Id: <1080238182.5985.3.camel@grandmother.littlebald.com>
Mime-Version: 1.0
Date: 25 Mar 2004 13:09:42 -0500
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: linux-lvm@sistina.com

On Thu, 2004-03-25 at 09:34, Rainer Krienke wrote:
> Hello,
> 
> I have a problem with 3 server machines
> I am running 3 NFS and SMB servers which run perfectly stable but
> show a strange behaviour when rebooting the machines: The
> filesystems which contain user directories cannot be umounted

> fuser -v shows only  this:
> /export/user1        root     kernel mount  /export/user1

Rainer,
nfsd will do this.  Make sure all of your NFS servers are stopped before
you try to umount your filesystems.

Does that help?
-David
-- 
David Johnston <david@littlebald.com>
Little Bald Consulting, LLC
