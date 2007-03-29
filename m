Received: from o.ww.redhat.com (vpn-4-17.str.redhat.com [10.32.4.17])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2TCdUi5021753
	for <linux-lvm@redhat.com>; Thu, 29 Mar 2007 08:39:30 -0400
Received: from o.ww.redhat.com (localhost.localdomain [127.0.0.1])
	by o.ww.redhat.com (8.13.8/8.13.8) with ESMTP id l2TCdT7i028526
	for <linux-lvm@redhat.com>; Thu, 29 Mar 2007 14:39:29 +0200
Received: (from mauelsha@localhost)
	by o.ww.redhat.com (8.13.8/8.13.8/Submit) id l2TCdTMW028525
	for linux-lvm@redhat.com; Thu, 29 Mar 2007 14:39:29 +0200
Date: Thu, 29 Mar 2007 14:39:29 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] How to re-stripe a LV after pvmove?
Message-ID: <20070329123929.GA7718@redhat.com>
References: <460BA637.9050604@carmen.se>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <460BA637.9050604@carmen.se>
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

On Thu, Mar 29, 2007 at 01:42:47PM +0200, Olle Liljenzin wrote:
> Hello,
> 
> How can I rearrange a striped volume after pvmove has been run, so that 
> I get back the original structure with the stripes equally distributed 
> on PVs?

I need to presume, that IO to the striped LV was going on during pvmove.
Hence restoring the old mapping won't help and will lead to data corruption.

pvmove back using the destination options of the command.

> 
> /Olle
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
