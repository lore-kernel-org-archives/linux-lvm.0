Return-Path: <plamb_98@yahoo.com>
Message-ID: <20010726142610.72085.qmail@web13403.mail.yahoo.com>
Date: Thu, 26 Jul 2001 07:26:10 -0700 (PDT)
From: Pierre Lamb <plamb_98@yahoo.com>
Subject: Re: [linux-lvm] LVM Bug, or Human Incompetence?
In-Reply-To: <20010726072115.A19419@paranoid.dyn.dhs.org>
MIME-Version: 1.0
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

Why are my linux-lvm@sistina.com e-mail getting sent
back to me as underliverable from somewhere in .br

Pierre
--- Mark Glines <paranoid-lvm@tweet.paranoid.dhs.org>
wrote:
> 
> Hi!  I seem to have found a reproducable way to
> break LVM.  I'm not sure if
> its a bug or simply operator error, so I figured
> make up a transscript and
> let you decide.  The transscript isn't very exciting
> until the vgextend
> part...
> 
> This is on my desktop machine, which I'm willing to
> temporarily break for
> debugging purposes, if needed.
> 
> 
> # cat /proc/lvm/global
> LVM module version 0.9.1_beta2 (18/01/2001)
> 
> Total:  1 VG  1 PV  3 LVs (3 LVs open 3 times)
> 
> Global: 102973 bytes malloced   IOP version: 10  
> 0:04:17 active
> 
> VG:  tweet  [1 PV, 3 LV/3 open]  PE Size: 4096 KB
>   Usage [KB/PE]: 39079936 /9541 total  25165824
> /6144 used  13914112 /3397 free
>   PV:  [AA] hdb                   39079936 /9541   
> 25165824 /6144    13914112 /3397
>     LVs: [AWDL  ] music                     20971520
> /5120     1x open
>          [AWDL  ] home                       2097152
> /512      1x open
>          [AWDL  ] usr                        2097152
> /512      1x open
> # mount
> /dev/hda3 on / type reiserfs (rw)
> proc on /proc type proc (rw)
> devpts on /dev/pts type devpts (rw,gid=5,mode=620)
> /dev/hda1 on /boot type reiserfs (rw,notail)
> /dev/tweet/usr on /usr type reiserfs (rw)
> /dev/tweet/home on /home type reiserfs (rw)
> /dev/tweet/music on /music type reiserfs (rw)
> # df
> Filesystem            Size  Used Avail Use% Mounted
> on
> /dev/hda3             1.4G  259M  1.1G  19% /
> /dev/hda1              47M   37M   10M  78% /boot
> /dev/tweet/usr        2.0G  1.1G  949M  54% /usr
> /dev/tweet/home       2.0G  875M  1.1G  43% /home
> /dev/tweet/music       20G   17G  3.7G  82% /music
> # dmesg | grep hda
>     ide0: BM-DMA at 0xd000-0xd007, BIOS settings:
> hda:DMA, hdb:pio
> hda: Maxtor 52049U4, ATA DISK drive
> hda: 40020624 sectors (20491 MB) w/2048KiB Cache,
> CHS=2491/255/63, UDMA(33)
>  hda: hda1 hda2 hda3 hda4
> # cfdisk
>                                                     
>        cfdisk 2.11g
> 
>                                                     
>    Disk Drive: /dev/hda
>                                                     
>  Size: 20490559488 bytes
>                                         Heads: 255  
> Sectors per Track: 63   Cylinders: 2491
> 
>       Name                Flags              Part
> Type        FS Type                     [Label]     
>             Size (MB)
> 
>
----------------------------------------------------------------------------------------------------------------------------------
>       hda1                Boot               
> Primary         Linux                               
>                     49.36
>       hda4                                   
> Primary         Linux swap                          
>                    164.51
>       hda3                                   
> Primary         Linux                               
>                   1497.01
>       hda2                                   
> Primary         Linux LVM                           
>                  18778.32
> ...
> # vgscan -v
> vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
> vgscan -- reading all physical volumes (this may
> take a while...)
> vgscan -- scanning for all active volume group(s)
> first
> vgscan -- found active volume group "tweet"
> vgscan -- reading data of volume group "tweet" from
> physical volume(s)
> vgscan -- inserting "tweet" into lvmtab
> vgscan -- backing up volume group "tweet"
> vgscan -- checking volume group name "tweet"
> vgscan -- checking volume group consistency of
> "tweet"
> vgscan -- checking existence of "/etc/lvmtab.d"
> vgscan -- making directory "/etc/lvmtab.d"
> vgscan -- storing volume group data of "tweet" in
> "/etc/lvmtab.d/tweet.tmp"
> vgscan -- storing physical volume data of "tweet" in
> "/etc/lvmtab.d/tweet.tmp"
> vgscan -- storing logical volume data of volume
> group "tweet" in "/etc/lvmtab.d/tweet.tmp"
> vgscan -- renaming "/etc/lvmtab.d/tweet.tmp" to
> "/etc/lvmtab.d/tweet"
> vgscan -- removing special files and directory for
> volume group "tweet"
> vgscan -- creating directory and group character
> special file for "tweet"
> vgscan -- creating block device special files for
> tweet
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d"
> successfully created
> vgscan -- WARNING: you may not have an actual VGDA
> backup of your volume group
> 
> # pvscan -v
> pvscan -- reading all physical volumes (this may
> take a while...)
> pvscan -- walking through all physical volumes found
> pvscan -- ACTIVE   PV "/dev/hdb" of VG "tweet"
> [37.27 GB / 13.27 GB free]
> pvscan -- total: 1 [37.27 GB] / in use: 1 [37.27 GB]
> / in no VG: 0 [0]
> 
> # pvcreate -v /dev/hda2
> pvcreate -- locking logical volume manager
> pvcreate -- checking physical volume name
> "/dev/hda2"
> pvcreate -- getting physical volume size
> pvcreate -- checking partition type
> pvcreate -- creating new physical volume
> pvcreate -- setting up physical volume for /dev/hda2
> with 36676395 sectors
> pvcreate -- writing physical volume data to disk
> "/dev/hda2"
> pvcreate -- physical volume "/dev/hda2" successfully
> created
> pvcreate -- unlocking logical volume manager
> 
> # pvscan -v
> pvscan -- reading all physical volumes (this may
> take a while...)
> pvscan -- walking through all physical volumes found
> pvscan -- inactive PV "/dev/hda2" is in no VG 
> [17.49 GB]
> pvscan -- ACTIVE   PV "/dev/hdb"  of VG "tweet"
> [37.27 GB / 13.27 GB free]
> pvscan -- total: 2 [54.76 GB] / in use: 1 [37.27 GB]
> / in no VG: 1 [17.49 GB]
> 
> # vgextend tweet /dev/hda2
> vgextend -- INFO: maximum logical volume size is
> 255.99 Gigabyte
> vgextend -- doing automatic backup of volume group
> "tweet"
> vgextend -- volume group "tweet" successfully
> extended
> 
> # vgscan -v
> vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
> vgscan -- reading all physical volumes (this may
> take a while...)
> vgscan -- scanning for all active volume group(s)
> first
> vgscan -- found active volume group "tweet"
> vgscan -- reading data of volume group "tweet" from
> physical volume(s)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated
> LE of LV" can't get data of volume group "tweet"
> from physical volume(s)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated
> LE of LV" creating "/etc/lvmtab" and "/etc/lvmtab.d"
> 
> # pvscan -v
> pvscan -- reading all physical volumes (this may
> take a while...)
> pvscan -- walking through all physical volumes found
> pvscan -- ACTIVE   PV "/dev/hda2"  is associated to
> an unknown VG (run vgscan)
> pvscan -- ACTIVE   PV "/dev/hdb"   is associated to
> an unknown VG (run vgscan)
> pvscan -- total: 2 [54.76 GB] / in use: 2 [54.76 GB]
> / in no VG: 0 [0]
> 
> 
> 
> 
> 
> 
> 
> Note that the system is still useable at this
> point... the kernel LVM is fine,
> but none of the userland tools can find their asses
> (this includes receiving
> periodic lvmsadc crontab mouth-frothings about the
> kernel and /etc/lvmtab DB
> mismatch).  After a reboot, however, vgscan still
> can't find its ass and
> everything fails, taking most of the machine's
> overall competence with it 
> (obvious due to lack of /usr).  After a reboot, a
> sequence like the following
> is necessary to bring it back:
> 
> cd /etc/lvmconf
> mv tweet.conf.1.old tweet.conf
> vgcfgrestore -v -n tweet /dev/hdb
> vgscan
> /etc/init.d/lvm restart
> mount /usr
> mount /home
> mount /music
> *start various services manually, reboot, or switch
> init runlvls*
> 
> 
> 
> I'm running stock linux 2.4.6 LVM built as a module,
> with the debian sid "lvm10"
> package userland utilities (debian package version
> 0.9-1.2).
> 
> hda2 used to be a DOS "extended" partition,
> containing 3 logical drives.  All 3
> of these have been migrated successfully to LV's
> (the VG using hdb as sole PV).
> That leaves me (after a bit of cfdisking) with one
> free partition taking up 80%
> of hda.  I'd love to use this partition as a PV and
> chuck it into the VG, but
> it doesn't seem to work, as I've documented above.
> 
> Am I doing something wrong?  How outdated is the LVM
> code in stock 2.4.6?  If this
> isn't my fault, is this likely to be a kernel bug or
> userland bug?  Would a redo
> of the transscript, using -d instead of (or in
> addition to) -v, be useful?
> 
> If there's any more info I can provide, please feel
> free to ask.
> 
> -- 
> #!/usr/bin/perl
> my($r)=shift; die "Usage: $0 perlregex [file(s)]\n"
> if!defined($r);@ARGV="."if(!@ARGV);while($_=shift){
> @F=`find $_ -type f`;chomp@F;for$f(@F){open(I,$f)or
> next;while(<I>){print"$f:$.:$_" if/$r/;}close(I);}}
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at
http://www.sistina.com/lvm/Pages/howto.html


__________________________________________________
Do You Yahoo!?
Make international calls for as low as $.04/minute with Yahoo! Messenger
http://phonecard.yahoo.com/
