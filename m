Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1NCiwMO024918
	for <linux-lvm@redhat.com>; Fri, 23 Feb 2007 07:44:58 -0500
Received: from homer.panici.net (homer.panici.net [207.234.145.200])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1NCiuC3023593
	for <linux-lvm@redhat.com>; Fri, 23 Feb 2007 07:44:56 -0500
Received: from homer.panici.net (localhost.localdomain [127.0.0.1])
	by homer.panici.net (8.13.4/8.13.4/Debian-3sarge3) with ESMTP id
	l1NCiqDl023064
	for <linux-lvm@redhat.com>; Fri, 23 Feb 2007 12:44:52 GMT
Received: (from paddy@localhost)
	by homer.panici.net (8.13.4/8.13.4/Submit) id l1NCiqUN023063
	for linux-lvm@redhat.com; Fri, 23 Feb 2007 12:44:52 GMT
Date: Fri, 23 Feb 2007 12:44:52 +0000
From: paddy@panici.net
Subject: Re: [linux-lvm] moving logical volumes to another system *remotely* -
	how?
Message-ID: <20070223124452.GB22388@homer.panici.net>
References: <45DED477.8040809@wpkg.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45DED477.8040809@wpkg.org>
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
To: linux-lvm@redhat.com

On Fri, Feb 23, 2007 at 12:48:07PM +0100, Tomasz Chmielewski wrote:
> I have a server which stores several LVM-2 logical volumes.
> 
> As this system is pretty loaded, I'd like to move some of the logical
> volumes to another machine. It has to be done remotely, so I can't do it
> as described in the LVM HOWTO (where one basically adds/replaces disks 
> in one machine).
> 
> My common sense tells me that I should:
> 
> 1. Unmount/not use the logical volumes on the source server
> 2. Make volumes of the same size on the target server
> 3. Copy it somehow over network
> 
> 
> I'm not sure of 2 (make volumes of exactly the same size) 

check your PE size, otherwise does what it says on the tin.

> and 3 (how to 
> copy it all over network, if possible, using SSH only).

netcat and dd over forwarded port

Regards,
Paddy
