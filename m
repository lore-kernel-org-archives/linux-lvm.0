Received: from o.ww.redhat.com (vpn50-22.rdu.redhat.com [172.16.50.22])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	i2NEndmX015570
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 15:49:40 +0100
Date: Tue, 23 Mar 2004 15:49:38 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Thread safeness of the liblvm-10
Message-ID: <20040323144938.GA29071@redhat.com>
References: <BAY16-DAV47hYSoOZzH000004bb@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BAY16-DAV47hYSoOZzH000004bb@hotmail.com>
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

On Tue, Mar 23, 2004 at 02:59:36PM -0800, sachin wrote:
> Hi,
> I am writting an application using the liblvm-10 library ,Can any one tell
> me wether the library
> is multithreadsafe or not.

It is not.

> I am not modifying the configuration i am use it
> for read only purpose
> I am using lvm1
> Thanks in advance
> Sachin.
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
