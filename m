Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nBAGjIlh018431
	for <linux-lvm@redhat.com>; Thu, 10 Dec 2009 11:45:18 -0500
Received: from mail-px0-f193.google.com (mail-px0-f193.google.com
	[209.85.216.193])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nBAGj6X2014650
	for <linux-lvm@redhat.com>; Thu, 10 Dec 2009 11:45:07 -0500
Received: by pxi31 with SMTP id 31so27616pxi.6
	for <linux-lvm@redhat.com>; Thu, 10 Dec 2009 08:45:06 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 10 Dec 2009 17:45:06 +0100
Message-ID: <691e2b620912100845t435d0730ifb8bf13bae4d6b7d@mail.gmail.com>
Subject: Re: Re: [linux-lvm] Re: Re: Problems with dissapearing PV when 
	mounting (Stuart D. Gathman)
From: Johan Gardell <gardin@gmail.com>
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

The output from
dmsetup table
  gardin-swap_1:
  gardin-root:
  Dreamhack-dreamhacklv: 0 2636726272 linear 8:34 384

dmsetup ls
  gardin-swap_1	(254, 2)
  gardin-root	(254, 1)
  Dreamhack-dreamhacklv	(254, 0)

Thanks!
Johan

2009/12/10  <linux-lvm-request@redhat.com>:
> Send linux-lvm mailing list submissions to
> � � � �linux-lvm@redhat.com
>
> To subscribe or unsubscribe via the World Wide Web, visit
> � � � �https://www.redhat.com/mailman/listinfo/linux-lvm
> or, via email, send a message with subject or body 'help' to
> � � � �linux-lvm-request@redhat.com
>
> You can reach the person managing the list at
> � � � �linux-lvm-owner@redhat.com
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of linux-lvm digest..."
>
>
> Today's Topics:
>
> � 1. Re: Re: Re: Problems with dissapearing PV when mounting
> � � �(Stuart D. Gathman) (Stuart D. Gathman)
> � 2. Re: Re: Re: Problems with dissapearing PV when � �mounting
> � � �(Stuart D. Gathman) (malahal@us.ibm.com)
> � 3. Re: kernel panic on lvcreate (Christopher Hawkins)
> � 4. lvm striped VG and Extend and Reallocation Question
> � � �(Vahri? Muhtaryan)
> � 5. Re: kernel panic on lvcreate (Milan Broz)
> � 6. Re: kernel panic on lvcreate (Stuart D. Gathman)
> � 7. Re: kernel panic on lvcreate (Christopher Hawkins)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Mon, 7 Dec 2009 14:34:22 -0500 (EST)
> From: "Stuart D. Gathman" <stuart@bmsi.com>
> Subject: Re: [linux-lvm] Re: Re: Problems with dissapearing PV when
> � � � �mounting � � � �(Stuart D. Gathman)
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Message-ID: <Pine.LNX.4.64.0912071431030.1595@bmsred.bmsi.com>
> Content-Type: TEXT/PLAIN; charset=US-ASCII
>
> On Mon, 7 Dec 2009, Johan Gardell wrote:
>
>> Ok, added a filter to remove /dev/fd0. But i still get
>> [22723.980390] device-mapper: table: 254:1: linear: dm-linear: Device
>> lookup failed
>> [22723.980395] device-mapper: ioctl: error adding target to table
>> [22724.001153] device-mapper: table: 254:2: linear: dm-linear: Device
>> lookup failed
>> [22724.001158] device-mapper: ioctl: error adding target to table
>
> Well, the 'd' in the lvs output means "device present without tables".
> I googled on the error msg, and see that a bunch of Ubuntu and Debian
> people had to remove evms for lvm to work properly after a certain
> kernel upgrade. �If that is not the problem, then I would have to start
> looking at the source, but perhaps a real guru here could help.
>
> --
> � � � � � � �Stuart D. Gathman <stuart@bmsi.com>
> � �Business Management Systems Inc. �Phone: 703 591-0911 Fax: 703 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
>
>
>
> ------------------------------
>
> Message: 2
> Date: Mon, 7 Dec 2009 15:11:37 -0800
> From: malahal@us.ibm.com
> Subject: Re: [linux-lvm] Re: Re: Problems with dissapearing PV when
> � � � �mounting (Stuart D. Gathman)
> To: linux-lvm@redhat.com
> Message-ID: <20091207231136.GA31793@us.ibm.com>
> Content-Type: text/plain; charset=us-ascii
>
> Johan Gardell [gardin@gmail.com] wrote:
>> Ok, added a filter to remove /dev/fd0. But i still get
>> [22723.980390] device-mapper: table: 254:1: linear: dm-linear: Device
>> lookup failed
>> [22723.980395] device-mapper: ioctl: error adding target to table
>> [22724.001153] device-mapper: table: 254:2: linear: dm-linear: Device
>> lookup failed
>> [22724.001158] device-mapper: ioctl: error adding target to table
>
> There are lots of reasons why the above message shows up. Most likely
> someone else using them...
>
>> mount doesn't give any messages in dmesg
>>
>> lvs shows:
>> � LV � � � � �VG � � � �Attr � LSize � Origin Snap% �Move Log Copy% �Convert
>> � dreamhacklv Dreamhack -wi-ao � 1,23t
>> � root � � � �gardin � �-wi-d- 928,00g
>> � swap_1 � � �gardin � �-wi-d- � 2,59g
>>
>> if i try to mount with:
>> � mount -t reiserfs /dev/mapper/gardin-root /mnt/tmp
>>
>> i get this in dmesg:
>> � [23113.711247] REISERFS warning (device dm-1): sh-2006
>> read_super_block: bread failed (dev dm-1, block 2, size 4096)
>> � [23113.711257] REISERFS warning (device dm-1): sh-2006
>> read_super_block: bread failed (dev dm-1, block 16, size 4096)
>> � [23113.711261] REISERFS warning (device dm-1): sh-2021
>> reiserfs_fill_super: can not find reiserfs on dm-1
>
> Looks like you have some kind of LV here. What is the output of the
> following two commands:
>
> 1. "dmsetup table"
> 1. "dmsetup ls"
>
> Thanks, Malahal.
>
>
>
> ------------------------------
>
> Message: 3
> Date: Wed, 09 Dec 2009 10:00:42 -0500 (EST)
> From: Christopher Hawkins <chawkins@bplinux.com>
> Subject: Re: [linux-lvm] kernel panic on lvcreate
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Message-ID: <14440243.291260370842741.JavaMail.javamailuser@localhost>
> Content-Type: text/plain; charset=utf-8
>
> Hello,
>
> After some time I revisited this issue on a freshly installed Centos 5.4 box, latest kernel (2.6.18-164.6.1.el5 ) and the panic is still reproducible. Any time I create a snapshot of the root filesystem, kernel panics. The LVM HOWTO says to post bug reports to this list. Is this the proper place?
>
> Thanks,
> Chris
>
> >From earlier post:
> OOPS message:
>
> BUG: scheduling while atomic: java/0x00000001/2959 � � � � � � � � � � � � � � � [<c061637f>] <3>BUG: scheduling while atomic: java/0x00000001/2867 � � � � � � �[<c061637f>] schedule+0x43/0xa55 � � � � � � � � � � � � � � � � � � � � � � � �[<c042c40d>] lock_timer_base+0x15/0x2f
> �[<c042c46b>] try_to_del_timer_sync+0x44/0x4a
> �[<c0437dd2>] futex_wake+0x3c/0xa5
> �[<c0434d5f>] prepare_to_wait+0x24/0x46
> �[<c0461ea7>] do_wp_page+0x1b3/0x5bb
> �[<c0438b01>] do_futex+0x239/0xb5e
> �[<c0434c13>] autoremove_wake_function+0x0/0x2d
> �[<c0463876>] __handle_mm_fault+0x9a9/0xa15
> �[<c041e727>] default_wake_function+0x0/0xc
> �[<c046548d>] unmap_region+0xe1/0xf0
> �[<c061954f>] do_page_fault+0x233/0x4e1
> �[<c061931c>] do_page_fault+0x0/0x4e1
> �[<c0405a89>] error_code+0x39/0x40
> �=======================
> schedule+0x43/0xa55
> �[<c042c40d>] <0>------------[ cut here ]------------
> kernel BUG at arch/i386/mm/highmem.c:43!
> invalid opcode: 0000 [#1]
> SMP
> last sysfs file: /devices/pci0000:00/0000:00:00.0/irq
> Modules linked in: autofs4 hidp rfcomm l2cap bluetooth lockd sunrpc ip6t_REJECTdCPU: � �3 ip6table_filter ip6_tables x_tables ipv6 xfrm_nalgo cry
> EIP: � �0060:[<c041cb08>] � �Not tainted VLI
> EFLAGS: 00010206 � (2.6.18-164.2.1.el5 #1)
> EIP is at kmap_atomic+0x5c/0x7f
> eax: c0012d6c � ebx: fff5b000 � ecx: c1fb8760 � edx: 00000180
> esi: f7be8580 � edi: f7fa7000 � ebp: 00000004 � esp: f5c54f0c
> ds: 007b � es: 007b � ss: 0068 � � � � � � � � � � � � � � � � � � � � � � � � �Process mpath_wait (pid: 3273, ti=f5c54000 task=f5c50000 task.ti=f5c54000)ne � �Stack: c073a4e0 c0462f7f f7b0eb30 f7b40780 f5c54f3c 0029c3f0 f63b5ef0 f7be8580
> � � � f7b40780 f7fa7000 00008802 c0472d75 f7b0eb30 f7c299c0 00001000 00001000
> � � � 00001000 00000101 00000001 00000000 00000000 f5c5007b 0000007b ffffffff
> Call Trace:
> �[<c0462f7f>] __handle_mm_fault+0xb2/0xa15
> �[<c0472d75>] do_filp_open+0x2b/0x31
> �[<c061954f>] do_page_fault+0x233/0x4e1
> �[<c061931c>] do_page_fault+0x0/0x4e1
> �[<c0405a89>] error_code+0x39/0x40
> �=======================
> Code: 00 89 e0 25 00 f0 ff ff 6b 50 10 1b 8d 14 13 bb 00 f0 ff ff 8d 42 44 c1 e EIP: [<c041cb08>] kmap_atomic+0x5c/0x7f SS:ESP 0068:f5c54f0c
> �<0>Kernel panic - not syncing: Fatal exception
>
> �0c 29 c3 a1 54 12 79 c0 c1 e2 02 29 d0 83 38 00 74 08 <0f> 0b 2b
>
>
> ----- "Milan Broz" <mbroz@redhat.com> wrote:
>
>> On 11/03/2009 04:07 PM, Christopher Hawkins wrote:
>> > When I create a root snapshot on a fairly typical Centos 5.3
>> server:
>> ...
>> > I get a kernel panic.
>>
>> Please try to first update kernel to version from 5.4.
>> (There were some fixes for snapshot like
>> https://bugzilla.redhat.com/show_bug.cgi?id=496100)
>>
>> If it still fails, please post the OOps trace from kernel (syslog).
>>
>> Milan
>> --
>> mbroz@redhat.com
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>
> ------------------------------
>
> Message: 4
> Date: Wed, 9 Dec 2009 22:05:59 +0200
> From: Vahri? Muhtaryan <vahric@doruk.net.tr>
> Subject: [linux-lvm] lvm striped VG and Extend and Reallocation
> � � � �Question
> To: <linux-lvm@redhat.com>
> Message-ID: <060201ca790b$066f9ea0$134edbe0$@net.tr>
> Content-Type: text/plain; charset="iso-8859-9"
>
> Hello to �All,
>
>
>
> I'm using lvm2, I will create 2 striped LV which volume group created by two
> PVs. When write happen, its will striped to two PVs step by step.
>
> I know that when need to extend stirped LV, �I have to add two PVs more �and
> extend the LV for do not get an error.
>
>
>
> Two question
>
>
>
> First; when I extend striped volume does it means I will have 2 striped 2
> linear volume group? Means chunk1 written to PV1 ,chunk2 written to PV2 and
> its over , it will pass second two PVs and chunk3 written to PV3 ,chunk4
> wirtten PV4 , right ?
>
>
>
> �f its right , when data is not big enough and chunk1 and chunk2 enough to
> store, next write request time LVM start for first pair of PVs or not ?
>
>
>
> Second;
>
>
>
> I would like to balance striped data when I add PVs to extend related VG
> because first datas are written to only olds PVs and after extend if read
> request happen still old disks will be used instead of �this and improve
> performance I would like to lay all data to all PVs after extend. �s there
> any way to �reallocation PEs ?
>
>
>
> Regards
>
> Vahric
>
> -------------- next part --------------
> An HTML attachment was scrubbed...
> URL: https://www.redhat.com/archives/linux-lvm/attachments/20091209/e1641681/attachment.html
>
> ------------------------------
>
> Message: 5
> Date: Wed, 09 Dec 2009 21:18:29 +0100
> From: Milan Broz <mbroz@redhat.com>
> Subject: Re: [linux-lvm] kernel panic on lvcreate
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Cc: Christopher Hawkins <chawkins@bplinux.com>
> Message-ID: <4B200615.1010702@redhat.com>
> Content-Type: text/plain; charset=UTF-8
>
> On 12/09/2009 04:00 PM, Christopher Hawkins wrote:
>>
>> After some time I revisited this issue on a freshly installed Centos 5.4 box, latest kernel (2.6.18-164.6.1.el5 )
>> and the panic is still reproducible. Any time I create a snapshot of the root filesystem, kernel panics.
>
> I guess it is already reported here https://bugzilla.redhat.com/show_bug.cgi?id=539328
> so please watch this bugzilla.
>
> Milan
> --
> mbroz@redhat.com
>
>
>
> ------------------------------
>
> Message: 6
> Date: Thu, 10 Dec 2009 10:00:07 -0500 (EST)
> From: "Stuart D. Gathman" <stuart@bmsi.com>
> Subject: Re: [linux-lvm] kernel panic on lvcreate
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Message-ID: <Pine.LNX.4.64.0912100949260.8205@bmsred.bmsi.com>
> Content-Type: TEXT/PLAIN; charset=US-ASCII
>
> On Wed, 9 Dec 2009, Christopher Hawkins wrote:
>
>> After some time I revisited this issue on a freshly installed Centos 5.4 box,
>> latest kernel (2.6.18-164.6.1.el5 ) and the panic is still reproducible. Any
>> time I create a snapshot of the root filesystem, kernel panics. The LVM HOWTO
>> says to post bug reports to this list. Is this the proper place?
>
> Bummer. �I would post the bug on Centos bugzilla also. �Please post the
> bug number here if you do it (cause I'll get to it eventually).
>
> Thanks for testing this. �I have the same problem, and have a new client
> to install by next year - so not much time to work on it.
>
> Now that we know it is not yet fixed, we can form theories as to what
> is going wrong. �My guess is that the problem is caused by the fact that
> lvm is updating files in /etc/lvm on the root filesystem while taking
> the snapshot. �These updates are done by user space programs, so I would
> further speculate that *any* snapshot would crash if an update happened exactly
> when creating the snapshot - i.e. the atomic nature of snapshot creation has
> been broken. �The lvm user space probably does fsync() on files
> in /etc/lvm, which might be involved in triggering the crash.
>
> We could test the first theory by moving /etc/lvm to another volume (I
> sometimes put it on /boot - a non LVM filesystem - for easier disaster
> recovery.) Naturally, I wouldn't go moving /etc/lvm on a production server.
>
> Testing the second hypothesis is less certain, and would basically involve
> trying snapshots of LVs undergoing heavy updating.
>
> --
> � � � � � � �Stuart D. Gathman <stuart@bmsi.com>
> � �Business Management Systems Inc. �Phone: 703 591-0911 Fax: 703 591-6154
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
>
>
>
> ------------------------------
>
> Message: 7
> Date: Thu, 10 Dec 2009 10:04:40 -0500 (EST)
> From: Christopher Hawkins <chawkins@bplinux.com>
> Subject: Re: [linux-lvm] kernel panic on lvcreate
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Message-ID: <8023092.631260457480892.JavaMail.javamailuser@localhost>
> Content-Type: text/plain; charset=utf-8
>
> It is reported here:
>
> https://bugzilla.redhat.com/show_bug.cgi?id=539328
>
> That is definitely the one. And it sounds like they have a potential fix... I have already emailed the developers there asking if I can help test their patch, so hopefully soon I can post back and report status.
>
> Christopher Hawkins
>
> ----- "Stuart D. Gathman" <stuart@bmsi.com> wrote:
>
>> On Wed, 9 Dec 2009, Christopher Hawkins wrote:
>>
>> > After some time I revisited this issue on a freshly installed Centos
>> 5.4 box,
>> > latest kernel (2.6.18-164.6.1.el5 ) and the panic is still
>> reproducible. Any
>> > time I create a snapshot of the root filesystem, kernel panics. The
>> LVM HOWTO
>> > says to post bug reports to this list. Is this the proper place?
>>
>> Bummer. �I would post the bug on Centos bugzilla also. �Please post
>> the
>> bug number here if you do it (cause I'll get to it eventually).
>>
>> Thanks for testing this. �I have the same problem, and have a new
>> client
>> to install by next year - so not much time to work on it.
>>
>> Now that we know it is not yet fixed, we can form theories as to what
>> is going wrong. �My guess is that the problem is caused by the fact
>> that
>> lvm is updating files in /etc/lvm on the root filesystem while taking
>> the snapshot. �These updates are done by user space programs, so I
>> would
>> further speculate that *any* snapshot would crash if an update
>> happened exactly
>> when creating the snapshot - i.e. the atomic nature of snapshot
>> creation has
>> been broken. �The lvm user space probably does fsync() on files
>> in /etc/lvm, which might be involved in triggering the crash.
>>
>> We could test the first theory by moving /etc/lvm to another volume
>> (I
>> sometimes put it on /boot - a non LVM filesystem - for easier
>> disaster
>> recovery.) Naturally, I wouldn't go moving /etc/lvm on a production
>> server.
>>
>> Testing the second hypothesis is less certain, and would basically
>> involve
>> trying snapshots of LVs undergoing heavy updating.
>>
>> --
>> � � � � � � Stuart D. Gathman <stuart@bmsi.com>
>> � � Business Management Systems Inc. �Phone: 703 591-0911 Fax: 703
>> 591-6154
>> "Confutatis maledictis, flammis acribus addictis" - background song
>> for
>> a Microsoft sponsored "Where do you want to go from here?"
>> commercial.
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>
> ------------------------------
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
>
> End of linux-lvm Digest, Vol 70, Issue 4
> ****************************************
>
