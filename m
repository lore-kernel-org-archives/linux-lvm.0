Received: from o.ww.redhat.com (vpn50-9.rdu.redhat.com [172.16.50.9])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	i3QMSgNv016416
	for <linux-lvm@redhat.com>; Tue, 27 Apr 2004 00:28:43 +0200
Date: Tue, 27 Apr 2004 00:28:42 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] About storing Lvm configuration
Message-ID: <20040426222842.GA16292@redhat.com>
References: <200404262057.i3QKvvTk000342@smtp.doruk.net.tr>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200404262057.i3QKvvTk000342@smtp.doruk.net.tr>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Apr 26, 2004 at 11:54:33PM +0300, Vahric MUHTARYAN wrote:
> Hi , 
> 
> I red the documents but still I don't know where is lvm configuration stored
> ?! ( Maybe I past :(  )   

At the beginnng of each PV (see lvm.h for details).

> Can I move lvm configured disk from one computer to another computer ?! 

Yes, you need to move all disks of a VG to the other computer.

> 
> Thanks
> Vahric 
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
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
