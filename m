From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] URGENT!!!!!!problem with behaviour of lvm on Suse
Message-ID: <20031007153935.C25676@sistina.com>
References: <NLENIGODLDIENAHGOFMJKECMCAAA.sandhya.suman@patni.com>
Mime-Version: 1.0
In-Reply-To: <NLENIGODLDIENAHGOFMJKECMCAAA.sandhya.suman@patni.com>; from sandhya.suman@patni.com on Fri, Oct 03, 2003 at 10:50:54AM +0530
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
Date: Tue Oct  7 09:50:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Sorry, there's no support in LVM1 for such devices,
Please use device-mapper/LVM2 which supports setting up device name filters
to solve your problem.

Regards,
Heinz    -- The LVM Guy --


On Fri, Oct 03, 2003 at 10:50:54AM +0530, Sandhya Suman wrote:
> Hi,
> We are facing some problem related to lvm on SuseLinux
> 8(Kernel -2.4.19-4GB).
> We are trying to port HDLM driver on suse.HDLM driver create psudo driver on
> top of scsi driver it uses scsi disk to read and write data.
> suppose i have a hdlm device /dev/sddlmaa which is configured for 4 scsi
> devices i.e can access the storage device through 4 scsi disk.
> 
> Following output shows the link between the scsi and HDLM device.
> 
> linux:/opt/DynamicLinkManager/bin # ./dlnkmgr view -drv | grep sddlmaa
> 000000 sddlmaa          /dev/sda
> 000008 sddlmaa          /dev/sdi
> 000009 sddlmaa          /dev/sdq
> 000010 sddlmaa          /dev/sdy
> 
> Now here is the sequence of commands and there outputs to create a volume
> group........
> 
> linux:/opt/DynamicLinkManager/bin # pvcreate /dev/sddlmaa1 /dev/sddlmaa2
> pvcreate -- physical volume "/dev/sddlmaa1" successfully created
> pvcreate -- physical volume "/dev/sddlmaa2" successfully created
> 
> linux:/opt/DynamicLinkManager/bin # pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/sdq1" is in no VG  [30.98 MB]
> pvscan -- inactive PV "/dev/sdq2" is in no VG  [69 MB]
> pvscan -- inactive PV "/dev/sdt"  is in no VG  [100 MB]
> pvscan -- total: 3 [199.98 MB] / in use: 0 [0] / in no VG: 3 [199.98 MB]
> 
> Here even if i am creating a PV using HDLM device i.e /dev/sddlmaa1 PVSCAN
> shows the corresponding scsi device which it picks from the
> /proc/partition.(what i feel is that it picks thescsi disk with highest
> major number as scsi are displayed in descending order by their major
> numbers in /proc/partition).
> 
> linux:/opt/DynamicLinkManager/bin # vgcreate myvg1 /dev/sddlmaa1
> /dev/sddlmaa2
> vgcreate -- INFO: using default physical extent size 4 MB
> vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
> vgcreate -- doing automatic backup of volume group "myvg1"
> vgcreate -- volume group "myvg1" successfully created and activated
> 
> linux:/opt/DynamicLinkManager/bin # pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ACTIVE   PV "/dev/sdq1" of VG "myvg1" [24 MB / 24 MB free]
> pvscan -- ACTIVE   PV "/dev/sdq2" of VG "myvg1" [64 MB / 64 MB free]
> pvscan -- inactive PV "/dev/sdt"  is in no VG  [100 MB]
> 
> Here again i am trying to create the VG using the same HDLM device i.e
> /dev/sddlmaa1 and 2 but again PVSCAN displays the entry for SCSI device.
> I had already installed and worked with LVM on RHLinux 7.2 and AS2.1.
> There it was working fine The PVSCAN use to show 8 entries for PV create
> with 2 partitions of HDLM device.like in the above case.
> These 10 entries are comprises of
> 2 entries for sddlma
> 2 entries for sda
> 2 entries for sdi
> 2 entries for sdq
> 2 entries for sdy
> 
> But in Suse its entirely different. I was trying to track the difference by
> looking pvscan -d (debug option).i was also trying to look the code.
> What i found that in PVSCAN when it read entries from /proc/partitions one
> by one. it compares the UUID and at whenever it finds a match it initializes
> some default path and and increment the default path.
> In our case i.e  whenever it find hdlm device for which pv is created it
> changes the name of the device wuith corresponding scsi device whose UUID is
> same...(am i right..)
> and from this point it stop recognizing our HDLM device and recognize only
> one scsi corresponding to the HDLM device.
> and this is the problem.
> Can you suggest some solution or some patches which we can apply and get the
> behaviour as it shows on RHLinux 7.2.
> We have to support load balancing using different paths while using lvm side
> by side........
> we need ur help very urgetly.............
> 
> Thank You,
> Sandhya Suman
> SE,Patni Computer System
> Mumbai,INDIA
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
