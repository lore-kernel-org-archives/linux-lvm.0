Date: Sat, 11 Nov 2000 13:12:41 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] How to change physical extent size
Message-ID: <20001111131241.E32147@srv.t-online.de>
Reply-To: Mauelshagen@sistina.com
References: <3A0BEA91.EA8FF865@topo.ucl.ac.be>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
In-Reply-To: <3A0BEA91.EA8FF865@topo.ucl.ac.be>; from sibomana@topo.ucl.ac.be on Fri, Nov 10, 2000 at 01:31:13PM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: Merence Sibomana <sibomana@topo.ucl.ac.be>
Cc: linux-lvm@msede.com


Hi M�rence.

On Fri, Nov 10, 2000 at 01:31:13PM +0100, Merence Sibomana wrote:
> I'am new to this mail list and sorry if the question has already been
> answered.
> 
> In the FAQs, I find this :
> 	10. Why are my logical volumes limited to 256 GB in size? 
>  
> 	This is NO absolute limit but it depends on the physical extent size
> you configured at
> 	volume group creation time. 
> 	Please use option -s of the vgcreate command to give a larger physical
> extent size.
> 	For example with a physical extent size of 524288 KB (512 MB) you are
> able to map a logical
> 	volume of 32 Terabyte. Remember that current Linux kernels are limited
> to 1 Terabyte.
> 
> I have created a VG without -s. vgcreate doesn't accept an existing VG
> as argument. 
> How can I delete it and recreate with -s?


The following steps are necessary:

- remove all Logical Volumes of the Volume Group in question with lvremove(8).
- do a vgreduce(8) on that VG.
- "vgchage -an" on that VG
- vgremove that VG
- setup the VG with large PE size (vgcreate -s PE_SIZE)

A more "brutal" approach is:
- "vgchange -a n" on the VG
- "pvcreate -ff" on all its PVs
- setup the VG with large PE size (vgcreate -s PE_SIZE)


> ___
> M�rence Sibomana
> PET laboratory, UCL
> Phone : +32 10 473096

-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
