Message-ID: <20030502163617.GB19708@amphibian.dyndns.org>
Mime-Version: 1.0
Content-Disposition: inline
From: Toad <toad@amphibian.dyndns.org>
Subject: [linux-lvm] [support@sistina.com: Re: [support] LVM support request]
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
Date: Fri May  2 11:36:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

----- Forwarded message from "Laurie E. Miller" <support@sistina.com> -----

Envelope-to: toad@amphibian.dyndns.org
Subject: Re: [support] LVM support request
From: "Laurie E. Miller" <support@sistina.com>
To: <toad@amphibian.dyndns.org>
Importance: Normal
Cc: <support@sistina.com>

Since LVM is an open-source project, support for LVM is handled through
its open-source community mailing lists which can be found at
http://www.sistina.com/products_lvm_mailing%20list.htm



Toad said:
> Hi. I had a functioning LVM system with PVs on several partitions on
> hda, and the whole disk PVs on hdb and hdc. On each PV on hda, I
> pvmove'd the data onto the whole-disk PVs and pvchange -x n'd them. I
> then vgreduce'd them out of the VG (I may have missed one? I am not
> sure how to explain what happened later otherwise), deleted the
> partitions via fdisk, and rebooted. Then LVM stopped working, with
> error  messages similar to the following:
>
> servalan:~# vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data
> of  volume
> group "vg-big" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your
> volume  group
>
> servalan:~# pvdisplay /dev/ide/host0/bus0/target1/lun0/disc
> --- Physical volume ---
> PV Name               /dev/ide/host0/bus0/target1/lun0/disc
> VG Name               vg-big
> PV Size               42.95 GB [90069840 secs] / NOT usable 1.31 MB
> [LVM: 299 KB]
> PV#                   9
> PV Status             available
> Allocatable           yes (but full)
> Cur LV                19
> PE Size (KByte)       1024
> Total PE              43978
> Free PE               0
> Allocated PE          43978
> PV UUID               6SpCDw-2ewQ-ITbk-IQIn-p0MV-zlDs-e29Qzr
>
> servalan:~# pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/ide/host0/bus0/target1/lun0/disc"  is
> associated to
> unknown VG "vg-big" (run vgscan)
> pvscan -- total: 1 [42.95 GB] / in use: 1 [42.95 GB] / in no VG: 0 [0]
>
> vgcfgrestore was unhelpful, it restored the VGDA data to the volume but
>  then vgscan got the same problem as above.  Because my /usr was on
> LVM,  I had to reinstall linux onto hda, so I do not have my /etc
> anymore. So  I now have two physical volumes with approximately 145GB
> total, in which  several tens of gigabytes of data split between about
> 20 LVs is
> buried... somewhere. Is there any way to recover the data? My backups
> are a month old due to problems with dvdrtools and unknown DVD-R media,
>  but that's another story. Anyhow, if you could help me get back my
> data  that would a) be very helpful and b) I would consider paying
> reasonable  support costs _if_ I get my data back.
>
> ----- Forwarded message from Oleg Drokin <green@namesys.com> -----
>
> Envelope-to: toad@amphibian.dyndns.org
> From: Oleg Drokin <green@namesys.com>
> To: Toad <toad@amphibian.dyndns.org>
> Cc: support@sistina.com, support@namesys.com
> Subject: Re: Support request, you may have replied and got a mailer
> problem
>
> Hello!
>
> In fact there were a lot more instructions than just vgcfgrestore.
>
> We think that people at support@sistina.com will be able to provide you
> with better advice. Because they are the authors of the LVM code and
> are usually authors are more expert than others advising on their
> software. If you later discover there are also reiserfs-related issues,
> please let us know.
>
> Your money that you paid to us will be refunded.
>
> Bye,
>    Oleg
> On Fri, May 02, 2003 at 02:48:57PM +0100, Toad wrote:
>> On Fri, May 02, 2003 at 05:33:45PM +0400, Oleg Drokin wrote:
>> > Hello!
>> > On Fri, May 02, 2003 at 02:19:26PM +0100, Toad wrote:
>> >
>> > > > > There may have been local mail problems at this end. My other
>> > > > > address is  mtoseland@blueyonder.co.uk. If you tried to reply
>> > > > > and the mail server  said there was no space, please try
>> > > > > again. I am looking forward to  hearing from you if only to
>> > > > > say that you got my message and are looking  into it, because
>> > > > > you have my money and I don't have my data :)
>> > > > Are there any messages from kernel/lvm tools when you try to
>> > > > start LVM? I am going to try and reproduce the situation myself
>> > > > to see what can be done.
>> > > Indeed:
>> > > servalan:~# vgscan
>> > > vgscan -- reading all physical volumes (this may take a while...)
>> > > vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get
>> > > data of  volume
>> > > group "vg-big" from physical volume(s)
>> > > vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
>> > > vgscan -- WARNING: This program does not do a VGDA backup of your
>> > > volume  group
>> > > servalan:~# vgdisplay
>> > > vgdisplay -- no volume groups found
>> > > servalan:~# pvscan
>> > > pvscan -- reading all physical volumes (this may take a while...)
>> > > pvscan -- inactive PV "/dev/ide/host0/bus0/target1/lun0/disc"  is
>> > > associated to
>> > > unknown VG "vg-big" (run vgscan)
>> > > pvscan -- total: 1 [42.95 GB] / in use: 1 [42.95 GB] / in no VG: 0
>> > > [0] servalan:~# vgscan
>> > > vgscan -- reading all physical volumes (this may take a while...)
>> > > vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get
>> > > data of  volume
>> > > group "vg-big" from physical volume(s)
>> > > vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
>> > > vgscan -- WARNING: This program does not do a VGDA backup of your
>> > > volume  group
>> >
>> > Ok, can yo also describe what you already tried to do?
>>
>> I tried as above to get LVM to recognize the volume group; I got
>> output  similar to the above. I reinstalled linux on the first drive,
>> which  should not have had any LVM data on it by this point. I have
>> been  backing up disk images of the LVM drives onto DVD...
>>
>> As I said in the other mail, the original problem occurred when I
>> pvmove'd all the data off the LVM PVs on the partitions on /dev/hda,
>> pvchange -a n'd them, and then vgreduced them... except that maybe I
>> missed one, because when I rebooted the LVM had stopped working. I do
>> not have my /etc anymore, but when I did have it and tried to
>> vgcfgrestore, it didn't work, with I think error messages similar to
>> the  above...
>>
>> >
>> > And have you seen this mail (problem looks similar to yours):
>> > http://lists.sistina.com/pipermail/linux-lvm/2002-July/011825.html
>>
>> I did try to vgcfgrestore, but it didn't work and I had to reinstall
>> because my /usr was on LVM.
>> >
>> > Bye,
>> >     Oleg
>>
>>
>> Output from pvdata /dev/hdb (/dev/hdc should also have LVM data):
>>
>> --- Physical volume ---
>> PV Name               /dev/hdb
>> VG Name               vg-big
>> PV Size               42.95 GB [90069840 secs] / NOT usable 1.31 MB
>> [LVM: 299 KB]
>> PV#                   9
>> PV Status             available
>> Allocatable           yes (but full)
>> Cur LV                19
>> PE Size (KByte)       1024
>> Total PE              43978
>> Free PE               0
>> Allocated PE          43978
>> PV UUID               6SpCDw-2ewQ-ITbk-IQIn-p0MV-zlDs-e29Qzr
>>
>> --- Volume group ---
>> VG Name
>> VG Access             read/write
>> VG Status             NOT available/resizable
>> VG #                  0
>> MAX LV                256
>> Cur LV                24
>> Open LV               0
>> MAX LV Size           64 GB
>> Max PV                256
>> Cur PV                3
>> Act PV                3
>> VG Size               183.78 GB
>> PE Size               1 MB
>> Total PE              188188
>> Alloc PE / Size       142950 / 139.60 GB
>> Free  PE / Size       45238 / 44.18 GB
>> VG UUID               J5F2e6-iuYs-1x8f-TYq8-PGHC-R0ol-qa9s7H
>>
>> --- List of logical volumes ---
>>
>> pvdata -- logical volume "/dev/vg-big/ebak" at offset   0
>> pvdata -- logical volume "/dev/vg-big/home" at offset   1
>> pvdata -- logical volume "/dev/vg-big/usr" at offset   2
>> pvdata -- logical volume "/dev/vg-big/var" at offset   3
>> pvdata -- logical volume "/dev/vg-big/usr-share" at offset   4
>> pvdata -- logical volume "/dev/vg-big/usr-src" at offset   5
>> pvdata -- logical volume "/dev/vg-big/usr-doc-local" at offset   6
>> pvdata -- logical volume "/dev/vg-big/usr-mp3" at offset   7
>> pvdata -- logical volume "/dev/vg-big/usr-make" at offset   8
>> pvdata -- logical volume "/dev/vg-big/var-spool-squid" at offset   9
>> pvdata -- logical volume "/dev/vg-big/var-lib-freenet_unstable" at
>> offset  10
>> pvdata -- logical volume "/dev/vg-big/swap" at offset  11
>> pvdata -- logical volume "/dev/vg-big/var-log" at offset  12
>> pvdata -- logical volume "/dev/vg-big/home-evelyn" at offset  13
>> pvdata -- logical volume "/dev/vg-big/var-log-freenet_stable" at
>> offset   14
>> pvdata -- logical volume "/dev/vg-big/usr-games" at offset  15
>> pvdata -- logical volume "/dev/vg-big/var-cache" at offset  16
>> pvdata -- logical volume "/dev/vg-big/usr-local-temp" at offset  17
>> pvdata -- logical volume "/dev/vg-big/opt" at offset  18
>> pvdata -- logical volume "/dev/vg-big/home-toad" at offset  19
>> pvdata -- logical volume "/dev/vg-big/home-browser" at offset  20
>> pvdata -- logical volume "/dev/vg-big/root" at offset  21
>> pvdata -- logical volume
>> "/dev/vg-big/var-lib-freenet_unstable-secondary" at offset  22
>> pvdata -- logical volume struct at offset  23 is empty
>> pvdata -- logical volume struct at offset  24 is empty
>> pvdata -- logical volume
>> "/dev/vg-big/var-lib-freenet_unstable-freenet_downloads" at offset  25
>> pvdata -- logical volume struct at offset  26 is empty
>> pvdata -- logical volume struct at offset  27 is empty
>> pvdata -- logical volume struct at offset  28 is empty
>> pvdata -- logical volume struct at offset  29 is empty
>> .............
>> pvdata -- logical volume struct at offset 255 is empty
>> --- List of physical volume UUIDs ---
>>
>> 001: kcSXvw-uhea-ERDp-aZMw-z9E2-QNE1-vX8S1m
>> 002: 6SpCDw-2ewQ-ITbk-IQIn-p0MV-zlDs-e29Qzr
>> 003: 1KvMpe-OkCL-JVS0-7KQq-PukV-auM1-jmyk1G
>>
>>
>
> ----- End forwarded message -----
>
> _______________________________________________
> support mailing list
> support@lists.sistina.com
> http://lists.sistina.com/mailman/listinfo/support


Laurie E. Miller
support@sistina.com

--

NOTICE: The attached electronic message is communication from Sistina
Software, Inc. to you pursuant to the contract for maintenance and support
services that you or your company has with Sistina Software, Inc.  The
attached electronic message is confidential information of Sistina
Software, Inc.  You may not share the attached electronic message, or any
of its contents, with any third parties without express prior written
consent from Sistina Software, Inc. If you are not the intended recipient,
you are hereby notified that you have received this transmittal in error;
any review, dissemination, distribution or copying of this transmittal is
strictly prohibited.  If you have this communication in error, please
notify us immediately by telephone (612/638-0500) and immediately delete
this message and all its attachments.



----- End forwarded message -----
