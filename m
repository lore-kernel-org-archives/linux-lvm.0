From: adimaths@softhome.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <courier.3F9CF496.00006524@softhome.net>
Subject: [linux-lvm] RE:problem of lvm on suse
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
Date: Mon Oct 27 04:35:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Mauelshagen@sistina.com
Cc: linux-lvm@sistina.com, adimaths@softhome.net

Hi, 

I have tried both the sorting order of our devices,
in /proc/paritions.
It still does not work. 

When I did pvscan with debug option , it gave the
following: This is with our devices on top of /proc/partitions. 

<1> pv_read_all_pv -- calling stat with "/dev/pseudo_device1"
<22> pv_read -- CALLED with /dev/pseudo_device1
<333> pv_check_name -- CALLED with "/dev/pseudo_device1"
<4444> lvm_check_chars -- CALLED with name: "/dev/pseudo_device1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/pseudo_device1
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 1
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED 

<333> pv_copy_from_disk -- LEAVING ret = 0x8054508 

<333> pv_create_name_from_kdev_t -- CALLED with 253:129 

<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 147
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: 
/dev/pseudo_device1
<333> system_id_check_exported -- CALLED
<333> system_id_check_exported -- LEAVING with ret: 0
<22> pv_read -- LEAVING with ret: 0
<22> pv_get_size -- CALLED with /dev/pseudo_device1 and 0xbffff570
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 147
<333> lvm_dir_cache_find -- CALLED with /dev/pseudo_device1
<4444> pv_check_name -- CALLED with "/dev/pseudo_device1"
<55555> lvm_check_chars -- CALLED with name: "/dev/pseudo_device1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> pv_check_name -- LEAVING with ret: 0
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 147 

<333> lvm_dir_cache_find -- LEAVING with entry: 21 

<333> lvm_check_partitioned_dev -- CALLED
<4444> lvm_get_device_type called
<4444> lvm_get_device_type leaving with 1
<333> lvm_check_partitioned_dev -- LEAVING with ret: TRUE 

<333> lvm_partition_count -- CALLED for 0xfd81 

<4444> lvm_get_device_type called
<4444> lvm_get_device_type leaving with 1
<333> lvm_partition_count -- LEAVING with ret: 16
<22> pv_get_size -- BEFORE llseek 0:0
<22> pv_get_size -- part[0].sys_ind: 8E  part[0].nr_sects: 79950
<22> pv_get_size -- first == 1
<22> pv_get_size -- part_i == part_i_tmp
<22> pv_get_size -- LEAVING with ret: 79950 

<22> pv_check_and_add_paths -- CALLED with pv_list=(nil) and 
pv_new=0x8054508 

<22> pv_check_and_add_paths -- LEAVING with rc=0
<22> pv_check_volume -- CALLED  dev_name: "/dev/pseudo_device1"  pv: 8054508
<333> pv_check_name -- CALLED with "/dev/pseudo_device1"
<4444> lvm_check_chars -- CALLED with name: "/dev/pseudo_device1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_check_new -- CALLED
<333> pv_check_new -- LEAVING with ret: 0
<333> vg_check_name -- CALLED with VG: vg
<4444> lvm_check_chars -- CALLED with name: "vg"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> pv_check_volume -- LEAVING with ret: 1
<1> pv_read_all_pv: allocating for /dev/pseudo_device1 vg 

 


now when the 1st scsi device corresponding the above pseudo device
(ie its path) was scanned the foll was the output: 

<1> pv_read_all_pv -- calling stat with "/dev/sds1"
<22> pv_read -- CALLED with /dev/sds1
<333> pv_check_name -- CALLED with "/dev/sds1"
<4444> lvm_check_chars -- CALLED with name: "/dev/sds1"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> pv_check_name -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/sds1
<333> lvm_check_dev -- CALLED
<4444> lvm_check_partitioned_dev -- CALLED
<55555> lvm_get_device_type called
<55555> lvm_get_device_type leaving with 1
<4444> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED 

<333> pv_copy_from_disk -- LEAVING ret = 0x805bda0 

<333> pv_create_name_from_kdev_t -- CALLED with 65:33 

<4444> lvm_check_dev -- CALLED
<55555> lvm_check_partitioned_dev -- CALLED
<666666> lvm_get_device_type called
<666666> lvm_get_device_type leaving with 1
<55555> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 147
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sds1
<333> system_id_check_exported -- CALLED
<333> system_id_check_exported -- LEAVING with ret: 0
<22> pv_read -- LEAVING with ret: 0
<22> pv_get_size -- CALLED with /dev/sds1 and 0xbffff570
<333> lvm_dir_cache -- CALLED
<333> lvm_dir_cache -- LEAVING with ret: 147
<333> lvm_dir_cache_find -- CALLED with /dev/sds1
<4444> pv_check_name -- CALLED with "/dev/sds1"
<55555> lvm_check_chars -- CALLED with name: "/dev/sds1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> pv_check_name -- LEAVING with ret: 0
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 147 

<333> lvm_dir_cache_find -- LEAVING with entry: 59 

<333> lvm_check_partitioned_dev -- CALLED
<4444> lvm_get_device_type called
<4444> lvm_get_device_type leaving with 1
<333> lvm_check_partitioned_dev -- LEAVING with ret: TRUE 

<333> lvm_partition_count -- CALLED for 0x4121 

<4444> lvm_get_device_type called
<4444> lvm_get_device_type leaving with 1
<333> lvm_partition_count -- LEAVING with ret: 16
<22> pv_get_size -- BEFORE llseek 0:0
<22> pv_get_size -- part[0].sys_ind: 8E  part[0].nr_sects: 79950
<22> pv_get_size -- first == 1
<22> pv_get_size -- part_i == part_i_tmp
<22> pv_get_size -- LEAVING with ret: 79950 

<22> pv_check_and_add_paths -- CALLED with pv_list=0x8054a60 and 
pv_new=0x805bda
0 

<22> pv_check_and_add_paths -- identical UUIDs for device 253:129 and 65:33
<22> pv_check_and_add_paths -- initializing default path
<22> pv_check_and_add_paths -- adding path at position 0
<22> pv_check_and_add_paths -- path count is 2
<22> pv_check_and_add_paths -- LEAVING with rc=1 


Regards
Aditya 

 

 

 

 


 ----- Original Message -----
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
To: <adimaths@softhome.net>
Cc: <mailto:Mauelshagen@sistina.com;; <linux-lvm@sistina.com>
Sent: Friday, October 24, 2003 4:01 PM
Subject: [linux-lvm] Re: Problem of LVM on Suse 


> On Thu, Oct 23, 2003 at 06:50:29PM -0600, adimaths@softhome.net wrote:
> > Hi,
> >
> > I am facing a problem in using LVM bundled with Suse Enterprise server 8
> > ,connected to storage area newtork
> > System configuration:
> > A storage area network is connected to a server with OS Suse Enterprise
> > server 8.
> > So there are multiple scsi devices whose physical disk is identical.
> >
> > We are creating a Pseudo device file asscociated with identical scsi
devices
> > using a driver that we have created.
> > eg : /dev/pseudo-device -> /dev/sda , /dev/sdb
> >
> > Now using the bundled LVM on such pseudo device is a problem.
> > problem details:
> > pvcreate /dev/pseudo-device
> > [result] ok.
> >
> > pvscan
> > [result] it shows the scsi device associated with this pseudo device ie
> > /dev/sda and not our pseudo device.
> >
> > If LVM bypasses our pseudo device then the purpose of creating this
device
> > and associating it with scsi is futile.
> >
> > The irony is, LVM works fine on RH 2.1 kernel = 2.4.9-e.3 and also with
RH
> > 7.2
> > However the above mention problem is observed on Suse Enterprise server
8
> > ,RH 2.1 kernel =2.4.9-e.25, RH 7.3 and RH 8.0.
> >
> > Would request you to clarify the following :
> > 1>Could you please tell me how this problem can be rectified ? 
>
> Change the sort-order (as you suggested below) 
>
> >
> > 2>Is it that Lvm that is bundled with the OS can't be used for
> > the above mentioned purpose ?
> >
> > 3>If it can't be , then what design feature
> > of the current LVM prevents it from supporting the above task?
> >
> > 4> Can any change in our product help us to solve this problem?
> >
> > 5>Moreover I think LVM on RedHat is working just by chance.
> > I think pvscan depends on the order of the devices in the
> > /proc/partitions , and hence when our pseudo devices are
> > at the end of the /proc/paritions , pvscan shows our devices
> > as active else it shows scsi as active.
> >
> > Is my inference correct? 
>
> Yes. 
>
> LVM2 is much more suitable to cover such vendor-specific configurations,
> because it has configurable device name filters. LVM1 needs code changes
> to support additional device name spaces. 
>
> >
> > Regards
> > Aditya Vasudevan 
>
> -- 
>
> Regards,
> Heinz    -- The LVM Guy -- 
>
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them *** 
>
>
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-
>
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446 
>
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
