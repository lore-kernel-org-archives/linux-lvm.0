Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E2DF7C150
	for <linux-lvm@redhat.com>; Thu, 20 Jul 2017 08:56:55 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-ve1eur01on0122.outbound.protection.outlook.com [104.47.1.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A4C2FC058EB0
	for <linux-lvm@redhat.com>; Thu, 20 Jul 2017 08:56:51 +0000 (UTC)
From: "Shivarama Krishnan, Gururaj (Nokia - IN/Bangalore)"
	<gururaj.shivarama_krishnan@nokia.com>
Date: Thu, 20 Jul 2017 08:56:48 +0000
Message-ID: <1500541000.14160.3.camel@nokia.com>
References: <1500440226.7068.4.camel@nokia.com>
In-Reply-To: <1500440226.7068.4.camel@nokia.com>
Content-Language: en-US
Content-ID: <8F78224075476343BAFC32EDE42701C1@eurprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm]
 =?utf-8?q?lvmetad_crashes_with_=E2=80=9Cmemory_smash?=
 =?utf-8?q?=E2=80=9D_during_lvm_parallel_operations?=
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>
Cc: "S, Hemraj (Nokia - IN/Bangalore)" <hemraj.s@nokia.com>, "Saxena, Prateek
	2. (Nokia - IN/Bangalore)" <prateek.2.saxena@nokia.com>, "Rajaa, Mukuntha
	(Nokia - IN/Bangalore)" <mukuntha.rajaa@nokia.com>

Hi,

We went through the code on the this issue and able to point out that the  structure memblock in
unprotected from parallel threads.

void dm_bounds_check_debug(void)
{
        struct memblock *mb = _head;
        while (mb) {
                size_t i;
                char *ptr = ((char *) (mb + 1)) + mb->length;
                for (i = 0; i < sizeof(unsigned long); i++)
                        if (*ptr++ != (char) mb->id)
                                assert(!"Memory smash");

                mb = mb->next;
        }
}

So, if in case another thread try to access remove an entry and at the same time of query of the
list, the lvmetad will crash.  It is good have a lock introduced to memoryblock structure.

With Regards,
Gururaj S
"We share We Grow"


On Wed, 2017-07-19 at 10:27 +0530, Gururaj wrote:
> Hi ,
> 
> Greetings.
> 
> We are facing an issue with LVMETAD crashing during the parallel lvm operations
> (vgscan/pvscan/lvscan/lvs/vgs)
> 
> PKG_NAME=LVM2
> PKG_VERSION=2.02.168
> PKG_URL=LVM2.2.02.168.tgz
> PKG_MD5=00209bdd6befe9a7330f162909313ae8
> PKG_DATE=2016-12-01
> 
> This issue is also seen in LVM2-2.02.171.
> 
> The issue is reproduced on the MIPS Architecture HARDWARE with SCSI DISKS.
> 
> Disk information:
> Device: TOSHIBA  AL13SEB600       Version: 4701
> Serial number: 54R0A04HFYP6
> Device type: disk
> Transport protocol: SAS
> 
> Device driver :
> # modinfo mptsas
> filename:       /lib/modules/2.6.34.15
> g75d10fa/kernel/drivers/message/fusion/mptsas.ko
> version:        3.04.14
> license:        GPL
> description:    Fusion MPT SAS Host driver
> author:         LSI Corporation
> srcversion:     AF0ADD21F2C0510BB52D860
> alias:          pci:v00001000d00000062sv*sd*bc*sc*i*
> alias:          pci:v00001000d00000058sv*sd*bc*sc*i*
> alias:          pci:v00001000d00000056sv*sd*bc*sc*i*
> alias:          pci:v00001000d00000054sv*sd*bc*sc*i*
> alias:          pci:v00001000d00000050sv*sd*bc*sc*i*
> depends:        mptscsih,mptbase
> vermagic:       2.6.34.15
> 64BIT 
> parm:           mpt_pt_clear: Clear persistency table: enable=1  (default=MPTSCSIH_PT_CLEAR=0)
> (int)
> parm:           max_lun: max lun, default=16895  (int)
> 
> 
> So we enabled the debug flag to see the   lvmetad operation . I could see that the vg_list
> operation
> is overlapping the from the other thread and causing the leak in linked list and consequent
> "memory
> smash" for LVMETAD.
> 
> > Jul 17 15:04:14 NODE1 lvmeta.sh[4623]: token_update end len 3 pid 5763 new token
> > filter:3239235440
> > Jul 17 15:04:14 NODE1 lvmeta.sh[4623]: 5763 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 17 15:04:14 NODE1 lvmeta.sh[4623]: 5763 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:06:46 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:06:46 NODE1 lvmeta.sh[4623]: pv_list
> > Jul 18 12:06:47 NODE1 lvmeta.sh[4623]: vg_lookup vgid wxfglR-s3f8-yc3z-sg8K-JcBi-o0Qy-Ic8z0w
> > name
> 
> VG_NODE1
> > Jul 18 12:06:47 NODE1 lvmeta.sh[4623]: vg_clear_outdated_pvs vgid wxfglR-s3f8-yc3z-sg8K-JcBi-
> > o0Qy-
> 
> Ic8z0w
> > Jul 18 12:06:48 NODE1 lvmeta.sh[4623]:   PV /dev/sda4   VG VG_NODE1       lvm2 [<106.71 GiB /
> > 47.75
> 
> GiB free]
> > Jul 18 12:06:48 NODE1 lvmeta.sh[4623]: vg_lookup vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-Q49h-5LWne2
> > name
> 
> VG_System
> > Jul 18 12:06:48 NODE1 lvmeta.sh[4623]: vg_clear_outdated_pvs vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-
> > Q49h-
> 
> 5LWne2
> > Jul 18 12:06:48 NODE1 lvmeta.sh[4623]:   PV /dev/sda3   VG VG_System       lvm2 [29.29 GiB /
> > 9.60
> 
> GiB free]
> > Jul 18 12:06:48 NODE1 lvmeta.sh[4623]:   Total: 2 [136.00 GiB] / in use: 2 [136.00 GiB] / in no
> > VG:
> 
> 0 [0   ]
> > Jul 18 12:07:01 NODE1 lvmeta.sh[4623]: 9936 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:01 NODE1 lvmeta.sh[4623]: 9936 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:01 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: 9977 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: 9977 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: vg_lookup vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-Q49h-5LWne2
> > name
> 
> VG_System
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: 10003 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: 10003 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: 10030 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: 10030 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: vg_lookup vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-Q49h-5LWne2
> > name
> 
> VG_System
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: 10055 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: 10055 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: vg_clear_outdated_pvs vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-
> > Q49h-
> 
> 5LWne2
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: 10083 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: 10083 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: vg_lookup vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-Q49h-5LWne2
> > name
> 
> VG_System
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: 10102 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: 10102 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: vg_clear_outdated_pvs vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-
> > Q49h-
> 
> 5LWne2
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: 10129 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: 10129 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: vg_lookup vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-Q49h-5LWne2
> > name
> 
> VG_System
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: 10153 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: 10153 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:02 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: 10177 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: 10177 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: vg_lookup vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-Q49h-5LWne2
> > name
> 
> VG_System
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: vg_clear_outdated_pvs vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-
> > Q49h-
> 
> 5LWne2
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: 10200 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: 10200 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: vg_clear_outdated_pvs vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-
> > Q49h-
> 
> 5LWne2
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: 10225 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: 10225 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: vg_lookup vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-Q49h-5LWne2
> > name
> 
> VG_System
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: 10250 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: 10250 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: vg_clear_outdated_pvs vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-
> > Q49h-
> 
> 5LWne2
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: 10276 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: 10276 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: vg_lookup vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-Q49h-5LWne2
> > name
> 
> VG_System
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: 10297 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: 10297 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: 10324 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: 10324 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: vg_clear_outdated_pvs vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-
> > Q49h-
> 
> 5LWne2
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: vg_lookup vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-Q49h-5LWne2
> > name
> 
> VG_System
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: 10344 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: 10344 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: 10360 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: 10360 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: vg_lookup vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-Q49h-5LWne2
> > name
> 
> VG_System
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: 10375 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: 10375 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:03 NODE1 lvmeta.sh[4623]: vg_lookup vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-Q49h-5LWne2
> > name
> 
> VG_System
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: vg_clear_outdated_pvs vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-
> > Q49h-
> 
> 5LWne2
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: 10395 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: 10395 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: 10424 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: 10424 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: 10426 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: 10426 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: vg_lookup vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-Q49h-5LWne2
> > name
> 
> VG_System
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: vg_lookup vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-Q49h-5LWne2
> > name
> 
> VG_System
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: vg_clear_outdated_pvs vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-
> > Q49h-
> 
> 5LWne2
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: vg_clear_outdated_pvs vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-
> > Q49h-
> 
> 5LWne2
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: 10438 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: vg_clear_outdated_pvs vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-
> > Q49h-
> 
> 5LWne2
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: 10438 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: vg_lookup vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-Q49h-5LWne2
> > name
> 
> VG_System
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: 10446 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: 10446 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: 10456 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: 10456 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: vg_clear_outdated_pvs vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-
> > Q49h-
> 
> 5LWne2
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: vg_clear_outdated_pvs vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-
> > Q49h-
> 
> 5LWne2
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: 10467 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: 10467 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: vg_clear_outdated_pvs vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-
> > Q49h-
> 
> 5LWne2
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: 10484 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: 10484 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:04 NODE1 lvmeta.sh[4623]: vg_lookup vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-Q49h-5LWne2
> > name
> 
> VG_System
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: 10502 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: 10502 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: 10536 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: 10536 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: 10551 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: 10551 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: vg_clear_outdated_pvs vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-
> > Q49h-
> 
> 5LWne2
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: set info VG name none uuid ziVnMV-iS3r-PMBW-VVKO-pE9F-
> > Q49h-
> 
> 5LWne2 cache_version 351 new_version 352
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: 10574 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: 10574 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: set info VG name none uuid ziVnMV-iS3r-PMBW-VVKO-pE9F-
> > Q49h-
> 
> 5LWne2 cache_version 351 new_version 353
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: 10590 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: 10590 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: vg_list
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: vg_update vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-Q49h-5LWne2
> > name
> 
> VG_System
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: update_metadata begin arg_vgid ziVnMV-iS3r-PMBW-VVKO-
> > pE9F-
> 
> Q49h-5LWne2 arg_name VG_System pvid none
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: update_metadata existing vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-
> 
> Q49h-5LWne2 and existing name VG_System
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: update_metadata for VG_System ziVnMV-iS3r-PMBW-VVKO-pE9F-
> 
> Q49h-5LWne2 from 351 to 353
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: moving PV tpUO22-Ra0R-sXa4-bFH4-eFH1-z2Dr-Nf46dV to VG
> 
> #orphan
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: moving PV tpUO22-Ra0R-sXa4-bFH4-eFH1-z2Dr-Nf46dV to VG
> 
> ziVnMV-iS3r-PMBW-VVKO-pE9F-Q49h-5LWne2
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: update_metadata is done for VG_System ziVnMV-iS3r-PMBW-
> > VVKO-
> 
> pE9F-Q49h-5LWne2
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: pv_found pvid tpUO22-Ra0R-sXa4-bFH4-eFH1-z2Dr-Nf46dV on
> 
> device 2051 matches existing
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: vg_lookup vgid ziVnMV-iS3r-PMBW-VVKO-pE9F-Q49h-5LWne2
> > name
> 
> VG_System
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: 10649 global info flags none reason none token
> 
> filter:3239235440 update_pid 0
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: *** Error in `/usr/bin/lvmetad': malloc(): 	 doubl
> > e
> 
> linked list corrupted: 0x000000ffdc0008c0 ***
> > Jul 18 12:07:05 NODE1 lvmeta.sh[4623]: lvmetad: mm/dbg_malloc.c:271: dm_bounds_check_debug:
> 
> Assertion `!"Memory smash"' failed.
> > Jul 18 12:07:06 NODE1 lvmeta.sh[4623]: /usr/bin/lvmeta.sh: line 5:  5761
> 
> Aborted                 (core dumped) /usr/bin/lvmetad -f -s /run/lvm/lvmetad.socket -l debug
> 
> 
> For us it is reproducible every time when we restart the my host. During but it crashes, since the
> systemd startup script request parallel vgs/lvs to load to the software.
> 
> Reproduction of this is very simple:
> 
> for i in `seq 1 100`; do lvs & done  
> This results in crash of lvmetad. on the mentioned version.
> 
> 
> Attaching the gdb information (We have full gdb information available in the attachment)
> 
> > Thread 1 (LWP 6835):
> > #0  __GI_raise (sig=<optimized out>) at ../sysdeps/unix/sysv/linux/raise.c:58
> > #1  0x000000fff3f53b2c in __GI_abort () at abort.c:89
> > #2  0x000000fff3f4910c in __assert_fail_base (fmt=0xfff4081c60 "%s%s%s:%u: %s%sAssertion `%s'
> 
> failed.\n%n", 
> >     assertion=0xfff4179be8 "!\"Memory smash\"", file=0xfff4179a70 "mm/dbg_malloc.c",
> 
> line=<optimized out>, function=<optimized out>) at assert.c:92
> > #3  0x000000fff3f491dc in __GI___assert_fail (assertion=0xfff4179be8 "!\"Memory smash\"",
> 
> file=0xfff4179a70 "mm/dbg_malloc.c", line=<optimized out>, 
> >     function=0xfff4179c08 "dm_bounds_check_debug") at assert.c:101
> > #4  0x000000fff415eab4 in dm_bounds_check_debug () from /usr/lib64/libdevmapper.so.1.02
> > #5  0x000000fff415ef04 in dm_bounds_check_wrapper () from /usr/lib64/libdevmapper.so.1.02
> > #6  0x000000fff415e0f0 in dm_malloc_aux_debug () from /usr/lib64/libdevmapper.so.1.02
> > #7  0x000000fff415ecb4 in dm_malloc_wrapper () from /usr/lib64/libdevmapper.so.1.02
> > #8  0x000000fff4159d2c in dm_vasprintf () from /usr/lib64/libdevmapper.so.1.02
> > #9  0x000000fff4159f68 in dm_asprintf () from /usr/lib64/libdevmapper.so.1.02
> > #10 0x000000aab47155fc in buffer_append_vf ()
> > #11 0x000000aab4712a80 in daemon_reply_simple ()
> > #12 0x000000aab470ec88 in _ftext ()
> > Backtrace stopped: frame did not save the PC
> 
> 
> 
> 
> Can you help us on this .
> 
> 
> With Regards,
> Gururaj S
> "We share We grow"
> 
> 
