From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] performance tests
Message-ID: <20030425113824.D16006@sistina.com>
References: <3EA6C508.9020702@roma2.infn.it>
Mime-Version: 1.0
In-Reply-To: <3EA6C508.9020702@roma2.infn.it>; from roberto.ammendola@roma2.infn.it on Wed, Apr 23, 2003 at 06:53:28PM +0200
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Apr 25 04:44:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Roberto,

creating a striped logical volume with the stripe size equal to the block
size of the filesystem should give you the best performamce presuming that
you don't have some bus bottleneck.


On Wed, Apr 23, 2003 at 06:53:28PM +0200, Roberto Ammendola wrote:
> Hi list,
> I would like to hear some opinions about a configuration: I have a dual 
> Xeon with 2 RAID5 HW controllers, so that from the OS side I have two 
> SCSI disks. I am trying different configurations to see which one has 
> the best performances. The machine will be a file server for a bunch of 
> people.
> The question is: would you use LVM over a SW-RAID0 between the two SCSI 
> disks? Is native LVM striping that better (in terms of performance I mean)?
> Let me know, I'll run bonnie++ meanwhile, but I don't know if it 
> highlights the differences: I should simulate a multiuser stress of the 
> disks. Any advice?
> 
> ciao rob
> 
> -- 
> ______________________________________________________________________
> 
>       Roberto Ammendola    INFN - Roma II - APE group
>  tel: +39-0672594504  email: roberto.ammendola@roma2.infn.it   // \
>       ICQ: 152497874    MSN: ammendola_ro@hotmail.com          \\_/ //
> __________________________________________   ''-.._.-''-.._.. -(||)(')
>                                                                '''
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
