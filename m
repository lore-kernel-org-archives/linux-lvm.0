From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Snapshot Problem JFS
Message-ID: <20030620165004.B29677@sistina.com>
References: <2E7F9C924F6A6546AF777BD072071EC6091244@mars.lbmc.net>
Mime-Version: 1.0
In-Reply-To: <2E7F9C924F6A6546AF777BD072071EC6091244@mars.lbmc.net>; from dsornig@lbmc.com on Fri, Jun 20, 2003 at 06:43:40AM -0500
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
Date: Fri Jun 20 10:04:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jun 20, 2003 at 06:43:40AM -0500, David Sornig wrote:
> Heinz,
>  
> So to make a snapshot of the 1.4T LV which currently has a 400G of space being used by data I need to run the lvcreate command like this:
>  
> lvcreate -L1000M -s -n snap00 /dev/Volume00/LogVol00

Yes, if you want to have a snapshot with a 1000MB exception store.

>  
> I guess I thought the -L needed to be the same size as the current logical volume? 

No, it doesn't need unless you have an update ratio of 100% to the original
during the lifetime of the snapshot. As a rule of thumb you can assume 5%
(which would be ~71g in your case) but that heavily depends on your
usage of the filesystem for obvious reasons.

You can use lvdisplay on the snapshot to retrieve how much space is in use
and if it becomes full, you can lvextend it.

Regards,
Heinz    -- The LVM Guy --


>  
> Thanks,
>  
> David
>  
> 
> 	-----Original Message----- 
> 	From: Heinz J . Mauelshagen [mailto:mauelshagen@sistina.com] 
> 	Sent: Fri 6/20/2003 4:09 AM 
> 	To: linux-lvm@sistina.com 
> 	Cc: 
> 	Subject: Re: [linux-lvm] Snapshot Problem JFS
> 	
> 	
> 
> 	On Thu, Jun 19, 2003 at 09:07:30PM -0500, David Sornig wrote:
> 	> I am running RedHat 9.0
> 	> Kernel 2.4.20-8
> 	> LVM Version 1.0.5+(22/07/2002)
> 	> 
> 	> I have a 1.4T LogVol with 400G of space being used on a JFS file system.
> 	> 
> 	> The LVM is working excellent.  However,  I cannot create a snapshot.  I run the following lvcreate command as per the man page and get the following error:
> 	> 
> 	> lvcreate --error "Cannot allocate memory"  creating VGDA for "/dev/Volume00/snap01" in kernel
> 	> 
> 	
> 	David,
> 	
> 	memory allocated to the snapshot needs free physical RAM.
> 	
> 	With 400GB and default snapshot extent size we're talking about ~1GB
> 	(using virtual memory for snapshot exception tables so that the table doesn't
> 	need to be in RAM completely any longer is a work item for LVM2).
> 	
> 	Do you really expect that much change to your 1.4TB LV during the lifetime of
> 	the snapshot ?
> 	If you use it for a backup, you might get along with a couple of GB allocated
> 	to the snapshot reducing exception table size drastically.
> 	
> 	
> 	> Not sure why this is happening.  I have read the list and maybe I just don't understand the problem.  These servers have 4 Gigs of RAM.
> 	> 
> 	> Regards,
> 	> 
> 	> David
> 	
> 	--
> 	
> 	Regards,
> 	Heinz    -- The LVM Guy --
> 	_______________________________________________
> 	linux-lvm mailing list
> 	linux-lvm@sistina.com
> 	http://lists.sistina.com/mailman/listinfo/linux-lvm
> 	read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 	


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
