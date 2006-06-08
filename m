Received: from o.ww.redhat.com (vpn-4-13.stuttgart.redhat.com [10.32.4.13])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k589gm9C028139
	for <linux-lvm@redhat.com>; Thu, 8 Jun 2006 05:42:49 -0400
Received: from o.ww.redhat.com (localhost.localdomain [127.0.0.1])
	by o.ww.redhat.com (8.13.6/8.13.6) with ESMTP id k589gkeE021536
	for <linux-lvm@redhat.com>; Thu, 8 Jun 2006 11:42:47 +0200
Received: (from mauelsha@localhost)
	by o.ww.redhat.com (8.13.6/8.13.6/Submit) id k589gk6h021535
	for linux-lvm@redhat.com; Thu, 8 Jun 2006 11:42:46 +0200
Date: Thu, 8 Jun 2006 11:42:46 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Right way to resize LVM Volume on SAN?
Message-ID: <20060608094246.GA2775@redhat.com>
References: <4487E578.2060202@alienworld.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4487E578.2060202@alienworld.org>
Reply-To: mauelshagen@redhat.com,
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Jun 08, 2006 at 10:53:12AM +0200, Alen Salamun wrote:
> Hello All!
> 
> I have read all the archives, HOWTO etc. but I don't seem to find the 
> definitive guide to do it correctly.
> 
> My diskspace in Linux is on SAN. The last partition (/dev/sda3) is LVM, 
> ext3 and it represents my /home. Now I expanded the SAN volume and I 
> would like to add this additional space to this last LVM partition.
> 
> I already see larger disk space with fdisk. AFAIK I have now two 
> options. Either I create new partition (for example /dev/sda4) and 
> pvcreate it and add it to Logical Volume or I can resize existing 
> /dev/sda3 since it is the last partition and I can resize it to new end 
> sector.
> 
> I would prefer resizing existing partition. So I should make backup, 
> delete existing partition /dev/sda3. make new partition with new end 
> sector and same start sector and do pvresize, lvresize on it right?
> 
> Is there any other way to do it? It is after all quite something to 
> delete existing live partiton and hope it still work after resize :)

man pvresize

> 
> Thank you!
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Storage Development                               56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            PHONE +49  171 7803392
                                                  FAX   +49 2626 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
