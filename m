Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j07FtRr01126
	for <linux-lvm@redhat.com>; Fri, 7 Jan 2005 10:55:27 -0500
Received: from smtp.restena.lu (legolas.restena.lu [158.64.1.34])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j07FtOoS004121
	for <linux-lvm@redhat.com>; Fri, 7 Jan 2005 10:55:25 -0500
Received: from smtp.restena.lu (localhost [127.0.0.1])
	by smtp.restena.lu (8.12.11/8.12.11) with ESMTP id j07FtL7J023191
	for <linux-lvm@redhat.com>; Fri, 7 Jan 2005 16:55:21 +0100
Received: from frodo.restena.lu (frodo.restena.lu [158.64.1.196])
	by smtp.restena.lu (8.13.1/8.13.1) with ESMTP id j07FtL48023186
	for <linux-lvm@redhat.com>; Fri, 7 Jan 2005 16:55:21 +0100
In-Reply-To: <87f94c37050106094874d055a5@mail.gmail.com>
Subject: Re: [linux-lvm] hardware snapshots: uuid issue
MIME-Version: 1.0
Message-ID: <OFB2E117AF.E8B37828-ONC1256F82.00573650-C1256F82.0057761F@restena.lu>
From: gilles.massen@restena.lu
Date: Fri, 7 Jan 2005 16:55:17 +0100
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

Hi,

Unfortunately I do not get to the filesystem level. There is XFS on them 
all right, but it's LVM2 that is not handling the uuid change as 
expected...so there is no LV to mount.

Gilles

--
RESTENA - DNS-LU
6, rue Coudenhove-Kalergi
L-1359 Luxembourg
tel: (+352) 424409
fax: (+352) 422473



I use XFS when I am going to use snapshots.

It has a mount option to ignore the UUID conflict.


On Thu, 6 Jan 2005 17:14:34 +0100, gilles.massen@restena.lu
<gilles.massen@restena.lu> wrote:
> Hello everyone,
> 
> Some time ago I had a problem accessing a hardware snapshot of an LVM2
> partition. The reason: different physical volumes having the same UUIDs.
> The advice I was given was to use the "pvchange --uuid" command, but I'm
> unable to use that command whitout making the PV unusable.
> 
> What happens is this: the PV is there, it is found, but  becomes an
> "unknown" device. pvdisplay and pvdisplay <device> disagree somewhat,
> andit seems as if the old uuid is sticking around. vgscan or pvscan are 
of
> no use.
> 
> Now I have no idea what else to try... BTW, I also failed having two
> instances of LVM by setting LVM_SYSTEM_DIR: the second instance still
> finds the PVs of the first even...even with the appropriate filters.
> 
> Any ideas how to continue here? For the time beeing the hardware 
snapshots
> are not very useful...
 
