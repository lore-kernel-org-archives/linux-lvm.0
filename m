Received: from o.ww.redhat.com (vpnuser1.stuttgart.redhat.com [172.16.4.1])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id i1PEjra5006238
	for <linux-lvm@redhat.com>; Wed, 25 Feb 2004 15:45:53 +0100
From: Heinz Mauelshagen <Mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Reading Cow table
Message-ID: <20040225144553.GE11757@redhat.com>
References: <000d01c3f7d9$eb1f5950$2e5cd40a@sachin>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000d01c3f7d9$eb1f5950$2e5cd40a@sachin>
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
Date: Wed Feb 25 09:44:13 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Fri, Feb 20, 2004 at 09:49:40AM -0800, sachin wrote:
> Hi Everyone
> Can any one tell  me is it possible to read the cow table & find out the =
> exact location of the data on the disk or partition . If yes give me any =
> clue to read the COW table and other data.

Not supported directly.

If you're up for some investigation, look at the on-disk format definitions
for COW in lvm.h and check into the *COW*() lib functions.

> 
> I am using a lvm 1.0.3  . Copy of the cow table should be consistant with
> the data on disk
> 
> Thanks in advance.
> SachiN_
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
