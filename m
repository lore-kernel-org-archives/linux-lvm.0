Received: from o.ww.redhat.com (vpnuser1.stuttgart.redhat.com [172.16.4.1])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id i1KFQba5018521
	for <linux-lvm@redhat.com>; Fri, 20 Feb 2004 16:26:37 +0100
From: Heinz Mauelshagen <Mauelshagen@redhat.com>
Subject: Re: [linux-lvm] finding the right size for rootvg
Message-ID: <20040220152636.GC25086@redhat.com>
References: <20040220151231.92039.qmail@web80002.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040220151231.92039.qmail@web80002.mail.yahoo.com>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 20 10:25:13 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Fri, Feb 20, 2004 at 07:12:31AM -0800, cmc2slack-lvm@yahoo.com wrote:
> I'm re-installing slackware 9.1 on my linux box,
> trying to set up LVM and ReiserFs. I'm pretty new
> at this, learning as I go along.
> 
> I originally installed to another partition, now
> I've creating a fresh partition and following the
> LVM how-to about how to set up a root volume group. 
> My questions are about partition and volume group size.
> 
> The first time I created a partition and PV I made
> it 5GB and found that I had created the rootvg too
> small by default to allocate enough space. So reading the
> man pages I figured out that I need to specify a
> certain extent size when I create the rootvg in order
> to use the space properly. Right now the partition is
> a little over 4GB and the rootvg is 3.97GB with an
> extent size of 8MB. Is this small extent size a good
> idea or will it cause problems later?

It'll 'limit' you to a maximum LV size of 512GB if that is an issue in LVM1.
Once you migrate to LVM2 there's no such constraint any more.

> 
> Thanks for any advice,
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
