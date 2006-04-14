Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3EKpebO005441
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2006 16:51:40 -0400
Received: from mail.nederland.net (mail.nederland.net [83.137.20.15])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3EKpcK9004578
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2006 16:51:39 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by romeo.computel.nl (Postfix) with ESMTP id E4BB514039
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2006 22:51:37 +0200 (CEST)
Received: from mail.nederland.net ([127.0.0.1])
	by localhost (romeo.computel.nl [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 08181-01 for <linux-lvm@redhat.com>;
	Fri, 14 Apr 2006 22:51:36 +0200 (CEST)
Received: from balefirehome (balefire.demon.nl [212.238.240.59])
	by romeo.computel.nl (Postfix) with ESMTP id B048914004
	for <linux-lvm@redhat.com>; Fri, 14 Apr 2006 22:51:35 +0200 (CEST)
Message-ID: <000801c66005$979d28c0$64c8a8c0@balefirehome>
From: "Sander Steffann" <s.steffann@computel.nl>
References: <Pine.LNX.4.62.0604131143270.21727@gate.nmr.mgh.harvard.edu>
Subject: Re: [linux-lvm] LVM2, NFS and random device (major:minor) numbers
Date: Fri, 14 Apr 2006 22:54:14 +0200
MIME-Version: 1.0
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Paul,

> NFS depends on what the server says the underlying device id is of the 
> exported volume and if that changes, then NFS mounts are going to change 
> out from under themselves.  And everytime I add a volume and reboot the 
> device ids change.

Unfortunate, but true. One of the side-effects of having dynamic volumes. 
Also note that you would get similar trouble if, for example, you added a 
SCSI device with a lower SCSI-id than an existing SCSI device. /dev/sdb1 
would become /dev/sdc1, etc.

> I finally come upon this old post to this list:
> http://www.redhat.com/archives/linux-lvm/2005-May/msg00029.html

The part that can solve everything for you is:
>> These days, that's configurable.
>> See 'man exports' fsid=num.

With an explicit fsid=n for every export, you tell the NFS server to ignore 
the device-id, and use the specified fsid instead. That way you get 
consistent NFS exports, without being dependent on the underlying 
device-ids.

I have had the same trouble as you have, and this solution works great.
Sander.
