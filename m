Received: from o.ww.redhat.com (vpn50-3.rdu.redhat.com [172.16.50.3])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	j9LFJMJE018089
	for <linux-lvm@redhat.com>; Fri, 21 Oct 2005 17:19:23 +0200
Date: Fri, 21 Oct 2005 17:19:21 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Correct way to add disc to LVM
Message-ID: <20051021151921.GC3517@redhat.com>
References: <80d985600510210514h29edd384n65d4d14dc0492399@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <80d985600510210514h29edd384n65d4d14dc0492399@mail.gmail.com>
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

On Fri, Oct 21, 2005 at 09:14:44PM +0900, Craig Hagerman wrote:
> Hi all,
> 
> I want to make sure I understand the correct way to add more disc
> space under LVM. If you have LVM set up on one single HD, and then
> want to extend that to cover a second HD what is the correct way to
> proceed?
> 
> >From reading the HOWTO I think this is how it is done. Am I missing
> anything essential here?

Run pvcreate on your new drive before vgextend.

> 
> ---------------------------------------------------------------------
> Add physical volumes to a volume group:
> ---------------------------------------------------------------------
> Use 'vgextend' to add an initialized physical volume to an existing
> volume group.
> # vgextend my_volume_group /dev/hdc1
>                                     ^^^^^^^^^ new physical volume
> 
> ---------------------------------------------------------------------
> Extend logical volume:
> ---------------------------------------------------------------------
> 
> # lvextend -L12G /dev/myvg/homevol
> 
>          will extend /dev/myvg/homevol to 12 Gigabytes.
> 
> -----------------------------------------------------------------------------------------------------------
> Increase size of file system to match the logical volume (assuming ext2 / 3):
> -----------------------------------------------------------------------------------------------------------
>    # umount /dev/myvg/homevol/dev/myvg/homevol
>    # resize2fs /dev/myvg/homevol
>    # mount /dev/myvg/homevol /home
> 
> 
> Is this correct? Is this all you have to do?
> 
> Craig
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
Cluster and Storage Development                   56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
