Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8SL72r20767
	for <linux-lvm@redhat.com>; Tue, 28 Sep 2004 17:07:02 -0400
Received: from mwinf0904.wanadoo.fr (smtp9.wanadoo.fr [193.252.22.22])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8SL71si021720
	for <linux-lvm@redhat.com>; Tue, 28 Sep 2004 17:07:01 -0400
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf0904.wanadoo.fr (SMTP Server) with SMTP id 55F2918000BC
	for <linux-lvm@redhat.com>; Tue, 28 Sep 2004 23:02:52 +0200 (CEST)
Received: from [192.168.0.35] (AVelizy-151-1-12-21.w82-120.abo.wanadoo.fr
	[82.120.154.21])
	by mwinf0904.wanadoo.fr (SMTP Server) with ESMTP id C39891800089
	for <linux-lvm@redhat.com>; Tue, 28 Sep 2004 23:02:51 +0200 (CEST)
Subject: Re: [linux-lvm] Problem at boot time with Mandrake 10.1 community
From: Pascal Garcia dld <dld.pascal.garcia@wanadoo.fr>
In-Reply-To: <20040925204004.GC7387@percy.comedia.it>
References: <1096118366.3170.64.camel@localhost>
	<20040925204004.GC7387@percy.comedia.it>
Message-Id: <1096405614.3150.29.camel@localhost>
Mime-Version: 1.0
Date: Tue, 28 Sep 2004 23:06:54 +0200
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Le sam 25/09/2004 � 22:40, Luca Berra a �crit :
> On Sat, Sep 25, 2004 at 03:19:26PM +0200, Pascal Garcia dld wrote:
> >Hello,
> >here is my problem :
> >I installed on a test disk the new version of Mandrake, kernel
> >2.6.8.1mdk.
> >I have one partition, unique element of a VG named rootvg.
> >On the vg I created 2 reiserfs partitions one for / and one for /home,
> >and a swap partition.
> >
> >No problem with the installation as long as I create the vg or use an
> >existing vg. (In an other mail, I will detail the problem entcountered
> >when freeing a vg during installation process).
> >
> >When booting, I can select the kernel I want with lilo and then, in the
> >list of messages 2 concerning the vg, saying approximately :
> >- The lv is not available
> >- The lv is not complete and mounted read only.
> >
> >Then a kernel panic occurs.
> >
> go to http://qa.mandrakesoft.com/ and file a bug against mkinitrd
> but please, do remember that "approximately" won't help, i would need to
> know exactly what you read on your screen and more details about your
> configuration to fix this in a timely manner.
> 
> regards,
> L.
> 
> btw it does not write that "The lv is not complete and mounted read
> only.", it writes "Partial mode. Incomplete volume groups will be
> activated read-only." and that is normal.
> 
> 
Hello,
I reinstalled the same configuration and wrote everything down. This is
a bit heavy, because I extract the original disk from my laptop and put
a test disk instead. When tested, back to the originale configuration.

Note that I need for installation to pass the option noauto orelse the
installation process hangs at some point. That was the same with
Mandrake 10.0 that is working, and also with Mandrake 10.1 with no lvm
used and that is then working also.

Here are the messages at the end of the boot process. If more is needed
let me know.


...
Starting udev
Making device-mapper control mode
Scanning logical volumes
  Partial mode. Incomplete Volume groups will be activated read-only.
  Reading all physical volumes. This may take a while ...
  No volume groups found
Activating logical volumes
  Partial mode. Incomplete Volume groups will be activated read-only.
  No volume groups found
Making device nodes  
  No volume groups found
Mounting root file system with flags notail, noatime
  Mount: error 2 mounting reiserfs flags notail
Well, retying without option flags
  Mount: error 2 mounting reiserfs
Well, retying read-only without any flags
  Mount: error 2 mounting reiserfs
Pivotroot: pivot_root (/sysroot, /sysroot/initrd) failed: 2
mount /initrd/sys failled: 2
mount /initrd/proc failled: 2
initrd finished
Freeing unused kernel memory 200k freed
Kernel panic : no init found. Try passing init= option to kernel.

My configuration is :
Portable Acer 1357LMI, 512Mo, AMD athom XP m 3000+ (here the lspci on
makdeake 10.0 if it can help but I do not think :
00:00.0 Host bridge: VIA Technologies, Inc.: Unknown device 3205
00:01.0 PCI bridge: VIA Technologies, Inc. VT8235 PCI Bridge
00:07.0 CardBus bridge: Texas Instruments PCI1410 PC card Cardbus
Controller (rev 02)
00:08.0 FireWire (IEEE 1394): Texas Instruments TSB43AB21
IEEE-1394a-2000 Controller (PHY/Link)
00:09.0 Ethernet controller: Realtek Semiconductor Co., Ltd.: Unknown
device 8180 (rev 20)
00:10.0 USB Controller: VIA Technologies, Inc. USB (rev 80)
00:10.1 USB Controller: VIA Technologies, Inc. USB (rev 80)
00:10.2 USB Controller: VIA Technologies, Inc. USB (rev 80)
00:10.3 USB Controller: VIA Technologies, Inc. USB 2.0 (rev 82)
00:11.0 ISA bridge: VIA Technologies, Inc. VT8235 ISA Bridge
00:11.1 IDE interface: VIA Technologies, Inc.
VT82C586A/B/VT82C686/A/B/VT8233/A/C/VT8235 PIPC Bus Master IDE (rev 06)
00:11.5 Multimedia audio controller: VIA Technologies, Inc.
VT8233/A/8235 AC97 Audio Controller (rev 50)
00:11.6 Communication controller: VIA Technologies, Inc. Intel 537 [AC97
Modem] (rev 80)
00:12.0 Ethernet controller: VIA Technologies, Inc. VT6102 [Rhine-II]
(rev 74)
01:00.0 VGA compatible controller: ATI Technologies Inc: Unknown device
5c61 (rev 01)

Disk configuration :
Normally (the configuration actually working with mandrake 10.0, kernel
2.6.3.16mdk) a 60 gb with 1 LVM partition par of VG names rootvg, on
with 3 partitions :
/ reiserfs
swap
/home reiserfs.

For tests � 5 gb disk on which I created as my working disk :
1 LVM partition par of VG names rootvg, on with 3 partitions :
/ reiserfs
swap
/home reiserfs.


I hope I did not make to many mistakes.

Thanks and regards

I Will report that to Mandrake.

Regards

Pascal Garcia
