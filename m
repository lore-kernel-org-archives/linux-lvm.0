From: Heinz Mauelshagen <hjm@redhat.com>
Subject: Re: [linux-lvm] Help : vg not accessible (with pvdata result)
Message-ID: <20040308104012.GA26900@redhat.com>
References: <24803749.1078726793075.JavaMail.www@wwinf0201>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24803749.1078726793075.JavaMail.www@wwinf0201>
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
Date: Mon Mar  8 09:56:03 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com
Cc: hjm@redhat.com

Pascal,

can you send me (hjm@redhat.com) the first 4MB (see script below) of each PV
and I'll try to reconstruct your partial overwritten metadata.

Regards,
Heinz    -- The LVM Guy --


I need the dd output of /dev/hda[156]:

for d in 1 5 6
do
	dd if=/dev/hda$d of=hda${d}.vgda bs=1k count=4k
done
tar cf pascal.vgda.tar hda?.vgda
rm hda?.vgda
bzip2 pascal.vgda.tar

On Mon, Mar 08, 2004 at 07:19:53AM +0100, dld.pascal.garcia wrote:
> Hello,  
> My problem is the following :  
> If use lvm on my laptop for ages.  
>   
> By lack of space I decided to add a pv to the vg, and extend the lv /.  
>  
> It seems that diskdrake uses a pvcreate to add the pv in the vg.  
> After I made a lvextend on the lv mounted as / of 500Mb and a  
> rizerfsresize.  
> This was working fine. The problem occured after reboot.  
>   
> I did not run lilo  to recreate the Master boot sector and may be it is  
> one problem as / in a lv.  
>   
> I tried the recue disk, but Mandrake did not include the lvmtools, so I  
> tried a new installation. The installation process told me that there  
> was illegal division by 0 when acessing the information of the vg.  
> So i did not change anything an stopped the installation, (switch off  
> the pc because there is no sofware abort possible without change of the  
> disk data at this stage of the installation).  
>   
> As I had no solution on the portable, I took the disk out of my portable,  
> and put it as primary (so the disk is hda as in the portable) in a fixed  
> machine  (special cables available), I added a second disk as slave and  
> installed the  distribution on the second disk. Then the MSB has been  
> replaced. That is really a problem because now I can not even start  
> booting on the portable disk.  
>   
>   
> All the tools are now available, diskdrake told me that the partition I  
> finally  added (hda1) was not in the vg. So I added the partition. It  
> was an error I completly  realize it now.  
> An error has been repported on pvcreate, but mainly it has been done, 
> but  
> the data  in /etc has not been created.  
>   
> whith pvdata now I can see that I have 2 pvs with number one. The  
> orgiginal first (hda6) and the volume i finally added (hda1).  
>   
> pvremove reports an error, and does nothing.  
>   
> vgscan does nothing on rootvg as it is inconsistant. Anyway the system do  
> not know the vg, /dev/rootvg/[123] do not exist.  
>   
>  
> I think I should first, by patching the data by hand, either remove the  
> last pv I added (hda1), or make it as beeing the 3rd pv of the vg. What  
> ever I have to patch, I have to make the data on the pv consistant. 
>  
> When the data will then be available, I will backup the data, put the  
> disk back in the portable and reinstall everything.  
>   
> Thank you for any help that would permit to save my data. 
>   
> Pascal Garcia  
>   
>  
> Here is the result of the vgscan and pvdata 
>  
>  
> root@localhost: /root[root@localhost root]# vgscan 
> vgscan -- reading all physical volumes (this may take a while...) 
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data 
> of volume group "rootvg" from physical volume(s) 
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created 
> vgscan -- WARNING: This program does not do a VGDA backup of your 
> volume group 
>  
> root@localhost: /root[root@localhost root]# vgscan -v 
> vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d" 
> vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d" 
> vgscan -- reading all physical volumes (this may take a while...) 
> vgscan -- scanning for all active volume group(s) first 
> vgscan -- reading data of volume group "rootvg" from physical volume(s) 
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data 
> of volume group "rootvg" from physical volume(s) 
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created 
> vgscan -- WARNING: This program does not do a VGDA backup of your 
> volume group 
>  
> root@localhost: /root[root@localhost root]#  
> root@localhost: /root[root@localhost root]#  
> root@localhost: /root[root@localhost root]# pvdata /dev/hda6 
> --- Physical volume --- 
> PV Name               /dev/hda6 
> VG Name               rootvg 
> PV Size               20.71 GB [43423632 secs] / NOT usable 32.19 MB [LVM: 
> 130 KB] 
> PV#                   1 
> PV Status             available 
> Allocatable           yes (but full) 
> Cur LV                3 
> PE Size (KByte)       32768 
> Total PE              661 
> Free PE               0 
> Allocated PE          661 
> PV UUID               l1McpK-mb3s-j04q-NRFM-ili3-mcF0-MPHqnV 
>  
> --- Volume group --- 
> VG Name                
> VG Access             read/write 
> VG Status             NOT available/resizable 
> VG #                  0 
> MAX LV                256 
> Cur LV                3 
> Open LV               0 
> MAX LV Size           2 TB 
> Max PV                256 
> Cur PV                3 
> Act PV                3 
> VG Size               27.78 GB 
> PE Size               32 MB 
> Total PE              889 
> Alloc PE / Size       685 / 21.41 GB 
> Free  PE / Size       204 / 6.38 GB 
> VG UUID               dyEbIX-HcZF-9Jna-UmlR-bmKL-PiQ6-kFLTq0 
>  
> --- List of logical volumes --- 
>  
> pvdata -- logical volume "/dev/rootvg/1" at offset   0 
> pvdata -- logical volume "/dev/rootvg/2" at offset   1 
> pvdata -- logical volume "/dev/rootvg/3" at offset   2 
> pvdata -- logical volume struct at offset   3 is empty 
> ... 
> pvdata -- logical volume struct at offset 255 is empty 
> --- List of physical volume UUIDs --- 
>  
> 001: l1McpK-mb3s-j04q-NRFM-ili3-mcF0-MPHqnV 
> 002: miXh0a-OJFd-7zRt-2oQT-uvHb-zsTO-xBV7O8 
> 003: The3kH-g4Pr-eFe2-mcKO-pAgq-BUNr-NLXs1w 
>  
> root@localhost: /root[root@localhost root]# pvdata /dev/hda5 
> --- Physical volume --- 
> PV Name               /dev/hda5 
> VG Name               rootvg 
> PV Size               313.74 MB [642537 secs] / NOT usable 32.19 MB [LVM: 
> 128 KB] 
> PV#                   2 
> PV Status             NOT available 
> Allocatable           yes (but full) 
> Cur LV                1 
> PE Size (KByte)       32768 
> Total PE              8 
> Free PE               0 
> Allocated PE          8 
> PV UUID               miXh0a-OJFd-7zRt-2oQT-uvHb-zsTO-xBV7O8 
>  
> --- Volume group --- 
> VG Name                
> VG Access             read/write 
> VG Status             NOT available/resizable 
> VG #                  0 
> MAX LV                256 
> Cur LV                3 
> Open LV               0 
> MAX LV Size           2 TB 
> Max PV                256 
> Cur PV                3 
> Act PV                3 
> VG Size               27.78 GB 
> PE Size               32 MB 
> Total PE              889 
> Alloc PE / Size       685 / 21.41 GB 
> Free  PE / Size       204 / 6.38 GB 
> VG UUID               dyEbIX-HcZF-9Jna-UmlR-bmKL-PiQ6-kFLTq0 
>  
> --- List of logical volumes --- 
>  
> pvdata -- logical volume "/dev/rootvg/1" at offset   0 
> pvdata -- logical volume "/dev/rootvg/2" at offset   1 
> pvdata -- logical volume "/dev/rootvg/3" at offset   2 
> pvdata -- logical volume struct at offset   3 is empty 
> ... 
> pvdata -- logical volume struct at offset 255 is empty 
> --- List of physical volume UUIDs --- 
>  
> 001: l1McpK-mb3s-j04q-NRFM-ili3-mcF0-MPHqnV 
> 002: miXh0a-OJFd-7zRt-2oQT-uvHb-zsTO-xBV7O8 
> 003: The3kH-g4Pr-eFe2-mcKO-pAgq-BUNr-NLXs1w 
>  
>  
> root@localhost: /root[root@localhost root]# pvdisplay /dev/hda6 
> --- Physical volume --- 
> PV Name               /dev/ide/host0/bus0/target0/lun0/part6 
> VG Name               rootvg 
> PV Size               20.71 GB [43423632 secs] / NOT usable 32.19 MB [LVM: 
> 130 KB] 
> PV#                   1 
> PV Status             available 
> Allocatable           yes (but full) 
> Cur LV                3 
> PE Size (KByte)       32768 
> Total PE              661 
> Free PE               0 
> Allocated PE          661 
> PV UUID               l1McpK-mb3s-j04q-NRFM-ili3-mcF0-MPHqnV 
>  
>  
> root@localhost: /root[root@localhost root]# pvdisplay /dev/hda5 
> --- Physical volume --- 
> PV Name               /dev/ide/host0/bus0/target0/lun0/part5 
> VG Name               rootvg 
> PV Size               313.74 MB [642537 secs] / NOT usable 32.19 MB [LVM: 
> 128 KB] 
> PV#                   2 
> PV Status             NOT available 
> Allocatable           yes (but full) 
> Cur LV                1 
> PE Size (KByte)       32768 
> Total PE              8 
> Free PE               0 
> Allocated PE          8 
> PV UUID               miXh0a-OJFd-7zRt-2oQT-uvHb-zsTO-xBV7O8 
>  
> root@localhost: /root/vg[root@localhost vg]# pvdisplay /dev/hda1 
> --- Physical volume --- 
> PV Name               /dev/ide/host0/bus0/target0/lun0/part1 
> VG Name               rootvg 
> PV Size               6.93 GB [14538762 secs] / NOT usable 32.19 MB [LVM: 
> 128 KB] 
> PV#                   1 
> PV Status             NOT available 
> Allocatable           yes 
> Cur LV                0 
> PE Size (KByte)       32768 
> Total PE              220 
> Free PE               220 
> Allocated PE          0 
> PV UUID               none 
>  
>  
> root@localhost: /root/vg[root@localhost vg]# pvdata /dev/hda1 
> --- Physical volume --- 
> PV Name               /dev/hda1 
> VG Name               rootvg 
> PV Size               6.93 GB [14538762 secs] / NOT usable 32.19 MB [LVM: 
> 128 KB] 
> PV#                   1 
> PV Status             NOT available 
> Allocatable           yes 
> Cur LV                0 
> PE Size (KByte)       32768 
> Total PE              220 
> Free PE               220 
> Allocated PE          0 
> PV UUID               none 
>  
> --- Volume group --- 
> VG Name                
> VG Access             read/write 
> VG Status             NOT available/resizable 
> VG #                  0 
> MAX LV                256 
> Cur LV                0 
> Open LV               0 
> MAX LV Size           2 TB 
> Max PV                256 
> Cur PV                1 
> Act PV                1 
> VG Size               6.88 GB 
> PE Size               32 MB 
> Total PE              220 
> Alloc PE / Size       0 / 0 
> Free  PE / Size       220 / 6.88 GB 
> VG UUID               none 
>  
> --- List of logical volumes --- 
>  
> pvdata -- logical volume struct at offset   0 is empty 
> ... 
> pvdata -- logical volume struct at offset 255 is empty 
> --- List of physical volume UUIDs --- 
>  
> Segmentation fault (core dumped) 
>  
>  
>  
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
