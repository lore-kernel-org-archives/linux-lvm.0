Received: from o.ww.redhat.com (vpnuser2.stuttgart.redhat.com [172.16.4.2])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id i21DKmoH014478
	for <linux-lvm@redhat.com>; Mon, 1 Mar 2004 14:20:48 +0100
From: Heinz Mauelshagen <Mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Snapshot validity
Message-ID: <20040301132047.GA25377@redhat.com>
References: <LAW11-OE28DKBKhwWn500022e47@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <LAW11-OE28DKBKhwWn500022e47@hotmail.com>
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
Date: Mon Mar  1 08:19:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Sachin,

you can resize original logical volumes and their snapshots
and they stay valid.

Regards,
Heinz    -- The LVM Guy --


On Mon, Mar 01, 2004 at 10:02:17AM -0800, sachin wrote:
> 
> > Hi All
> >
> > I have a question.
> 
> LVM1 or LVM2 ?
> 
> - Joe
> 
> Hi All
> 
> I am using lvm1
> 
> -SachiN_
> 
> _==__==__==__==__==__==__==_
> 
> Original messagel was
> 
> 
> Hi All
> 
> I have a question.
> What happen if i have change the configuration of the snapshot origin volume
> i.e i may change the size of the volume .Is the snapshot is valid or its of
> no use
> 
> What i think is data is of no use ,because internally the driver may
> checking the
> extent mapping of the origin of the  snapshot and then it scanning the
> ioexception table
> i.e COW table .If my assumption is not correct ,If any one knows the actual
> working
> Please tell  me .
> 
> Thanks
> SachiN_
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
