Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3AGYIIt015969
	for <linux-lvm@redhat.com>; Mon, 10 Apr 2006 12:34:18 -0400
Received: from orca.ele.uri.edu (orca.ele.uri.edu [131.128.51.63])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k3AGYB67016726
	for <linux-lvm@redhat.com>; Mon, 10 Apr 2006 12:34:11 -0400
Subject: Re: [linux-lvm] LVM over IP network
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <00a001c65b62$e7e624a0$64c8a8c0@balefirehome>
References: <1144412972.44365b2c36361@mail.sify.com>
	<00a001c65b62$e7e624a0$64c8a8c0@balefirehome>
Date: Mon, 10 Apr 2006 12:33:57 -0400
Message-Id: <1144686838.8591.100.camel@localhost.localdomain>
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

On Sun, 2006-04-09 at 01:19 +0200, Sander Steffann wrote:
> Hi,
>         I have 10 Dell workstation on a LAN. Each  workstation has 80
>         GB hard drive. Two workstations consumed most of the disk
>         space and
>         remaining eight workstations still has plenty of disk space
>         unused.
>         
>         ...
>          
>         What I want basically, if I could just collect those 800 GB
>         excess space (not utilized) and assign it to the work stations
>         starving
>         for disk space. Is this achievable through LVM or EVMS?
> I would never do something like this. You make each workstation
> dependent on all the other workstations. If one of them is turned off,
> crashes, dies, etc. your other workstations lose their data. Disks are
> cheap these days. Just buy an extra drive for the workstations that
> need it.
>  
> Good luck,
> Sander

or put all these disks in one box and let other boxes boot from iscsi
and use centralized ip storage.


>  
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
