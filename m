Subject: Re: [linux-lvm] vgchange -ay Killed
From: Ming Zhang <mingz@ele.uri.edu>
In-Reply-To: <1146323005.15799.8.camel@localhost.localdomain>
References: <1146240603.23548.106.camel@localhost.localdomain>
	<01309aa0302de7b36b75ce2612b38706@redhat.com>
	<1146262242.23548.207.camel@localhost.localdomain>
	<e651e1f7ae134a3bddcd370a7e29119d@redhat.com>
	<1146323005.15799.8.camel@localhost.localdomain>
Content-Type: multipart/mixed; boundary="=-qbH4xMbjadv82KMnYf1B"
Date: Sat, 29 Apr 2006 17:56:17 -0400
Message-Id: <1146347778.22360.1.camel@localhost.localdomain>
Mime-Version: 1.0
Reply-To: mingz@ele.uri.edu,
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
To: Jonathan E Brassow <jbrassow@redhat.com>
Cc: linux-lvm <linux-lvm@redhat.com>


--=-qbH4xMbjadv82KMnYf1B
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

forgot cc to lvm.

-------------------------
Hi Jonathan

I found out the reason, OOM, though no time to find out why vgchange
invoke that. vgchange seems to need ~3MB memory per lv it handled. quite
scary and poor scalability. I attached several logs to show this
problem. The oomlog is the kernel msg about oom killer. The toplog is
the last a few output from a top run. The vgscanlog is the last few scan
log.

  LVM version:     2.02.01 (2005-11-23)
  Library version: 1.02.02 (2006-01-04)
  Driver version:  4.4.0

Ming

On Sat, 2006-04-29 at 11:03 -0400, Ming Zhang wrote:
> On Sat, 2006-04-29 at 10:01 -0500, Jonathan E Brassow wrote:
> > Ming,
> > 
> > I remember you having a conversation about increasing the metadatasize 
> > of pvs (June 6th,2005) to accommodate large numbers of volumes... 
> > apparently, this didn't help?
> 
> yes, that helps. if without larger metadata size, i can not create that
> large number of lv at all.
> 
> > 
> > It seems to me that LVM might not be able to allocate enough memory... 
> > perhaps its internal memory cache is to small...  Use four v's for more 
> > verbose output.  Maybe it will give us some clues.
> 
> yes, same to me. i will redo the test soon and use 4v this time.
> 
> thanks.
> 
> 
> > 
> >   brassow
> > 
> > 
> > On Apr 28, 2006, at 5:10 PM, Ming Zhang wrote:
> > 
> > > no.  i do
> > >
> > > lvcreate -L1G -nlv1 vg1
> > > ...
> > > lvcreate -L1G -nlv3000 vg1
> > >
> > > so total 3000 logical volumes.
> > >
> > > then optionally i do lvscan, vgscan, pvscan. all kinds of scan. seems
> > > not fast.
> > >
> > > then i reboot, and then the vg will fail to activate all lv.
> > >
> > > ming
> > >
> > >
> > > On Fri, 2006-04-28 at 17:09 -0500, Jonathan E Brassow wrote:
> > >> You mean:
> > >> 1) lvcreate -L 3k -n lv vg
> > >> 2) vgchange -an vg
> > >> 3) vgchange -ay vg
> > >>
> > >> or do you mean something else?
> > >>
> > >>   brassow
> > >>
> > >> On Apr 28, 2006, at 11:10 AM, Ming Zhang wrote:
> > >>
> > >>> This is what i get when try to active a VG with 3K LVs. repeatable.
> > >>>
> > >>>   LVM version:     2.02.01 (2005-11-23)
> > >>>   Library version: 1.02.02 (2006-01-04)
> > >>>   Driver version:  4.4.0
> > >>>
> > >>>
> > >>> [root@dualxeon ~]# vgchange -ay
> > >>> Killed
> > >>>
> > >>>
> > >>> seem that "Locking memory" only appear once, and then stuck till
> > >>> killed.
> > >>>
> > >>> --------some debug output if i use vgchang -ay -vvv--------------
> > >>>     Found volume group "vg1"
> > >>>         Getting device info for vg1-v678
> > >>>         dm info
> > >>> LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367 
> > >>> N
> > >>> [16384]
> > >>>         Locking LV
> > >>> 8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeL0DcqwlzsZSb0p6eIhXnV2uyE8KNAZG2 (R)
> > >>>       Finding volume group for uuid
> > >>> 8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeL0DcqwlzsZSb0p6eIhXnV2uyE8KNAZG2
> > >>>       /dev/md0: lvm2 label detected
> > >>>       /dev/md1: lvm2 label detected
> > >>>       /dev/md0: lvm2 label detected
> > >>>       /dev/md1: lvm2 label detected
> > >>>         Read vg1 metadata (3001) from /dev/md0 at 272384 size 706783
> > >>>       /dev/md0: lvm2 label detected
> > >>>       /dev/md1: lvm2 label detected
> > >>>         Read vg1 metadata (3001) from /dev/md1 at 272384 size 706783
> > >>>     Found volume group "vg1"
> > >>>         Getting device info for vg1-v679
> > >>>         dm info
> > >>> LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeL0DcqwlzsZSb0p6eIhXnV2uyE8KNAZG2 
> > >>> N
> > >>> [16384]
> > >>>         Locking LV
> > >>> 8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeccjyapQkKwo75je1cFLyZ84RO4LWQnk5 (R)
> > >>>       Finding volume group for uuid
> > >>> 8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeccjyapQkKwo75je1cFLyZ84RO4LWQnk5
> > >>>       /dev/md0: lvm2 label detected
> > >>>       /dev/md1: lvm2 label detected
> > >>>       /dev/md0: lvm2 label detected
> > >>>       /dev/md1: lvm2 label detected
> > >>>         Read vg1 metadata (3001) from /dev/md0 at 272384 size 706783
> > >>>       /dev/md0: lvm2 label detected
> > >>>       /dev/md1: lvm2 label detected
> > >>>         Read vg1 metadata (3001) from /dev/md1 at 272384 size 706783
> > >>>     Found volume group "vg1"
> > >>>         Getting device info for vg1-v680
> > >>>         dm info
> > >>> LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeccjyapQkKwo75je1cFLyZ84RO4LWQnk5 
> > >>> N
> > >>> [16384]
> > >>>         dm info
> > >>> 8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeccjyapQkKwo75je1cFLyZ84RO4LWQnk5 N
> > >>> [16384]
> > >>>         dm info vg1-v680  N   [16384]
> > >>>       Locking memory
> > >>>
> > >>>
> > >>> _______________________________________________
> > >>> linux-lvm mailing list
> > >>> linux-lvm@redhat.com
> > >>> https://www.redhat.com/mailman/listinfo/linux-lvm
> > >>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> > >>>
> > >>
> > >
> > 
> 

--=-qbH4xMbjadv82KMnYf1B
Content-Disposition: attachment; filename=oomlog
Content-Type: text/plain; name=oomlog; charset=utf-8
Content-Transfer-Encoding: 7bit

oom-killer: gfp_mask=0xd0, order=0
Mem-info:
Node 0 DMA per-cpu:
cpu 0 hot: low 2, high 6, batch 1 used:5
cpu 0 cold: low 0, high 2, batch 1 used:0
cpu 1 hot: low 2, high 6, batch 1 used:2
cpu 1 cold: low 0, high 2, batch 1 used:0
cpu 2 hot: low 2, high 6, batch 1 used:2
cpu 2 cold: low 0, high 2, batch 1 used:1
cpu 3 hot: low 2, high 6, batch 1 used:4
cpu 3 cold: low 0, high 2, batch 1 used:0
Node 0 Normal per-cpu:
cpu 0 hot: low 62, high 186, batch 31 used:158
cpu 0 cold: low 0, high 62, batch 31 used:55
cpu 1 hot: low 62, high 186, batch 31 used:114
cpu 1 cold: low 0, high 62, batch 31 used:47
cpu 2 hot: low 62, high 186, batch 31 used:120
cpu 2 cold: low 0, high 62, batch 31 used:29
cpu 3 hot: low 62, high 186, batch 31 used:116
cpu 3 cold: low 0, high 62, batch 31 used:50
Node 0 HighMem per-cpu: empty
Free pages:       14884kB (0kB HighMem)
Active:244667 inactive:250322 dirty:0 writeback:0 unstable:0 free:3721 slab:9194 mapped:494595 pagetables:1325
Node 0 DMA free:8168kB min:44kB low:52kB high:64kB active:1804kB inactive:1108kB present:15976kB pages_scanned:3088 all_unreclaimable? yes
lowmem_reserve[]: 0 2031 2031
Node 0 Normal free:6716kB min:5740kB low:7172kB high:8608kB active:976736kB inactive:1000180kB present:2080192kB pages_scanned:255545 all_unreclaimable? no
lowmem_reserve[]: 0 0 0
Node 0 HighMem free:0kB min:128kB low:160kB high:192kB active:0kB inactive:0kB present:0kB pages_scanned:0 all_unreclaimable? no
lowmem_reserve[]: 0 0 0
Node 0 DMA: 0*4kB 1*8kB 0*16kB 1*32kB 1*64kB 1*128kB 1*256kB 1*512kB 1*1024kB 1*2048kB 1*4096kB = 8168kB
Node 0 Normal: 313*4kB 43*8kB 2*16kB 3*32kB 2*64kB 0*128kB 1*256kB 1*512kB 0*1024kB 0*2048kB 1*4096kB = 6716kB
Node 0 HighMem: empty
Swap cache: add 483211, delete 2156, find 52/65, race 0+0
Free swap  = 2260368kB
Total swap = 4192956kB
Free swap:       2260368kB
524144 pages of RAM
10297 reserved pages
81676 pages shared
481083 pages swap cached
Out of Memory: Killed process 4550 (lvm).

--=-qbH4xMbjadv82KMnYf1B
Content-Disposition: attachment; filename=toplog
Content-Type: text/plain; name=toplog; charset=utf-8
Content-Transfer-Encoding: 7bit

top - 11:27:09 up 9 min,  4 users,  load average: 0.99, 0.70, 0.33
Tasks:  91 total,   2 running,  89 sleeping,   0 stopped,   0 zombie
Cpu(s): 22.8% us,  3.3% sy,  0.0% ni, 73.8% id,  0.2% wa,  0.0% hi,  0.0% si
Mem:   2055388k total,  2004028k used,    51360k free,    12184k buffers
Swap:  4192956k total,        0k used,  4192956k free,   100016k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND            
 4550 root      21   0 1836m 1.8g  48m R 98.7 91.2   4:45.39 lvm                
 9305 root      16   0  6212  976  744 R  0.3  0.0   0:00.16 top                
10572 root      16   0  6212  992  760 S  0.3  0.0   0:00.08 top                
    1 root      16   0  4820  560  464 S  0.0  0.0   0:01.23 init               
    2 root      RT   0     0    0    0 S  0.0  0.0   0:00.01 migration/0        
    3 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd/0        
    4 root      RT   0     0    0    0 S  0.0  0.0   0:00.01 migration/1        
    5 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd/1        
    6 root      RT   0     0    0    0 S  0.0  0.0   0:00.00 migration/2        
    7 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd/2        
    8 root      RT   0     0    0    0 S  0.0  0.0   0:00.00 migration/3        
    9 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd/3        
   10 root      10  -5     0    0    0 S  0.0  0.0   0:00.01 events/0           
   11 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 events/1           
   12 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 events/2           
   13 root      10  -5     0    0    0 S  0.0  0.0   0:00.01 events/3           
   14 root      10  -5     0    0    0 S  0.0  0.0   0:00.05 khelper            
   15 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kthread            
   21 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kacpid             
  123 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/0          
  124 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/1          
  125 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/2          
  126 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/3          
  201 root      20   0     0    0    0 S  0.0  0.0   0:00.00 pdflush            
  202 root      15   0     0    0    0 S  0.0  0.0   0:00.00 pdflush            
  203 root      16   0     0    0    0 S  0.0  0.0   0:00.00 kswapd0            
  204 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 aio/0              
  205 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 aio/1              
  206 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 aio/2              
  207 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 aio/3              
  282 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kseriod            
  344 root      16   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_0          
  345 root      15   0     0    0    0 S  0.0  0.0   0:00.00 ahd_dv_0           
  347 root      16   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_1          
  348 root      15   0     0    0    0 S  0.0  0.0   0:00.00 ahd_dv_1           
  361 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kcryptd/0          
  362 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kcryptd/1          
  363 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kcryptd/2          
  364 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kcryptd/3          
  365 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kmpathd/0          
  366 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kmpathd/1          
  367 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kmpathd/2          
  368 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kmpathd/3          
  369 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kmirrord           
  389 root      15   0     0    0    0 S  0.0  0.0   0:00.23 kjournald          
 1220 root      10  -5  3680  456  368 S  0.0  0.0   0:00.17 udevd              
 1343 root      19   0     0    0    0 S  0.0  0.0   0:00.00 shpchpd_event      
 1456 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kauditd            
 1605 root      19   0     0    0    0 S  0.0  0.0   0:00.00 kjournald          
 2613 root      16   0  4500 1284  772 S  0.0  0.1   0:00.00 dhclient           
 2653 root      16   0  3696  620  504 S  0.0  0.0   0:00.04 syslogd            
 2657 root      16   0  2612  496  412 S  0.0  0.0   0:00.00 klogd              
 2668 root      16   0  2628  524  416 S  0.0  0.0   0:00.01 irqbalance         
 2796 root      18   0  2920  868  616 S  0.0  0.0   0:00.00 smartd             
 2806 root      19   0  2608  552  464 S  0.0  0.0   0:00.00 acpid              
 2854 root      15   0 22020 2088 1640 S  0.0  0.1   0:00.03 sshd               
 2869 root      15   0  8784  880  708 S  0.0  0.0   0:00.00 xinetd             
 2888 ntp       16   0 18632 5368 4224 S  0.0  0.3   0:00.01 ntpd               
 2898 root      16   0  4252  528  444 S  0.0  0.0   0:00.00 gpm                
 2908 root      16   0 57120 1188  740 S  0.0  0.1   0:00.00 crond              
 2931 xfs       18   0 10320 1712  772 S  0.0  0.1   0:00.02 xfs                
 2941 root      35  19  2604  648  536 S  0.0  0.0   0:00.00 anacron            
 2950 root      16   0  9032  808  648 S  0.0  0.0   0:00.00 atd                
 2960 dbus      16   0  9760 1232 1060 S  0.0  0.1   0:00.17 dbus-daemon-1      
 3020 root      17   0 27632 1312 1004 S  0.0  0.1   0:00.01 login              
 3021 root      16   0 27636 1316 1004 S  0.0  0.1   0:00.00 login              
 3022 root      16   0 27632 1312 1004 S  0.0  0.1   0:00.00 login              
 3023 root      16   0 27632 1312 1004 S  0.0  0.1   0:00.01 login              
 3024 root      18   0  2600  412  344 S  0.0  0.0   0:00.00 mingetty           
 3025 root      18   0  2600  416  344 S  0.0  0.0   0:00.00 mingetty           
 3521 root      16   0 54040 1620 1192 S  0.0  0.1   0:00.03 bash               
 3571 root      17   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_2          
 3572 root      18   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_3          
 3573 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_4          
 3574 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_5          
 3575 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_6          
 3576 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_7          
 3577 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_8          
 3578 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_9          
 3975 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_10         
 3976 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_11         
 3977 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_12         
 3979 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_13         
 3980 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_14         
 3981 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_15         
 3982 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_16         
 3983 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_17         
 4727 root      15   0 54040 1616 1192 S  0.0  0.1   0:00.03 bash               
 5397 root      16   0 53800  572  472 S  0.0  0.0   0:00.21 tail               
 6355 root      15   0 54044 1620 1192 S  0.0  0.1   0:00.03 bash               
 9581 root      15   0 54040 1616 1192 S  0.0  0.1   0:00.03 bash               


top - 11:27:12 up 9 min,  4 users,  load average: 0.99, 0.70, 0.33
Tasks:  91 total,   2 running,  89 sleeping,   0 stopped,   0 zombie
Cpu(s): 22.3% us,  3.4% sy,  0.0% ni, 74.1% id,  0.2% wa,  0.0% hi,  0.0% si
Mem:   2055388k total,  2022264k used,    33124k free,    12184k buffers
Swap:  4192956k total,        0k used,  4192956k free,   100016k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND            
 4550 root      18   0 1853m 1.8g  48m R 98.7 92.1   4:48.36 lvm                
    1 root      16   0  4820  560  464 S  0.0  0.0   0:01.23 init               
    2 root      RT   0     0    0    0 S  0.0  0.0   0:00.01 migration/0        
    3 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd/0        
    4 root      RT   0     0    0    0 S  0.0  0.0   0:00.01 migration/1        
    5 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd/1        
    6 root      RT   0     0    0    0 S  0.0  0.0   0:00.00 migration/2        
    7 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd/2        
    8 root      RT   0     0    0    0 S  0.0  0.0   0:00.00 migration/3        
    9 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd/3        
   10 root      10  -5     0    0    0 S  0.0  0.0   0:00.01 events/0           
   11 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 events/1           
   12 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 events/2           
   13 root      10  -5     0    0    0 S  0.0  0.0   0:00.01 events/3           
   14 root      10  -5     0    0    0 S  0.0  0.0   0:00.05 khelper            
   15 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kthread            
   21 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kacpid             
  123 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/0          
  124 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/1          
  125 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/2          
  126 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/3          
  201 root      20   0     0    0    0 S  0.0  0.0   0:00.00 pdflush            
  202 root      15   0     0    0    0 S  0.0  0.0   0:00.00 pdflush            
  203 root      16   0     0    0    0 S  0.0  0.0   0:00.00 kswapd0            
  204 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 aio/0              
  205 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 aio/1              
  206 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 aio/2              
  207 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 aio/3              
  282 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kseriod            
  344 root      16   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_0          
  345 root      15   0     0    0    0 S  0.0  0.0   0:00.00 ahd_dv_0           
  347 root      16   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_1          
  348 root      15   0     0    0    0 S  0.0  0.0   0:00.00 ahd_dv_1           
  361 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kcryptd/0          
  362 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kcryptd/1          
  363 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kcryptd/2          
  364 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kcryptd/3          
  365 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kmpathd/0          
  366 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kmpathd/1          
  367 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kmpathd/2          
  368 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kmpathd/3          
  369 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kmirrord           
  389 root      15   0     0    0    0 S  0.0  0.0   0:00.23 kjournald          
 1220 root      10  -5  3680  456  368 S  0.0  0.0   0:00.17 udevd              
 1343 root      19   0     0    0    0 S  0.0  0.0   0:00.00 shpchpd_event      
 1456 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kauditd            
 1605 root      19   0     0    0    0 S  0.0  0.0   0:00.00 kjournald          
 2613 root      16   0  4500 1284  772 S  0.0  0.1   0:00.00 dhclient           
 2653 root      16   0  3696  620  504 S  0.0  0.0   0:00.04 syslogd            
 2657 root      16   0  2612  496  412 S  0.0  0.0   0:00.00 klogd              
 2668 root      16   0  2628  524  416 S  0.0  0.0   0:00.01 irqbalance         
 2796 root      18   0  2920  868  616 S  0.0  0.0   0:00.00 smartd             
 2806 root      19   0  2608  552  464 S  0.0  0.0   0:00.00 acpid              
 2854 root      15   0 22020 2088 1640 S  0.0  0.1   0:00.03 sshd               
 2869 root      15   0  8784  880  708 S  0.0  0.0   0:00.00 xinetd             
 2888 ntp       16   0 18632 5368 4224 S  0.0  0.3   0:00.01 ntpd               
 2898 root      16   0  4252  528  444 S  0.0  0.0   0:00.00 gpm                
 2908 root      16   0 57120 1188  740 S  0.0  0.1   0:00.00 crond              
 2931 xfs       18   0 10320 1712  772 S  0.0  0.1   0:00.02 xfs                
 2941 root      35  19  2604  648  536 S  0.0  0.0   0:00.00 anacron            
 2950 root      16   0  9032  808  648 S  0.0  0.0   0:00.00 atd                
 2960 dbus      16   0  9760 1232 1060 S  0.0  0.1   0:00.17 dbus-daemon-1      
 3020 root      17   0 27632 1312 1004 S  0.0  0.1   0:00.01 login              
 3021 root      16   0 27636 1316 1004 S  0.0  0.1   0:00.00 login              
 3022 root      16   0 27632 1312 1004 S  0.0  0.1   0:00.00 login              
 3023 root      16   0 27632 1312 1004 S  0.0  0.1   0:00.01 login              
 3024 root      18   0  2600  412  344 S  0.0  0.0   0:00.00 mingetty           
 3025 root      18   0  2600  416  344 S  0.0  0.0   0:00.00 mingetty           
 3521 root      16   0 54040 1620 1192 S  0.0  0.1   0:00.03 bash               
 3571 root      17   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_2          
 3572 root      18   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_3          
 3573 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_4          
 3574 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_5          
 3575 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_6          
 3576 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_7          
 3577 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_8          
 3578 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_9          
 3975 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_10         
 3976 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_11         
 3977 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_12         
 3979 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_13         
 3980 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_14         
 3981 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_15         
 3982 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_16         
 3983 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_17         
 4727 root      15   0 54040 1616 1192 S  0.0  0.1   0:00.03 bash               
 5397 root      16   0 53800  572  472 S  0.0  0.0   0:00.21 tail               
 6355 root      15   0 54044 1620 1192 S  0.0  0.1   0:00.03 bash               
 9305 root      16   0  6212  976  744 R  0.0  0.0   0:00.16 top                
 9581 root      15   0 54040 1616 1192 S  0.0  0.1   0:00.03 bash               
10572 root      16   0  6212  992  760 S  0.0  0.0   0:00.08 top                


top - 11:27:15 up 9 min,  4 users,  load average: 0.99, 0.70, 0.33
Tasks:  91 total,   2 running,  89 sleeping,   0 stopped,   0 zombie
Cpu(s): 21.8% us,  3.9% sy,  0.0% ni, 72.2% id,  1.9% wa,  0.1% hi,  0.1% si
Mem:   2055388k total,  2034504k used,    20884k free,    11888k buffers
Swap:  4192956k total,        0k used,  4192956k free,    94804k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND            
 4550 root      18   0 1870m 1.8g  48m R 98.1 92.9   4:51.31 lvm                
    1 root      16   0  4820  560  464 S  0.0  0.0   0:01.23 init               
    2 root      RT   0     0    0    0 S  0.0  0.0   0:00.01 migration/0        
    3 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd/0        
    4 root      RT   0     0    0    0 S  0.0  0.0   0:00.01 migration/1        
    5 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd/1        
    6 root      RT   0     0    0    0 S  0.0  0.0   0:00.00 migration/2        
    7 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd/2        
    8 root      RT   0     0    0    0 S  0.0  0.0   0:00.00 migration/3        
    9 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd/3        
   10 root      10  -5     0    0    0 S  0.0  0.0   0:00.01 events/0           
   11 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 events/1           
   12 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 events/2           
   13 root      10  -5     0    0    0 S  0.0  0.0   0:00.01 events/3           
   14 root      10  -5     0    0    0 S  0.0  0.0   0:00.05 khelper            
   15 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kthread            
   21 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kacpid             
  123 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/0          
  124 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/1          
  125 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/2          
  126 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/3          
  201 root      15   0     0    0    0 S  0.0  0.0   0:00.00 pdflush            
  202 root      15   0     0    0    0 S  0.0  0.0   0:00.00 pdflush            
  203 root      15   0     0    0    0 S  0.0  0.0   0:00.00 kswapd0            
  204 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 aio/0              
  205 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 aio/1              
  206 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 aio/2              
  207 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 aio/3              
  282 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kseriod            
  344 root      16   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_0          
  345 root      15   0     0    0    0 S  0.0  0.0   0:00.00 ahd_dv_0           
  347 root      16   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_1          
  348 root      15   0     0    0    0 S  0.0  0.0   0:00.00 ahd_dv_1           
  361 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kcryptd/0          
  362 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kcryptd/1          
  363 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kcryptd/2          
  364 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kcryptd/3          
  365 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kmpathd/0          
  366 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kmpathd/1          
  367 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kmpathd/2          
  368 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kmpathd/3          
  369 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kmirrord           
  389 root      15   0     0    0    0 S  0.0  0.0   0:00.23 kjournald          
 1220 root      10  -5  3680  456  368 S  0.0  0.0   0:00.17 udevd              
 1343 root      19   0     0    0    0 S  0.0  0.0   0:00.00 shpchpd_event      
 1456 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kauditd            
 1605 root      19   0     0    0    0 S  0.0  0.0   0:00.00 kjournald          
 2613 root      16   0  4500 1284  772 S  0.0  0.1   0:00.00 dhclient           
 2653 root      16   0  3696  620  504 S  0.0  0.0   0:00.04 syslogd            
 2657 root      16   0  2612  496  412 S  0.0  0.0   0:00.00 klogd              
 2668 root      16   0  2628  524  416 S  0.0  0.0   0:00.01 irqbalance         
 2796 root      18   0  2920  868  616 S  0.0  0.0   0:00.00 smartd             
 2806 root      19   0  2608  552  464 S  0.0  0.0   0:00.00 acpid              
 2854 root      15   0 22020 2088 1640 S  0.0  0.1   0:00.03 sshd               
 2869 root      15   0  8784  880  708 S  0.0  0.0   0:00.00 xinetd             
 2888 ntp       16   0 18632 5368 4224 S  0.0  0.3   0:00.01 ntpd               
 2898 root      16   0  4252  528  444 S  0.0  0.0   0:00.00 gpm                
 2908 root      16   0 57120 1188  740 S  0.0  0.1   0:00.00 crond              
 2931 xfs       18   0 10320 1712  772 S  0.0  0.1   0:00.02 xfs                
 2941 root      35  19  2604  648  536 S  0.0  0.0   0:00.00 anacron            
 2950 root      16   0  9032  808  648 S  0.0  0.0   0:00.00 atd                
 2960 dbus      16   0  9760 1232 1060 S  0.0  0.1   0:00.17 dbus-daemon-1      
 3020 root      17   0 27632 1312 1004 S  0.0  0.1   0:00.01 login              
 3021 root      16   0 27636 1316 1004 S  0.0  0.1   0:00.00 login              
 3022 root      16   0 27632 1312 1004 S  0.0  0.1   0:00.00 login              
 3023 root      16   0 27632 1312 1004 S  0.0  0.1   0:00.01 login              
 3024 root      18   0  2600  412  344 S  0.0  0.0   0:00.00 mingetty           
 3025 root      18   0  2600  416  344 S  0.0  0.0   0:00.00 mingetty           
 3521 root      16   0 54040 1620 1192 S  0.0  0.1   0:00.03 bash               
 3571 root      17   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_2          
 3572 root      18   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_3          
 3573 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_4          
 3574 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_5          
 3575 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_6          
 3576 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_7          
 3577 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_8          
 3578 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_9          
 3975 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_10         
 3976 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_11         
 3977 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_12         
 3979 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_13         
 3980 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_14         
 3981 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_15         
 3982 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_16         
 3983 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_17         
 4727 root      15   0 54040 1616 1192 S  0.0  0.1   0:00.03 bash               
 5397 root      16   0 53800  572  472 S  0.0  0.0   0:00.21 tail               
 6355 root      15   0 54044 1620 1192 S  0.0  0.1   0:00.03 bash               
 9305 root      16   0  6212  976  744 R  0.0  0.0   0:00.16 top                
 9581 root      15   0 54040 1616 1192 S  0.0  0.1   0:00.03 bash               
10572 root      16   0  6212  992  760 S  0.0  0.0   0:00.08 top                


top - 11:27:18 up 9 min,  4 users,  load average: 0.99, 0.71, 0.33
Tasks:  91 total,   2 running,  89 sleeping,   0 stopped,   0 zombie
Cpu(s): 21.0% us,  4.7% sy,  0.0% ni, 69.6% id,  4.8% wa,  0.0% hi,  0.0% si
Mem:   2055388k total,  2033760k used,    21628k free,     6468k buffers
Swap:  4192956k total,        0k used,  4192956k free,    82476k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND            
 4550 root      23   0 1886m 1.8g  48m R 96.9 93.7   4:54.22 lvm                
  203 root      15   0     0    0    0 S  1.0  0.0   0:00.03 kswapd0            
    1 root      16   0  4820  560  464 S  0.3  0.0   0:01.24 init               
 9305 root      16   0  6212  976  744 R  0.3  0.0   0:00.17 top                
10572 root      16   0  6212  992  760 S  0.3  0.0   0:00.09 top                
    2 root      RT   0     0    0    0 S  0.0  0.0   0:00.01 migration/0        
    3 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd/0        
    4 root      RT   0     0    0    0 S  0.0  0.0   0:00.01 migration/1        
    5 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd/1        
    6 root      RT   0     0    0    0 S  0.0  0.0   0:00.00 migration/2        
    7 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd/2        
    8 root      RT   0     0    0    0 S  0.0  0.0   0:00.00 migration/3        
    9 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd/3        
   10 root      10  -5     0    0    0 S  0.0  0.0   0:00.01 events/0           
   11 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 events/1           
   12 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 events/2           
   13 root      10  -5     0    0    0 S  0.0  0.0   0:00.01 events/3           
   14 root      10  -5     0    0    0 S  0.0  0.0   0:00.05 khelper            
   15 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kthread            
   21 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kacpid             
  123 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/0          
  124 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/1          
  125 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/2          
  126 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/3          
  201 root      15   0     0    0    0 S  0.0  0.0   0:00.00 pdflush            
  202 root      15   0     0    0    0 S  0.0  0.0   0:00.00 pdflush            
  204 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 aio/0              
  205 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 aio/1              
  206 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 aio/2              
  207 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 aio/3              
  282 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kseriod            
  344 root      16   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_0          
  345 root      15   0     0    0    0 S  0.0  0.0   0:00.00 ahd_dv_0           
  347 root      16   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_1          
  348 root      15   0     0    0    0 S  0.0  0.0   0:00.00 ahd_dv_1           
  361 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kcryptd/0          
  362 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kcryptd/1          
  363 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kcryptd/2          
  364 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kcryptd/3          
  365 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kmpathd/0          
  366 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kmpathd/1          
  367 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kmpathd/2          
  368 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kmpathd/3          
  369 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kmirrord           
  389 root      15   0     0    0    0 S  0.0  0.0   0:00.23 kjournald          
 1220 root      10  -5  3680  456  368 S  0.0  0.0   0:00.17 udevd              
 1343 root      19   0     0    0    0 S  0.0  0.0   0:00.00 shpchpd_event      
 1456 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kauditd            
 1605 root      19   0     0    0    0 S  0.0  0.0   0:00.00 kjournald          
 2613 root      16   0  4500 1284  772 S  0.0  0.1   0:00.00 dhclient           
 2653 root      16   0  3696  620  504 S  0.0  0.0   0:00.04 syslogd            
 2657 root      16   0  2612  496  412 S  0.0  0.0   0:00.00 klogd              
 2668 root      16   0  2628  524  416 S  0.0  0.0   0:00.01 irqbalance         
 2796 root      18   0  2920  868  616 S  0.0  0.0   0:00.00 smartd             
 2806 root      19   0  2608  552  464 S  0.0  0.0   0:00.00 acpid              
 2854 root      15   0 22020 2088 1640 S  0.0  0.1   0:00.03 sshd               
 2869 root      15   0  8784  880  708 S  0.0  0.0   0:00.00 xinetd             
 2888 ntp       16   0 18632 5368 4224 S  0.0  0.3   0:00.01 ntpd               
 2898 root      16   0  4252  528  444 S  0.0  0.0   0:00.00 gpm                
 2908 root      16   0 57120 1188  740 S  0.0  0.1   0:00.00 crond              
 2931 xfs       18   0 10320 1712  772 S  0.0  0.1   0:00.02 xfs                
 2941 root      35  19  2604  648  536 S  0.0  0.0   0:00.00 anacron            
 2950 root      16   0  9032  808  648 S  0.0  0.0   0:00.00 atd                
 2960 dbus      16   0  9760 1232 1060 S  0.0  0.1   0:00.17 dbus-daemon-1      
 3020 root      17   0 27632 1312 1004 S  0.0  0.1   0:00.01 login              
 3021 root      16   0 27636 1316 1004 S  0.0  0.1   0:00.00 login              
 3022 root      16   0 27632 1312 1004 S  0.0  0.1   0:00.00 login              
 3023 root      16   0 27632 1312 1004 S  0.0  0.1   0:00.01 login              
 3024 root      18   0  2600  412  344 S  0.0  0.0   0:00.00 mingetty           
 3025 root      18   0  2600  416  344 S  0.0  0.0   0:00.00 mingetty           
 3521 root      16   0 54040 1620 1192 S  0.0  0.1   0:00.03 bash               
 3571 root      17   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_2          
 3572 root      18   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_3          
 3573 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_4          
 3574 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_5          
 3575 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_6          
 3576 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_7          
 3577 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_8          
 3578 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_9          
 3975 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_10         
 3976 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_11         
 3977 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_12         
 3979 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_13         
 3980 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_14         
 3981 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_15         
 3982 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_16         
 3983 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_17         
 4727 root      15   0 54040 1616 1192 S  0.0  0.1   0:00.03 bash               
 5397 root      16   0 53800  572  472 S  0.0  0.0   0:00.21 tail               
 6355 root      15   0 54044 1620 1192 S  0.0  0.1   0:00.03 bash               
 9581 root      15   0 54040 1616 1192 S  0.0  0.1   0:00.03 bash               


top - 11:27:21 up 10 min,  4 users,  load average: 0.99, 0.71, 0.34
Tasks:  91 total,   2 running,  89 sleeping,   0 stopped,   0 zombie
Cpu(s): 19.9% us,  6.3% sy,  0.0% ni, 69.6% id,  4.1% wa,  0.1% hi,  0.1% si
Mem:   2055388k total,  2032396k used,    22992k free,     1252k buffers
Swap:  4192956k total,       44k used,  4192912k free,    70580k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND            
 4550 root      22   0 1902m 1.9g  48m R 97.5 94.5   4:57.15 lvm                
  203 root      15   0     0    0    0 S  2.3  0.0   0:00.10 kswapd0            
   14 root      10  -5     0    0    0 S  0.3  0.0   0:00.06 khelper            
 5397 root      16   0 53800  572  472 S  0.3  0.0   0:00.22 tail               
10572 root      16   0  6212  992  760 S  0.3  0.0   0:00.10 top                
    1 root      16   0  4820  560  464 S  0.0  0.0   0:01.24 init               
    2 root      RT   0     0    0    0 S  0.0  0.0   0:00.01 migration/0        
    3 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd/0        
    4 root      RT   0     0    0    0 S  0.0  0.0   0:00.01 migration/1        
    5 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd/1        
    6 root      RT   0     0    0    0 S  0.0  0.0   0:00.00 migration/2        
    7 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd/2        
    8 root      RT   0     0    0    0 S  0.0  0.0   0:00.00 migration/3        
    9 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd/3        
   10 root      10  -5     0    0    0 S  0.0  0.0   0:00.01 events/0           
   11 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 events/1           
   12 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 events/2           
   13 root      10  -5     0    0    0 S  0.0  0.0   0:00.01 events/3           
   15 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kthread            
   21 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kacpid             
  123 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/0          
  124 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/1          
  125 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/2          
  126 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/3          
  201 root      15   0     0    0    0 S  0.0  0.0   0:00.00 pdflush            
  202 root      15   0     0    0    0 S  0.0  0.0   0:00.00 pdflush            
  204 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 aio/0              
  205 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 aio/1              
  206 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 aio/2              
  207 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 aio/3              
  282 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kseriod            
  344 root      16   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_0          
  345 root      15   0     0    0    0 S  0.0  0.0   0:00.00 ahd_dv_0           
  347 root      16   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_1          
  348 root      15   0     0    0    0 S  0.0  0.0   0:00.00 ahd_dv_1           
  361 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kcryptd/0          
  362 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kcryptd/1          
  363 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kcryptd/2          
  364 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kcryptd/3          
  365 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kmpathd/0          
  366 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kmpathd/1          
  367 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kmpathd/2          
  368 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kmpathd/3          
  369 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kmirrord           
  389 root      15   0     0    0    0 S  0.0  0.0   0:00.23 kjournald          
 1220 root      10  -5  3680  456  368 S  0.0  0.0   0:00.17 udevd              
 1343 root      19   0     0    0    0 S  0.0  0.0   0:00.00 shpchpd_event      
 1456 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kauditd            
 1605 root      19   0     0    0    0 S  0.0  0.0   0:00.00 kjournald          
 2613 root      16   0  4500 1212  744 S  0.0  0.1   0:00.00 dhclient           
 2653 root      16   0  3696  620  504 S  0.0  0.0   0:00.04 syslogd            
 2657 root      16   0  2612  496  412 S  0.0  0.0   0:00.00 klogd              
 2668 root      16   0  2628  524  416 S  0.0  0.0   0:00.01 irqbalance         
 2796 root      18   0  2920  868  616 S  0.0  0.0   0:00.00 smartd             
 2806 root      19   0  2608  552  464 S  0.0  0.0   0:00.00 acpid              
 2854 root      15   0 22020 2088 1640 S  0.0  0.1   0:00.03 sshd               
 2869 root      15   0  8784  880  708 S  0.0  0.0   0:00.00 xinetd             
 2888 ntp       16   0 18632 5368 4224 S  0.0  0.3   0:00.01 ntpd               
 2898 root      16   0  4252  528  444 S  0.0  0.0   0:00.00 gpm                
 2908 root      16   0 57120 1188  740 S  0.0  0.1   0:00.00 crond              
 2931 xfs       18   0 10320 1712  772 S  0.0  0.1   0:00.02 xfs                
 2941 root      35  19  2604  648  536 S  0.0  0.0   0:00.00 anacron            
 2950 root      16   0  9032  808  648 S  0.0  0.0   0:00.00 atd                
 2960 dbus      16   0  9760 1232 1060 S  0.0  0.1   0:00.17 dbus-daemon-1      
 3020 root      17   0 27632 1312 1004 S  0.0  0.1   0:00.01 login              
 3021 root      16   0 27636 1316 1004 S  0.0  0.1   0:00.00 login              
 3022 root      16   0 27632 1312 1004 S  0.0  0.1   0:00.00 login              
 3023 root      16   0 27632 1312 1004 S  0.0  0.1   0:00.01 login              
 3024 root      18   0  2600  412  344 S  0.0  0.0   0:00.00 mingetty           
 3025 root      18   0  2600  416  344 S  0.0  0.0   0:00.00 mingetty           
 3521 root      16   0 54040 1620 1192 S  0.0  0.1   0:00.03 bash               
 3571 root      17   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_2          
 3572 root      18   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_3          
 3573 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_4          
 3574 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_5          
 3575 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_6          
 3576 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_7          
 3577 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_8          
 3578 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_9          
 3975 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_10         
 3976 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_11         
 3977 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_12         
 3979 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_13         
 3980 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_14         
 3981 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_15         
 3982 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_16         
 3983 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_17         
 4727 root      15   0 54040 1616 1192 S  0.0  0.1   0:00.03 bash               
 6355 root      15   0 54044 1620 1192 S  0.0  0.1   0:00.03 bash               
 9305 root      16   0  6212  976  744 R  0.0  0.0   0:00.17 top                
 9581 root      15   0 54040 1616 1192 S  0.0  0.1   0:00.03 bash               


top - 11:27:24 up 10 min,  4 users,  load average: 0.99, 0.71, 0.34
Tasks:  91 total,   1 running,  90 sleeping,   0 stopped,   0 zombie
Cpu(s): 18.7% us,  5.9% sy,  0.0% ni, 67.3% id,  8.0% wa,  0.0% hi,  0.0% si
Mem:   2055388k total,  2041136k used,    14252k free,      192k buffers
Swap:  4192956k total,     2304k used,  4190652k free,    58236k cached

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND            
 4550 root      18   0 1927m 1.9g  48m D 94.9 95.6   5:00.00 lvm                
  203 root      15   0     0    0    0 D  3.3  0.0   0:00.20 kswapd0            
 9305 root      17   0  6212  968  736 R  1.0  0.0   0:00.20 top                
   13 root      10  -5     0    0    0 S  0.3  0.0   0:00.02 events/3           
    1 root      16   0  4820  464  440 S  0.0  0.0   0:01.24 init               
    2 root      RT   0     0    0    0 S  0.0  0.0   0:00.01 migration/0        
    3 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd/0        
    4 root      RT   0     0    0    0 S  0.0  0.0   0:00.01 migration/1        
    5 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd/1        
    6 root      RT   0     0    0    0 S  0.0  0.0   0:00.00 migration/2        
    7 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd/2        
    8 root      RT   0     0    0    0 S  0.0  0.0   0:00.00 migration/3        
    9 root      34  19     0    0    0 S  0.0  0.0   0:00.00 ksoftirqd/3        
   10 root      10  -5     0    0    0 S  0.0  0.0   0:00.01 events/0           
   11 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 events/1           
   12 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 events/2           
   14 root      10  -5     0    0    0 S  0.0  0.0   0:00.06 khelper            
   15 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kthread            
   21 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kacpid             
  123 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/0          
  124 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/1          
  125 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/2          
  126 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kblockd/3          
  201 root      15   0     0    0    0 S  0.0  0.0   0:00.00 pdflush            
  202 root      15   0     0    0    0 S  0.0  0.0   0:00.00 pdflush            
  204 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 aio/0              
  205 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 aio/1              
  206 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 aio/2              
  207 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 aio/3              
  282 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kseriod            
  344 root      16   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_0          
  345 root      15   0     0    0    0 S  0.0  0.0   0:00.00 ahd_dv_0           
  347 root      16   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_1          
  348 root      15   0     0    0    0 S  0.0  0.0   0:00.00 ahd_dv_1           
  361 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kcryptd/0          
  362 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kcryptd/1          
  363 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kcryptd/2          
  364 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kcryptd/3          
  365 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kmpathd/0          
  366 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kmpathd/1          
  367 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kmpathd/2          
  368 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kmpathd/3          
  369 root      10  -5     0    0    0 S  0.0  0.0   0:00.00 kmirrord           
  389 root      15   0     0    0    0 S  0.0  0.0   0:00.23 kjournald          
 1220 root      10  -5  3680  412  364 S  0.0  0.0   0:00.17 udevd              
 1343 root      19   0     0    0    0 S  0.0  0.0   0:00.00 shpchpd_event      
 1456 root      11  -5     0    0    0 S  0.0  0.0   0:00.00 kauditd            
 1605 root      19   0     0    0    0 S  0.0  0.0   0:00.00 kjournald          
 2613 root      16   0  4500  472  472 S  0.0  0.0   0:00.00 dhclient           
 2653 root      16   0  3696  472  472 S  0.0  0.0   0:00.04 syslogd            
 2657 root      16   0  2612  392  392 S  0.0  0.0   0:00.00 klogd              
 2668 root      16   0  2628  484  412 S  0.0  0.0   0:00.01 irqbalance         
 2796 root      18   0  2920  484  484 S  0.0  0.0   0:00.00 smartd             
 2806 root      19   0  2608  448  448 S  0.0  0.0   0:00.00 acpid              
 2854 root      15   0 22020  604  604 S  0.0  0.0   0:00.03 sshd               
 2869 root      15   0  8784  552  552 S  0.0  0.0   0:00.00 xinetd             
 2888 ntp       16   0 18632 5368 4224 S  0.0  0.3   0:00.01 ntpd               
 2898 root      16   0  4252  516  444 S  0.0  0.0   0:00.00 gpm                
 2908 root      16   0 57120 1072  668 S  0.0  0.1   0:00.00 crond              
 2931 xfs       18   0 10320 1708  772 S  0.0  0.1   0:00.02 xfs                
 2941 root      35  19  2604  648  536 S  0.0  0.0   0:00.00 anacron            
 2950 root      16   0  9032  676  576 S  0.0  0.0   0:00.00 atd                
 2960 dbus      16   0  9760 1084  948 S  0.0  0.1   0:00.17 dbus-daemon-1      
 3020 root      17   0 27632 1212  904 S  0.0  0.1   0:00.01 login              
 3021 root      16   0 27636 1216  904 S  0.0  0.1   0:00.00 login              
 3022 root      16   0 27632 1212  904 S  0.0  0.1   0:00.00 login              
 3023 root      16   0 27632 1212  904 S  0.0  0.1   0:00.01 login              
 3024 root      18   0  2600  412  344 S  0.0  0.0   0:00.00 mingetty           
 3025 root      18   0  2600  416  344 S  0.0  0.0   0:00.00 mingetty           
 3521 root      16   0 54040 1616 1188 S  0.0  0.1   0:00.03 bash               
 3571 root      17   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_2          
 3572 root      18   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_3          
 3573 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_4          
 3574 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_5          
 3575 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_6          
 3576 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_7          
 3577 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_8          
 3578 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_9          
 3975 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_10         
 3976 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_11         
 3977 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_12         
 3979 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_13         
 3980 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_14         
 3981 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_15         
 3982 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_16         
 3983 root      19   0     0    0    0 S  0.0  0.0   0:00.00 scsi_eh_17         
 4727 root      15   0 54040 1612 1188 S  0.0  0.1   0:00.03 bash               
 5397 root      16   0 53800  516  416 S  0.0  0.0   0:00.22 tail               
 6355 root      15   0 54044 1616 1188 S  0.0  0.1   0:00.03 bash               
 9581 root      15   0 54040 1612 1188 S  0.0  0.1   0:00.03 bash               
10572 root      16   0  6212  984  752 S  0.0  0.0   0:00.10 top                

--=-qbH4xMbjadv82KMnYf1B
Content-Disposition: attachment; filename=vgscanlog
Content-Type: text/plain; name=vgscanlog; charset=utf-8
Content-Transfer-Encoding: 7bit


#mm/memlock.c:118       Unlocking memory
#mm/memlock.c:137         memlock_count dec to 0
#activate/fs.c:171       Linking /dev/vg1/v676 -> /dev/mapper/vg1-v676
#locking/file_locking.c:245         Locking LV 8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCezkCi0wgOPSHTHZbalc5R7a2iAVL0LRT2 (R)
#metadata/metadata.c:1171       Finding volume group for uuid 8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCezkCi0wgOPSHTHZbalc5R7a2iAVL0LRT2
#label/label.c:167       /dev/md0: lvm2 label detected
#label/label.c:167       /dev/md1: lvm2 label detected
#label/label.c:167       /dev/md0: lvm2 label detected
#label/label.c:167       /dev/md1: lvm2 label detected
#format_text/format-text.c:320         Read vg1 metadata (3001) from /dev/md0 at 272384 size 706783
#label/label.c:167       /dev/md0: lvm2 label detected
#label/label.c:167       /dev/md1: lvm2 label detected
#format_text/format-text.c:320         Read vg1 metadata (3001) from /dev/md1 at 272384 size 706783
#metadata/metadata.c:1177     Found volume group "vg1"
#activate/activate.c:359         Getting device info for vg1-v677
#ioctl/libdm-iface.c:1450         dm info  LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCezkCi0wgOPSHTHZbalc5R7a2iAVL0LRT2 N   [16384]
#ioctl/libdm-iface.c:1450         dm info  8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCezkCi0wgOPSHTHZbalc5R7a2iAVL0LRT2 N   [16384]
#ioctl/libdm-iface.c:1450         dm info vg1-v677  N   [16384]
#mm/memlock.c:99       Locking memory
#mm/memlock.c:130         memlock_count inc to 1
#activate/dev_manager.c:588         Getting device info for vg1-v677 [LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCezkCi0wgOPSHTHZbalc5R7a2iAVL0LRT2]
#ioctl/libdm-iface.c:1450         dm info  LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCezkCi0wgOPSHTHZbalc5R7a2iAVL0LRT2 O   [16384]
#ioctl/libdm-iface.c:1450         dm info  8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCezkCi0wgOPSHTHZbalc5R7a2iAVL0LRT2 O   [16384]
#ioctl/libdm-iface.c:1450         dm info vg1-v677  O   [16384]
#activate/dev_manager.c:588         Getting device info for vg1-v677-real [LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCezkCi0wgOPSHTHZbalc5R7a2iAVL0LRT2-real]
#ioctl/libdm-iface.c:1450         dm info  LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCezkCi0wgOPSHTHZbalc5R7a2iAVL0LRT2-real O   [16384]
#ioctl/libdm-iface.c:1450         dm info  8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCezkCi0wgOPSHTHZbalc5R7a2iAVL0LRT2-real O   [16384]
#ioctl/libdm-iface.c:1450         dm info vg1-v677-real  O   [16384]
#activate/dev_manager.c:588         Getting device info for vg1-v677-cow [LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCezkCi0wgOPSHTHZbalc5R7a2iAVL0LRT2-cow]
#ioctl/libdm-iface.c:1450         dm info  LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCezkCi0wgOPSHTHZbalc5R7a2iAVL0LRT2-cow O   [16384]
#ioctl/libdm-iface.c:1450         dm info  8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCezkCi0wgOPSHTHZbalc5R7a2iAVL0LRT2-cow O   [16384]
#ioctl/libdm-iface.c:1450         dm info vg1-v677-cow  O   [16384]
#libdm-deptree.c:1134     Creating vg1-v677
#ioctl/libdm-iface.c:1450         dm create vg1-v677 LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCezkCi0wgOPSHTHZbalc5R7a2iAVL0LRT2 N   [16384]
#libdm-deptree.c:1352     Loading vg1-v677 table
#libdm-deptree.c:1303         Adding target: 0 2097152 linear 9:0 1417678976
#ioctl/libdm-iface.c:1450         dm table   (253:676) O   [16384]
#ioctl/libdm-iface.c:1450         dm reload   (253:676) N   [16384]
#libdm-deptree.c:877     Resuming vg1-v677 (253:676)
#ioctl/libdm-iface.c:1450         dm resume   (253:676) N   [16384]
#activate/dev_manager.c:588         Getting device info for vg1-v677 [LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCezkCi0wgOPSHTHZbalc5R7a2iAVL0LRT2]
#ioctl/libdm-iface.c:1450         dm info  LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCezkCi0wgOPSHTHZbalc5R7a2iAVL0LRT2 O   [16384]
#ioctl/libdm-iface.c:1450         dm deps   (253:676) O   [16384]
#activate/dev_manager.c:588         Getting device info for vg1-v677-real [LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCezkCi0wgOPSHTHZbalc5R7a2iAVL0LRT2-real]
#ioctl/libdm-iface.c:1450         dm info  LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCezkCi0wgOPSHTHZbalc5R7a2iAVL0LRT2-real O   [16384]
#ioctl/libdm-iface.c:1450         dm info  8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCezkCi0wgOPSHTHZbalc5R7a2iAVL0LRT2-real O   [16384]
#ioctl/libdm-iface.c:1450         dm info vg1-v677-real  O   [16384]
#activate/dev_manager.c:588         Getting device info for vg1-v677-cow [LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCezkCi0wgOPSHTHZbalc5R7a2iAVL0LRT2-cow]
#ioctl/libdm-iface.c:1450         dm info  LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCezkCi0wgOPSHTHZbalc5R7a2iAVL0LRT2-cow O   [16384]
#ioctl/libdm-iface.c:1450         dm info  8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCezkCi0wgOPSHTHZbalc5R7a2iAVL0LRT2-cow O   [16384]
#ioctl/libdm-iface.c:1450         dm info vg1-v677-cow  O   [16384]
#mm/memlock.c:118       Unlocking memory
#mm/memlock.c:137         memlock_count dec to 0
#activate/fs.c:171       Linking /dev/vg1/v677 -> /dev/mapper/vg1-v677
#locking/file_locking.c:245         Locking LV 8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367 (R)
#metadata/metadata.c:1171       Finding volume group for uuid 8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367
#label/label.c:167       /dev/md0: lvm2 label detected
#label/label.c:167       /dev/md1: lvm2 label detected
#label/label.c:167       /dev/md0: lvm2 label detected
#label/label.c:167       /dev/md1: lvm2 label detected
#format_text/format-text.c:320         Read vg1 metadata (3001) from /dev/md0 at 272384 size 706783
#label/label.c:167       /dev/md0: lvm2 label detected
#label/label.c:167       /dev/md1: lvm2 label detected
#format_text/format-text.c:320         Read vg1 metadata (3001) from /dev/md1 at 272384 size 706783
#metadata/metadata.c:1177     Found volume group "vg1"
#activate/activate.c:359         Getting device info for vg1-v678
#ioctl/libdm-iface.c:1450         dm info  LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367 N   [16384]
#ioctl/libdm-iface.c:1450         dm info  8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367 N   [16384]
#ioctl/libdm-iface.c:1450         dm info vg1-v678  N   [16384]
#mm/memlock.c:99       Locking memory
#mm/memlock.c:130         memlock_count inc to 1
#activate/dev_manager.c:588         Getting device info for vg1-v678 [LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367]
#ioctl/libdm-iface.c:1450         dm info  LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367 O   [16384]
#ioctl/libdm-iface.c:1450         dm info  8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367 O   [16384]
#ioctl/libdm-iface.c:1450         dm info vg1-v678  O   [16384]
#activate/dev_manager.c:588         Getting device info for vg1-v678-real [LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367-real]
#ioctl/libdm-iface.c:1450         dm info  LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367-real O   [16384]
#ioctl/libdm-iface.c:1450         dm info  8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367-real O   [16384]
#ioctl/libdm-iface.c:1450         dm info vg1-v678-real  O   [16384]
#activate/dev_manager.c:588         Getting device info for vg1-v678-cow [LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367-cow]
#ioctl/libdm-iface.c:1450         dm info  LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367-cow O   [16384]
#ioctl/libdm-iface.c:1450         dm info  8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367-cow O   [16384]
#ioctl/libdm-iface.c:1450         dm info vg1-v678-cow  O   [16384]
#libdm-deptree.c:1134     Creating vg1-v678
#ioctl/libdm-iface.c:1450         dm create vg1-v678 LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367 N   [16384]
#libdm-deptree.c:1352     Loading vg1-v678 table
#libdm-deptree.c:1303         Adding target: 0 2097152 linear 9:0 1419776128
#ioctl/libdm-iface.c:1450         dm table   (253:677) O   [16384]
#ioctl/libdm-iface.c:1450         dm reload   (253:677) N   [16384]
#libdm-deptree.c:877     Resuming vg1-v678 (253:677)
#ioctl/libdm-iface.c:1450         dm resume   (253:677) N   [16384]
#activate/dev_manager.c:588         Getting device info for vg1-v678 [LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367]
#ioctl/libdm-iface.c:1450         dm info  LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367 O   [16384]
#ioctl/libdm-iface.c:1450         dm deps   (253:677) O   [16384]
#activate/dev_manager.c:588         Getting device info for vg1-v678-real [LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367-real]
#ioctl/libdm-iface.c:1450         dm info  LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367-real O   [16384]
#ioctl/libdm-iface.c:1450         dm info  8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367-real O   [16384]
#ioctl/libdm-iface.c:1450         dm info vg1-v678-real  O   [16384]
#activate/dev_manager.c:588         Getting device info for vg1-v678-cow [LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367-cow]
#ioctl/libdm-iface.c:1450         dm info  LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367-cow O   [16384]
#ioctl/libdm-iface.c:1450         dm info  8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCejSzi1SuM3uO3NWrpDB2Fle5A3Uv6i367-cow O   [16384]
#ioctl/libdm-iface.c:1450         dm info vg1-v678-cow  O   [16384]
#mm/memlock.c:118       Unlocking memory
#mm/memlock.c:137         memlock_count dec to 0
#activate/fs.c:171       Linking /dev/vg1/v678 -> /dev/mapper/vg1-v678
#locking/file_locking.c:245         Locking LV 8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeL0DcqwlzsZSb0p6eIhXnV2uyE8KNAZG2 (R)
#metadata/metadata.c:1171       Finding volume group for uuid 8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeL0DcqwlzsZSb0p6eIhXnV2uyE8KNAZG2
#label/label.c:167       /dev/md0: lvm2 label detected
#label/label.c:167       /dev/md1: lvm2 label detected
#label/label.c:167       /dev/md0: lvm2 label detected
#label/label.c:167       /dev/md1: lvm2 label detected
#format_text/format-text.c:320         Read vg1 metadata (3001) from /dev/md0 at 272384 size 706783
#label/label.c:167       /dev/md0: lvm2 label detected
#label/label.c:167       /dev/md1: lvm2 label detected
#format_text/format-text.c:320         Read vg1 metadata (3001) from /dev/md1 at 272384 size 706783
#metadata/metadata.c:1177     Found volume group "vg1"
#activate/activate.c:359         Getting device info for vg1-v679
#ioctl/libdm-iface.c:1450         dm info  LVM-8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeL0DcqwlzsZSb0p6eIhXnV2uyE8KNAZG2 N   [16384]
#ioctl/libdm-iface.c:1450         dm info  8ZZaL55BvKV1b8qj3z60KZBVJOrnHyCeL0DcqwlzsZSb0p6eIhXnV2uyE8KNAZG2 N   [16384]
#ioctl/libdm-iface.c:1450         dm info vg1-v679  N   [16384]
#mm/memlock.c:99       Locking memory

--=-qbH4xMbjadv82KMnYf1B--
