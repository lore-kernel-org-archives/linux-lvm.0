From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: LVM over linux on root disk support!
Message-ID: <20020628184926.A25482@sistina.com>
References: <12BB8DBFEF43BF49AC351D6C266E9031B1E5ED@xpa04.mayfield.hp.com>
Mime-Version: 1.0
In-Reply-To: <12BB8DBFEF43BF49AC351D6C266E9031B1E5ED@xpa04.mayfield.hp.com>; from jeffrey_fisher@hp.com on Fri, Jun 28, 2002 at 09:22:57AM -0700
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
Date: Fri Jun 28 11:57:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Jeff,

Linux LVM will support mirroring in is LVM2 code base later this year.

If you want mirroring now, you need to combine MD and LVM by setting up mirrored
MD devices (or RAID 5 if you like) and using them as LVM Physical Volumes.

Have a look at the raidtools starting with raidstart(8).

On Fri, Jun 28, 2002 at 09:22:57AM -0700, FISHER,JEFFREY (HP-USA,ex3) wrote:
> To whom it may concern;
>  
> Does LVM now support mirroring under Linux? If so, how many copies, what
> versions of the kernel, what distro
> of Linux (mainly RedHat) and where can I go to obtain more information?
>  
> Thanks in advance,
> 
>   _____  
> 
> 
>  <http://www.hp.com/>  
> 
> Jeff Fisher
> ASE
> Hewlett-Packard Company
> 
> 650 694-3367 Phone
> 831 626-2877 Fax
> 
> jeffrey_fisher@hp.com <mailto:jeffrey_fisher@hp.com>  	
> 
>   _____  
> 
>  



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
