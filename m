Received: from fentible.pjc.net (vpnuser5.surrey.redhat.com [172.16.9.5])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j35FZnpH018255
	for <linux-lvm@redhat.com>; Tue, 5 Apr 2005 16:35:49 +0100
Received: from patrick by fentible.pjc.net with local (Exim 4.50)
	id 1DIq5l-0001eo-66
	for linux-lvm@redhat.com; Tue, 05 Apr 2005 16:35:49 +0100
Date: Tue, 5 Apr 2005 16:35:49 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
Subject: Re: [linux-lvm] Problems compiling LVM2.2.01.09
Message-ID: <20050405153549.GA5839@tykepenguin.com>
References: <200504051055.18460.hibbard@ohio.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200504051055.18460.hibbard@ohio.edu>
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

On Tue, Apr 05, 2005 at 09:55:15AM -0500, Tim Hibbard wrote:
> I am trying to compile LVM2.2.01.09 and I am having problems.  I have patched 
> kernel-2.4.30 with device-mapper.1.00.21 support.  I now have the kernel 
> booted with device manager support.
> 
> When I type 'make install' on LVM2 I get the following errors:
> 

You need the latest libdevmapper 1.01.x


-- 

patrick
