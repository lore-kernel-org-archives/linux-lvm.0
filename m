Return-Path: <root@srv.sistina.com>
Date: Mon, 30 Apr 2001 16:07:32 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Removing a disk from the system
Message-ID: <20010430160732.I19810@sistina.com>
Mime-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Apr 28, 2001 at 10:41:25PM +0200, Torsten Landschoff wrote:
> Hi *,
> 
> Today I learned something about LVM the hard way. We are still using
> 0.8i with 2.2.19 over here since I had nothing but problems with 
> 0.8 and 0.9beta2 (or which beta it was). (The problems were already
> reported on this list so I chose to do nothing about it).
> 
> Now today I replaced a disk in the server being the only PV of the VG
> data. Simple thing: Install the next disk, add it to the VG and pvmove 
> the data over to it, then remove the old PV.
> 
> Then I took out the old disk and jumpered the new one as master. As
> expected I got an error message from LVM on reboot - I should run
> vgscan. 
> 
> I then ran vgscan to get the vg activated again but killed my other
> volume group!? I spent hours to get it working again but finally
> figured to jumper the new disk as slave again, vgexport the VG and
> import it again after setting it to master.
> 
> Seems like I should have used vgexport/import in the first time.

Actually not.
vgscan *should* have cut it.

It would be rather helpful, if you could provide the VGDA of the problematic
configuration and the vgscan output with option "-d" in order to investigate
searching for any bugs better.

In case you are able to reproduce the situation, where vgscan just finds
one but not both of the VGs, please send that data to me.

BTW: jou can provide the VGDA copy by:

   dd if=/dev/hdWhatever bs=1k count=4000 | bzip2 > vgda

> Anyway, 
> now I am wondering what will happen if we need to replace a disk
> since it starts to die or something along that line? pvmoving the 
> data is no problem, but what can I do if the disk fails before I can 
> do anything? 

The only way around such hardware flaws or failures is to set up
disk redundancy.
You can achive that using Linux MD, configure RAID1 or RAID5 sets
and use those as LVM PVs *or* you could go for hardware raid subsystems.

> 
> IOW: Is the problem I ran into a problem by design or is it a bug in 
> the 0.8i LVM?

See my above request.

> 
> cu
> 	Torsten
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

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
