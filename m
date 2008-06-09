Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m59DkjQx028108
	for <linux-lvm@redhat.com>; Mon, 9 Jun 2008 09:46:45 -0400
Received: from yx-out-2324.google.com (yx-out-2324.google.com [74.125.44.29])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m59DkUUb025203
	for <linux-lvm@redhat.com>; Mon, 9 Jun 2008 09:46:30 -0400
Received: by yx-out-2324.google.com with SMTP id 8so138465yxm.81
	for <linux-lvm@redhat.com>; Mon, 09 Jun 2008 06:46:30 -0700 (PDT)
Message-ID: <2122f0920806090646h46bb29cds76fb957a2b8e0cbe@mail.gmail.com>
Date: Mon, 9 Jun 2008 09:46:29 -0400
From: "Girish V" <girish.xen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Re: Re: Re: Loopback mount a disk image with lvm
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Incidentally, how do I free the loop (/dev/loop0) associated with
disk.img. I tried "sudo losetup -d /dev/loop0", but I get the error
message "ioctl: LOOP_CLR_FD: Device or resource busy".

I tried looking at mount, ps, top etc - but the disk.img associated
with loop0, was not being used.

Any ideas?
Thanks

On Mon, Jun 9, 2008 at 8:59 AM,  <linux-lvm-request@redhat.com> wrote:
> Send linux-lvm mailing list submissions to
>        linux-lvm@redhat.com
>
> To subscribe or unsubscribe via the World Wide Web, visit
>        https://www.redhat.com/mailman/listinfo/linux-lvm
> or, via email, send a message with subject or body 'help' to
>        linux-lvm-request@redhat.com
>
> You can reach the person managing the list at
>        linux-lvm-owner@redhat.com
>
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of linux-lvm digest..."
>
>
> Today's Topics:
>
>   1. Re: Performance tunning on LVM2 (Heinz Mauelshagen)
>   2. Re: Re: Loopback mount a disk image with lvm (Girish) (Girish V)
>
>
> ----------------------------------------------------------------------
>
> Message: 1
> Date: Mon, 9 Jun 2008 13:43:55 +0200
> From: Heinz Mauelshagen <mauelshagen@redhat.com>
> Subject: Re: [linux-lvm] Performance tunning on LVM2
> To: Antony MARTINEAU <Antony.MARTINEAU@lippi.fr>
> Cc: LVM general discussion and development <linux-lvm@redhat.com>,
>        mauelshagen@redhat.com
> Message-ID: <20080609114355.GB5507@redhat.com>
> Content-Type: text/plain; charset=us-ascii
>
> On Mon, Jun 09, 2008 at 12:06:19PM +0200, Antony MARTINEAU wrote:
>> Thanks for your answer...
>> But my test show that it is, the LVM2 software the probleme...
>
> device-mapper snapshot target actually.
>
>>
>> Because even whith 3 writing test at the same time on 3 LV which are on
>> the same VG and the same PV, the performance are better than one LV whith
>> only one snapshot...
>
> Sure, the write patterns for snapshots go sequentially to the disk
> (i.e. read from origin, write to COW store, write to origin, ...).
>
>>
>> Look this test:
>>
>> suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=10M count=150
>> 150+0 records in
>> 150+0 records out
>> 1572864000 bytes (1.6 GB) copied, 27.9422 seconds, 56.3 MB/s
>>
>> suse2:~ # dd if=/dev/zero of=/dev/vg0/test2 bs=10M count=150
>> 150+0 records in
>> 150+0 records out
>> 1572864000 bytes (1.6 GB) copied, 33.2836 seconds, 47.3 MB/s
>>
>> suse2:~ # dd if=/dev/zero of=/dev/vg0/test3 bs=10M count=150
>> 150+0 records in
>> 150+0 records out
>> 1572864000 bytes (1.6 GB) copied, 33.784 seconds, 46.6 MB/s
>>
>> With 3 writing test AT THE SAME TIME , the average is better that one
>> writing test on one LV whith one snap
>>
>> Look,
>>
>> suse2:~ # lvcreate -s -L2G -ntest.snap /dev/vg0/test
>>   Logical volume "test.snap" created
>>
>> suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=10M count=150
>> 150+0 records in
>> 150+0 records out
>> 1572864000 bytes (1.6 GB) copied, 382.315 seconds, 4.1 MB/s
>>
>> It is disastrous...
>>
>> I think dd is a good test...
>
> It's an extreme test like I tried to point out.
>
> Like already mentioned: you gotta put the COW store on a seperate PV
> after adding one to your vg0 (say /dev/sdb1).
>
> E.g.:
> pvcreate /dev/sdb1
> vgextend vg0 /dev/sdb1
> lvcreate -s -L2G -ntest.snap /dev/vg0/test /dev/sdb1
>
> Heinz
>
>
>>
>>
>> Cordialement,
>>
>>
>>
>> MARTINEAU
>> Antony
>> Service informatique
>> Assistant informatique
>> LIPPI Management
>> La Fouillouse
>> 16440 Mouthiers sur Boheme
>> Tel.: 05.45.67.34.35
>> Courriel: antony.martineau@lippi.fr
>> http://www.lippi.fr
>>
>>
>>
>>
>> De :
>> Heinz Mauelshagen <mauelshagen@redhat.com>
>> Pour :
>> LVM general discussion and development <linux-lvm@redhat.com>
>> Date:
>> 09/06/2008 11:46
>> Objet :
>> Re: [linux-lvm] Performance tunning on LVM2
>>
>>
>>
>> On Fri, Jun 06, 2008 at 08:03:51AM -0700, Larry Dickson wrote:
>> > A (linear) volume group made of two physical volumes consists of one PV
>> > followed by the other, rather like a "Raid-Linear". If you size the
>> > origin logical volume right, you can get one LV (the origin) to fall on
>> one
>> > disk, and force the snapshot to land on the other disk. This eliminates
>> > back-and-forth seeking to the COW. Whether it solves your problem will
>> > depend on how smart the driver is about the read-before-write activity
>> on
>> > the origin volume.
>> >
>> > Other members of the list may have more experience on this. Comments?
>>
>> If I read correctly, Antony just has *ONE* PV.
>>
>> So no matter what, he has to add another to allow for snapshot COW
>> store allocation on that other PV, distinct from the one holding
>> the origin(s). Presumably there's no other bottleneck aside from the
>> disk, that'll do better.
>>
>> Keep in mind, that unless you've got streaming writes, the performance
>> won't drop as much as in the (artificial) dd test below.
>>
>> FYI: With the current snapshot implementation, multiple snapshots per
>> single
>>      origin will throttle write performance because of write duplication
>>      to all per snapshot COW stores.
>>
>> Heinz
>>
>> >
>> > Larry
>> >
>> > On 6/6/08, Antony MARTINEAU <Antony.MARTINEAU@lippi.fr> wrote:
>> > >
>> > >
>> > > The volume group vg0 is the raid0 of two disk (SAS 15000rpm 300G0)
>> > > I have only this raid on the server
>> > >
>> > > But i don't understand, imagine i make a volume group  ou of this
>> raid0. It
>> > > is no possible to snapshot the original volume, am i wrong?
>> > >
>> > > If i make a new VG on another disks, For exemple /dev/vg1/
>> > > LVM don't permit to store a snaphot on a different VG than the origin
>> > > volum.
>> > >
>> > > for exemple /dev/vg0/test cant be snapshoting on /dev/vg1/test.snap
>> > >
>> > > LV test and LV test.snap must be on the same volume, am i wrong ????
>> so it
>> > > is impossible to store snapshot on another disk....
>> > >
>> > >
>> > >   Cordialement,
>> > >
>> > >    *MARTINEAU
>> > > Antony*
>> > > Service informatique
>> > > Assistant informatique
>> > > LIPPI Management La Fouillouse
>> > > 16440 Mouthiers sur Boheme
>> > > Tel.: 05.45.67.34.35
>> > > Courriel: *antony.martineau@lippi.fr* <antony.martineau@lippi.fr>*
>> > > **http://www.lippi.fr* <http://www.lippi.fr/>
>> > >
>> > >
>> > >
>> > >   De : "Larry Dickson" <ldickson@cuttedge.com> Pour : "LVM general
>> > > discussion and development" <linux-lvm@redhat.com> Date: 06/06/2008
>> 16:19 Objet
>> > > : Re: [linux-lvm] Performance tunning on LVM2
>> > > ------------------------------
>> > >
>> > >
>> > >
>> > > This looks like the result of excessive seeking. Are origin volume and
>> > > snapshot both on the same physical drive? Is it possible to make a
>> volume
>> > > group out of two drives, and arrange things so that origin volume and
>> > > snapshot are hitting different disks?
>> > >
>> > > Larry Dickson
>> > > Cutting Edge Networked Storage
>> > >
>> > > On 6/6/08, *Antony MARTINEAU*
>> <*Antony.MARTINEAU@lippi.fr*<Antony.MARTINEAU@lippi.fr>>
>> > > wrote:
>> > >
>> > > Hello,
>> > > My configuration:
>> > > Server DELL 2860 Intel(R) Xeon(R) CPU  X3230 @ 2.66GHz (Quad Core)
>> > > 8GB of  memory
>> > > 2 x SAS 15000 300G0 RAID 0 hardware
>> > > SLES 10 SP2
>> > > Kernel 2.6.16.60-0.21-xen
>> > >
>> > > i have one volume group vg0 ( whith one PV, the two disks in raid0)
>> whith
>> > > many lvm
>> > > I am very surprise about LVM2 performance when a snapshot is done.
>> > > Write speed on the Original volume is very bad when a snaphot is
>> active...
>> > >
>> > > For exemple:
>> > > *
>> > > Speed on /dev/vg0/test when there is NO snapshot :*
>> > >
>> > > suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400
>> > > 400+0 records in
>> > > 400+0 records out
>> > > 838860800 bytes (839 MB) copied, 6.42741 seconds, 131 MB/s
>> > > *
>> > > Speed on /dev/vg0/test when there is one snapshot of this original
>> volume :
>> > > *
>> > >
>> > > suse2:~ # lvremove --force /dev/vg0/test3.snap
>> > >  Logical volume "test3.snap" successfully removed
>> > > suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400
>> > > 400+0 records in
>> > > 400+0 records out
>> > > 838860800 bytes (839 MB) copied, 6.42741 seconds, 131 MB/s
>> > > suse2:~ # lvcreate -s -L1G -ntest.snap /dev/vg0/test
>> > >  Logical volume "test.snap" created
>> > > suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400
>> > > 400+0 records in
>> > > 400+0 records out
>> > > 838860800 bytes (839 MB) copied, 204.862 seconds, 4.1 MB/s
>> > >
>> > > *
>> > > Speed on /dev/vg0/test when there is 2 snapshots of this original
>> volume :
>> > > *
>> > >
>> > > suse2:~ # lvcreate -s -L1G -ntest1.snap /dev/vg0/test
>> > >  Logical volume "test1.snap" created
>> > > suse2:~ # lvcreate -s -L1G -ntest2.snap /dev/vg0/test
>> > >  Logical volume "test2.snap" created
>> > > suse2:~ # lvremove /dev/vg0/test2.snap
>> > > Do you really want to remove active logical volume "test2.snap"?
>> [y/n]: y
>> > >  Logical volume "test2.snap" successfully removed
>> > > suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400
>> > > 400+0 records in
>> > > 400+0 records out
>> > > 838860800 bytes (839 MB) copied, 270.928 seconds, 3.1 MB/s
>> > >
>> > >
>> > > Do you know  some elements about tunning performance?,?
>> > >
>> > > Performances are disastrous when a snaphot is active
>> > > Could you give your speed result? and your amelioration??
>> > >
>> > > ps:Results are the same whithout Kernel Xen and whith a kernel more
>> recent
>> > > (*2.6.24.2* <http://2.6.24.2/>)  Cordialement,
>> > >    *MARTINEAU
>> > > Antony*
>> > > Service informatique
>> > > Assistant informatique
>> > > LIPPI Management La Fouillouse
>> > > 16440 Mouthiers sur Boheme
>> > > Tel.: 05.45.67.34.35
>> > > Courriel: *antony.martineau@lippi.fr* <antony.martineau@lippi.fr>*
>> > > **http://www.lippi.fr* <http://www.lippi.fr/>
>> > >
>> > >
>> > >
>> > >
>> > >
>> > >
>> > >
>> > >
>> > >
>> > > Ce message et toutes les pieces jointes sont etablis a l'attention
>> > > exclusive de ses destinataires et sont strictement confidentiels.
>> *Pour en
>> > > savoir plus cliquer ici* <http://www.lippi.fr/disclaimer.php>
>> > >
>> > > This message and any attachments are confidential to the ordinary user
>> of
>> > > the e-mail address to which it was addressed and may also be
>> privileged. *More
>> > > information* <http://www.lippi.fr/disclaimer.php>
>> > >
>> > >
>> > > _______________________________________________
>> > > linux-lvm mailing list*
>> > > **linux-lvm@redhat.com* <linux-lvm@redhat.com>*
>> > > **https://www.redhat.com/mailman/listinfo/linux-lvm*<
>> https://www.redhat.com/mailman/listinfo/linux-lvm>
>> > > read the LVM HOW-TO at *http://tldp.org/HOWTO/LVM-HOWTO/*<
>> http://tldp.org/HOWTO/LVM-HOWTO/>
>> > > _______________________________________________
>> > > linux-lvm mailing list
>> > > linux-lvm@redhat.com
>> > > https://www.redhat.com/mailman/listinfo/linux-lvm
>> > > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>> > >
>> > >
>> > >
>> > >
>> > >
>> > >
>> > >
>> > >
>> > >
>> > > Ce message et toutes les pieces jointes sont etablis a l'attention
>> > > exclusive de ses destinataires et sont strictement confidentiels.
>> *Pour en
>> > > savoir plus cliquer ici* <http://www.lippi.fr/disclaimer.php>
>> > >
>> > > This message and any attachments are confidential to the ordinary user
>> of
>> > > the e-mail address to which it was addressed and may also be
>> privileged. *More
>> > > information* <http://www.lippi.fr/disclaimer.php>
>> > >
>> > >
>> > > _______________________________________________
>> > > linux-lvm mailing list
>> > > linux-lvm@redhat.com
>> > > https://www.redhat.com/mailman/listinfo/linux-lvm
>> > > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>> > >
>>
>>
>>
>>
>> > _______________________________________________
>> > linux-lvm mailing list
>> > linux-lvm@redhat.com
>> > https://www.redhat.com/mailman/listinfo/linux-lvm
>> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>>
>> Heinz Mauelshagen                                 Red Hat GmbH
>> Consulting Development Engineer                   Am Sonnenhang 11
>> Storage Development                               56242 Marienrachdorf
>>                                                   Germany
>> Mauelshagen@RedHat.com                            PHONE +49  171 7803392
>>                                                   FAX   +49 2626 924446
>> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>
>>
>>
>>
>>
>>
>>
>>
>>
>> Ce message et toutes les pieces jointes sont etablis a l'attention
>> exclusive de ses destinataires et sont strictement confidentiels. Pour en
>> savoir plus cliquer ici
>>
>> This message and any attachments are confidential to the ordinary user of
>> the e-mail address to which it was addressed and may also be privileged.
>> More information
>
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
> Heinz Mauelshagen                                 Red Hat GmbH
> Consulting Development Engineer                   Am Sonnenhang 11
> Storage Development                               56242 Marienrachdorf
>                                                  Germany
> Mauelshagen@RedHat.com                            PHONE +49  171 7803392
>                                                  FAX   +49 2626 924446
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
>
>
> ------------------------------
>
> Message: 2
> Date: Mon, 9 Jun 2008 08:58:17 -0400
> From: "Girish V" <girish.xen@gmail.com>
> Subject: [linux-lvm] Re: Re: Loopback mount a disk image with lvm
>        (Girish)
> To: linux-lvm@redhat.com
> Message-ID:
>        <2122f0920806090558j180263f8uadd209c608220e84@mail.gmail.com>
> Content-Type: text/plain; charset=ISO-8859-1
>
> Thanks Dave,
> This worked like a charm.
> Girish
>
>
> On Mon, Jun 9, 2008 at 6:10 AM,  <linux-lvm-request@redhat.com> wrote:
>> Send linux-lvm mailing list submissions to
>>        linux-lvm@redhat.com
>>
>> To subscribe or unsubscribe via the World Wide Web, visit
>>        https://www.redhat.com/mailman/listinfo/linux-lvm
>> or, via email, send a message with subject or body 'help' to
>>        linux-lvm-request@redhat.com
>>
>> You can reach the person managing the list at
>>        linux-lvm-owner@redhat.com
>>
>> When replying, please edit your Subject line so it is more specific
>> than "Re: Contents of linux-lvm digest..."
>>
>>
>> Today's Topics:
>>
>>   1. striping question (Mag Gam)
>>   2. Loopback mount a disk image with lvm (Girish V)
>>   3. Re: Loopback mount a disk image with lvm (David Robinson)
>>   4. Re: Performance tunning on LVM2 (Heinz Mauelshagen)
>>   5. Re: Performance tunning on LVM2 (Antony MARTINEAU)
>>
>>
>> ----------------------------------------------------------------------
>>
>> Message: 1
>> Date: Sat, 7 Jun 2008 11:39:09 -0400
>> From: "Mag Gam" <magawake@gmail.com>
>> Subject: [linux-lvm] striping question
>> To: linux-lvm@redhat.com
>> Message-ID:
>>        <1cbd6f830806070839l436b0b4ai99d3c4264e896ea6@mail.gmail.com>
>> Content-Type: text/plain; charset="utf-8"
>>
>> If I am using x RAID 5 volumes and create PVs. Once I create the LVs is it a
>> good idea to stripe them? If so, what is a valid stripe size?
>>
>> I am looking for performance BTW.
>>
>>
>> TIA
>> -------------- next part --------------
>> An HTML attachment was scrubbed...
>> URL: https://www.redhat.com/archives/linux-lvm/attachments/20080607/69fbc84c/attachment.html
>>
>> ------------------------------
>>
>> Message: 2
>> Date: Sun, 8 Jun 2008 18:23:23 -0400
>> From: "Girish V" <girish.xen@gmail.com>
>> Subject: [linux-lvm] Loopback mount a disk image with lvm
>> To: linux-lvm@redhat.com
>> Message-ID:
>>        <2122f0920806081523w7a7ce274q9707992948f6e1b4@mail.gmail.com>
>> Content-Type: text/plain; charset=ISO-8859-1
>>
>> Hello,
>>
>> I have a disk.img (a disk image file, raw format) with the following "fdisk -l"
>>
>>    Device Boot      Start         End      Blocks   Id  System
>> disk.img1   *           1          13      104391   83  Linux
>> disk.img2              14        2491    19904535   8e  Linux LVM
>>
>> Now I can loopback mount the first bartition using
>> "mount -o loop,offset=32256 disk.img /mnt".
>>
>> I need to mount the second partition. If the secoond partition had
>> been an ext3 partition, I would have loopback mounted it as
>> "mount -o loop,offset=$((255*63*512*13) disk.img /mnt", but when I try
>> that, I get
>> mount: unknown filesystem type 'LVM2_member'
>>
>> Any help is greatly appreciated.
>>
>> Thanks.
>>
>>
>>
>> ------------------------------
>>
>> Message: 3
>> Date: Mon, 9 Jun 2008 10:52:54 +1000
>> From: "David Robinson" <zxvdr.au@gmail.com>
>> Subject: Re: [linux-lvm] Loopback mount a disk image with lvm
>> To: "LVM general discussion and development" <linux-lvm@redhat.com>
>> Message-ID:
>>        <b072968d0806081752s79f32e66h4c6d7de1b42094a0@mail.gmail.com>
>> Content-Type: text/plain; charset=ISO-8859-1
>>
>> On Mon, Jun 9, 2008 at 8:23 AM, Girish V <girish.xen@gmail.com> wrote:
>>> Hello,
>>>
>>> I have a disk.img (a disk image file, raw format) with the following "fdisk -l"
>>>
>>>    Device Boot      Start         End      Blocks   Id  System
>>> disk.img1   *           1          13      104391   83  Linux
>>> disk.img2              14        2491    19904535   8e  Linux LVM
>>>
>>> Now I can loopback mount the first bartition using
>>> "mount -o loop,offset=32256 disk.img /mnt".
>>>
>>> I need to mount the second partition. If the secoond partition had
>>> been an ext3 partition, I would have loopback mounted it as
>>> "mount -o loop,offset=$((255*63*512*13) disk.img /mnt", but when I try
>>> that, I get
>>> mount: unknown filesystem type 'LVM2_member'
>>>
>>> Any help is greatly appreciated.
>>
>> losetup /dev/loop0 disk.img
>> kpartx -a /dev/loop0
>>
>> Then to mount the first partition:
>>
>> mount /dev/mapper/loop0p1 /mnt
>>
>> Or to activate the volume group then mount the logical volume:
>>
>> vgscan
>> vgchange -ay vg
>> mount /dev/vg/lv /mnt
>>
>> Hope that helps.
>>
>> --Dave
>>
>>
>>
>> ------------------------------
>>
>> Message: 4
>> Date: Mon, 9 Jun 2008 11:44:53 +0200
>> From: Heinz Mauelshagen <mauelshagen@redhat.com>
>> Subject: Re: [linux-lvm] Performance tunning on LVM2
>> To: LVM general discussion and development <linux-lvm@redhat.com>
>> Message-ID: <20080609094453.GA5507@redhat.com>
>> Content-Type: text/plain; charset=us-ascii
>>
>> On Fri, Jun 06, 2008 at 08:03:51AM -0700, Larry Dickson wrote:
>>> A (linear) volume group made of two physical volumes consists of one PV
>>> followed by the other, rather like a "Raid-Linear". If you size the
>>> origin logical volume right, you can get one LV (the origin) to fall on one
>>> disk, and force the snapshot to land on the other disk. This eliminates
>>> back-and-forth seeking to the COW. Whether it solves your problem will
>>> depend on how smart the driver is about the read-before-write activity on
>>> the origin volume.
>>>
>>> Other members of the list may have more experience on this. Comments?
>>
>> If I read correctly, Antony just has *ONE* PV.
>>
>> So no matter what, he has to add another to allow for snapshot COW
>> store allocation on that other PV, distinct from the one holding
>> the origin(s). Presumably there's no other bottleneck aside from the
>> disk, that'll do better.
>>
>> Keep in mind, that unless you've got streaming writes, the performance
>> won't drop as much as in the (artificial) dd test below.
>>
>> FYI: With the current snapshot implementation, multiple snapshots per single
>>     origin will throttle write performance because of write duplication
>>     to all per snapshot COW stores.
>>
>> Heinz
>>
>>>
>>> Larry
>>>
>>> On 6/6/08, Antony MARTINEAU <Antony.MARTINEAU@lippi.fr> wrote:
>>> >
>>> >
>>> > The volume group vg0 is the raid0 of two disk (SAS 15000rpm 300G0)
>>> > I have only this raid on the server
>>> >
>>> > But i don't understand, imagine i make a volume group  ou of this raid0. It
>>> > is no possible to snapshot the original volume, am i wrong?
>>> >
>>> > If i make a new VG on another disks, For exemple /dev/vg1/
>>> > LVM don't permit to store a snaphot on a different VG than the origin
>>> > volum.
>>> >
>>> > for exemple /dev/vg0/test cant be snapshoting on /dev/vg1/test.snap
>>> >
>>> > LV test and LV test.snap must be on the same volume, am i wrong ???? so it
>>> > is impossible to store snapshot on another disk....
>>> >
>>> >
>>> >   Cordialement,
>>> >
>>> >    *MARTINEAU
>>> > Antony*
>>> > Service informatique
>>> > Assistant informatique
>>> > LIPPI Management La Fouillouse
>>> > 16440 Mouthiers sur Boheme
>>> > Tel.: 05.45.67.34.35
>>> > Courriel: *antony.martineau@lippi.fr* <antony.martineau@lippi.fr>*
>>> > **http://www.lippi.fr* <http://www.lippi.fr/>
>>> >
>>> >
>>> >
>>> >   De : "Larry Dickson" <ldickson@cuttedge.com> Pour : "LVM general
>>> > discussion and development" <linux-lvm@redhat.com> Date: 06/06/2008 16:19 Objet
>>> > : Re: [linux-lvm] Performance tunning on LVM2
>>> > ------------------------------
>>> >
>>> >
>>> >
>>> > This looks like the result of excessive seeking. Are origin volume and
>>> > snapshot both on the same physical drive? Is it possible to make a volume
>>> > group out of two drives, and arrange things so that origin volume and
>>> > snapshot are hitting different disks?
>>> >
>>> > Larry Dickson
>>> > Cutting Edge Networked Storage
>>> >
>>> > On 6/6/08, *Antony MARTINEAU* <*Antony.MARTINEAU@lippi.fr*<Antony.MARTINEAU@lippi.fr>>
>>> > wrote:
>>> >
>>> > Hello,
>>> > My configuration:
>>> > Server DELL 2860 Intel(R) Xeon(R) CPU  X3230 @ 2.66GHz (Quad Core)
>>> > 8GB of  memory
>>> > 2 x SAS 15000 300G0 RAID 0 hardware
>>> > SLES 10 SP2
>>> > Kernel 2.6.16.60-0.21-xen
>>> >
>>> > i have one volume group vg0 ( whith one PV, the two disks in raid0) whith
>>> > many lvm
>>> > I am very surprise about LVM2 performance when a snapshot is done.
>>> > Write speed on the Original volume is very bad when a snaphot is active...
>>> >
>>> > For exemple:
>>> > *
>>> > Speed on /dev/vg0/test when there is NO snapshot :*
>>> >
>>> > suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400
>>> > 400+0 records in
>>> > 400+0 records out
>>> > 838860800 bytes (839 MB) copied, 6.42741 seconds, 131 MB/s
>>> > *
>>> > Speed on /dev/vg0/test when there is one snapshot of this original volume :
>>> > *
>>> >
>>> > suse2:~ # lvremove --force /dev/vg0/test3.snap
>>> >  Logical volume "test3.snap" successfully removed
>>> > suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400
>>> > 400+0 records in
>>> > 400+0 records out
>>> > 838860800 bytes (839 MB) copied, 6.42741 seconds, 131 MB/s
>>> > suse2:~ # lvcreate -s -L1G -ntest.snap /dev/vg0/test
>>> >  Logical volume "test.snap" created
>>> > suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400
>>> > 400+0 records in
>>> > 400+0 records out
>>> > 838860800 bytes (839 MB) copied, 204.862 seconds, 4.1 MB/s
>>> >
>>> > *
>>> > Speed on /dev/vg0/test when there is 2 snapshots of this original volume :
>>> > *
>>> >
>>> > suse2:~ # lvcreate -s -L1G -ntest1.snap /dev/vg0/test
>>> >  Logical volume "test1.snap" created
>>> > suse2:~ # lvcreate -s -L1G -ntest2.snap /dev/vg0/test
>>> >  Logical volume "test2.snap" created
>>> > suse2:~ # lvremove /dev/vg0/test2.snap
>>> > Do you really want to remove active logical volume "test2.snap"? [y/n]: y
>>> >  Logical volume "test2.snap" successfully removed
>>> > suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400
>>> > 400+0 records in
>>> > 400+0 records out
>>> > 838860800 bytes (839 MB) copied, 270.928 seconds, 3.1 MB/s
>>> >
>>> >
>>> > Do you know  some elements about tunning performance?,?
>>> >
>>> > Performances are disastrous when a snaphot is active
>>> > Could you give your speed result? and your amelioration??
>>> >
>>> > ps:Results are the same whithout Kernel Xen and whith a kernel more recent
>>> > (*2.6.24.2* <http://2.6.24.2/>)  Cordialement,
>>> >    *MARTINEAU
>>> > Antony*
>>> > Service informatique
>>> > Assistant informatique
>>> > LIPPI Management La Fouillouse
>>> > 16440 Mouthiers sur Boheme
>>> > Tel.: 05.45.67.34.35
>>> > Courriel: *antony.martineau@lippi.fr* <antony.martineau@lippi.fr>*
>>> > **http://www.lippi.fr* <http://www.lippi.fr/>
>>> >
>>> >
>>> >
>>> >
>>> >
>>> >
>>> >
>>> >
>>> >
>>> > Ce message et toutes les pieces jointes sont etablis a l'attention
>>> > exclusive de ses destinataires et sont strictement confidentiels. *Pour en
>>> > savoir plus cliquer ici* <http://www.lippi.fr/disclaimer.php>
>>> >
>>> > This message and any attachments are confidential to the ordinary user of
>>> > the e-mail address to which it was addressed and may also be privileged. *More
>>> > information* <http://www.lippi.fr/disclaimer.php>
>>> >
>>> >
>>> > _______________________________________________
>>> > linux-lvm mailing list*
>>> > **linux-lvm@redhat.com* <linux-lvm@redhat.com>*
>>> > **https://www.redhat.com/mailman/listinfo/linux-lvm*<https://www.redhat.com/mailman/listinfo/linux-lvm>
>>> > read the LVM HOW-TO at *http://tldp.org/HOWTO/LVM-HOWTO/*<http://tldp.org/HOWTO/LVM-HOWTO/>
>>> > _______________________________________________
>>> > linux-lvm mailing list
>>> > linux-lvm@redhat.com
>>> > https://www.redhat.com/mailman/listinfo/linux-lvm
>>> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>> >
>>> >
>>> >
>>> >
>>> >
>>> >
>>> >
>>> >
>>> >
>>> > Ce message et toutes les pieces jointes sont etablis a l'attention
>>> > exclusive de ses destinataires et sont strictement confidentiels. *Pour en
>>> > savoir plus cliquer ici* <http://www.lippi.fr/disclaimer.php>
>>> >
>>> > This message and any attachments are confidential to the ordinary user of
>>> > the e-mail address to which it was addressed and may also be privileged. *More
>>> > information* <http://www.lippi.fr/disclaimer.php>
>>> >
>>> >
>>> > _______________________________________________
>>> > linux-lvm mailing list
>>> > linux-lvm@redhat.com
>>> > https://www.redhat.com/mailman/listinfo/linux-lvm
>>> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>> >
>>
>>
>>
>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>>
>> Heinz Mauelshagen                                 Red Hat GmbH
>> Consulting Development Engineer                   Am Sonnenhang 11
>> Storage Development                               56242 Marienrachdorf
>>                                                  Germany
>> Mauelshagen@RedHat.com                            PHONE +49  171 7803392
>>                                                  FAX   +49 2626 924446
>> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>>
>>
>>
>> ------------------------------
>>
>> Message: 5
>> Date: Mon, 9 Jun 2008 12:06:19 +0200
>> From: Antony MARTINEAU <Antony.MARTINEAU@lippi.fr>
>> Subject: Re: [linux-lvm] Performance tunning on LVM2
>> To: mauelshagen@redhat.com,     LVM general discussion and development
>>        <linux-lvm@redhat.com>
>> Message-ID:
>>        <OF8D53F89C.8A8CDA30-ONC1257463.00362B8A-C1257463.00377B47@lippi.fr>
>> Content-Type: text/plain; charset="us-ascii"
>>
>> Skipped content of type multipart/alternative-------------- next part --------------
>> A non-text attachment was scrubbed...
>> Name: not available
>> Type: image/gif
>> Size: 5552 bytes
>> Desc: not available
>> Url : https://www.redhat.com/archives/linux-lvm/attachments/20080609/c6399248/attachment.gif
>>
>> ------------------------------
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>
>> End of linux-lvm Digest, Vol 52, Issue 9
>> ****************************************
>>
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
> End of linux-lvm Digest, Vol 52, Issue 10
> *****************************************
>
