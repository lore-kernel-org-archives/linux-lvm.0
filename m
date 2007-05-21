Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4LGRrZW001507
	for <linux-lvm@redhat.com>; Mon, 21 May 2007 12:27:53 -0400
Received: from souja.net (souja.net [64.22.224.60])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l4LGRdMx023576
	for <linux-lvm@redhat.com>; Mon, 21 May 2007 12:27:39 -0400
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <1179763074.3696.28.camel@linux-cxyg>
References: <4641F72E.6050907@sas-clan.de> <4651769C.6050007@sas-clan.de>
	<1179763074.3696.28.camel@linux-cxyg>
Content-Type: multipart/alternative; boundary=Apple-Mail-2--405809804
Message-Id: <F206B7C7-9032-45FB-8FB5-AA111ECC8AC5@engineyard.com>
From: Jayson Vantuyl <jvantuyl@engineyard.com>
Subject: Re: [linux-lvm] f*cked up metadata on 1of3 LVM-disks
Date: Mon, 21 May 2007 09:27:33 -0700
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
To: LVM general discussion and development <linux-lvm@redhat.com>, BigMac <bigmac@sas-clan.de>


--Apple-Mail-2--405809804
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed

BigMac,

Okay, I think I have a solution, but it's your data, so beware.

First force the VG to activated.  To do this, use the -P flag  
(partial).  It will activate as much of the VG as it can find.  So,  
first:

vgscan -P
vgchange -ay -P vgdata

Then, get a backup of the metadata:

vgcfgbackup -f vgdata.lvm -P vgdata

Now, recreate the PV metadata on the damaged disk, just to get the  
UUID back:

pvcreate -ff -u 9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81 /dev/hdc

Now you should have the pv there but with inconsistent metadata.   
Now, restore the metadata from the backup we just made:

vgcfgrestore -f vgdata.lvm vgdata

If the planets are aligned and you are very lucky, you might have  
your LV back.  Good luck, and I'm curious if this will actually work.

On May 21, 2007, at 8:57 AM, Dave Wysochanski wrote:

> On Mon, 2007-05-21 at 12:38 +0200, BigMac wrote:
>> Nobody an idea how to recover the lvm meta data on the disk?
>> The data itself an the other disks are fine, just the first  
>> sectors of
>> /dev/hdc are gone by installing grub on it.
>>
>> I had a deeper look on the disk with one of those low level disk  
>> editors
>> and there are still parts of the meta-data stored on the disk.
>> It seems to be that grub messed up just the first 17 sectors of  
>> the disk.
>>
>> Regards,
>>
>> BigMac
>>
>
> I am working on a tool to do recovery and pull metadata out of the
> disks.  Maybe this will help you.
>
> You can try "pvck -v" in the latest upstream LVM code.  It does not
> extract metadata to a file yet but makes an attempt at identifying  
> areas
> on the disk that contain metadata and prints the offsets and lengths
> (you can then just dd to a file).  Since you have other PVs that are
> valid you could at least get the latest metadata off one of those,  
> then
> use vgcfgrestore with this file and uuid option.
>
> Also, can you send me the first 256K?  Something like:
> dd if=/dev/hdc of=/tmp/file.raw bs=1024 count=256 and send
> me /tmp/file.raw in an email attachment?
>
> Maybe I can enhance the extraction and/or add this case to my unit  
> test.
> Ideas on enhancements welcome.
>
>
>
>>
>>
>> BigMac schrieb:
>>> Hi lists!
>>>
>>> My fileserver stored it's data on 3 physical disks,building a
>>> volumegroup with lvm2.
>>> The mashine was running ubuntu dapper drake for a long time  
>>> without any
>>> problems but I decided to switch to ubuntu feisty fawn. Switching  
>>> from
>>> debian to dapper drake I installed and removed quite a lot of  
>>> packages,
>>> leaving a messy system, so I thought a new and clean installation  
>>> with
>>> feisty fawn might be a great idea.
>>>
>>> box config with dapper drake:
>>>
>>> hda: 120GB (PATA) systemdisk
>>> hdb: unused
>>> hdc: 250GB (PATA) part of the LVM-array
>>> hdd: 250GB (PATA) part of the LVM-array
>>> sda: 400GB (SATA) part of the LVM-array
>>> sdb: DVD-RW (PATA on additional PCI-controller UDMA-100)
>>>
>>> The additional IDE-controller was installed to be able to install  
>>> even
>>> more disks, but as I won't buy any new PATA stuff the controller was
>>> dispensable.
>>>
>>> new box config:
>>>
>>> hda: 120GB (PATA) systemdisk
>>> hdb: DVD-RW
>>> hdc: 250GB (PATA) part of the LVM-array
>>> hdd: 250GB (PATA) part of the LVM-array
>>> sda: 400GB (SATA) part of the LVM-array
>>>
>>> I exported the vg before shutting down dapper drake and while  
>>> installing
>>> festy fawn to the box I - no idea what did me do so - installed  
>>> grub to
>>> hdc. Ooops, this disk was part of the LVM array and so grub  
>>> f*cked up
>>> the lvm meta-data on hdc.
>>>
>>> After installing grub to hda the box is running fine, despite the  
>>> LVM
>>> which can't find one of the vgs volumes:
>>>
>>> Code:
>>>
>>> bigmac@knecht:~$ sudo pvscan
>>> Couldn't find device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN- 
>>> v1Eq81'.
>>> Couldn't find device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN- 
>>> v1Eq81'.
>>> Couldn't find device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN- 
>>> v1Eq81'.
>>> Couldn't find device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN- 
>>> v1Eq81'.
>>> PV /dev/hdd         VG vgdata   lvm2 [232.88 GB / 0    free]
>>> PV unknown device   VG vgdata   lvm2 [232.88 GB / 0    free]
>>> PV /dev/sda         VG vgdata   lvm2 [372.61 GB / 4.00 MB free]
>>> Total: 3 [838.38 GB] / in use: 3 [838.38 GB] / in no VG: 0 [0   ]
>>>
>>> bigmac@knecht:~$ sudo pvdisplay
>>> Couldn't find device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN- 
>>> v1Eq81'.
>>> Couldn't find device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN- 
>>> v1Eq81'.
>>> Couldn't find device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN- 
>>> v1Eq81'.
>>> Couldn't find device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN- 
>>> v1Eq81'.
>>> --- Physical volume ---
>>> PV Name               /dev/hdd
>>> VG Name               vgdata
>>> PV Size               232.88 GB / not usable 0
>>> Allocatable           yes (but full)
>>> PE Size (KByte)       4096
>>> Total PE              59618
>>> Free PE               0
>>> Allocated PE          59618
>>> PV UUID               locW5S-HNFK-b1WW-iOLt-olHl-2SNd-fmXKC8
>>>
>>> --- Physical volume ---
>>> PV Name               unknown device
>>> VG Name               vgdata
>>> PV Size               232.88 GB / not usable 0
>>> Allocatable           yes (but full)
>>> PE Size (KByte)       4096
>>> Total PE              59618
>>> Free PE               0
>>> Allocated PE          59618
>>> PV UUID               9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81
>>>
>>> --- Physical volume ---
>>> PV Name               /dev/sda
>>> VG Name               vgdata
>>> PV Size               372.61 GB / not usable 0
>>> Allocatable           yes
>>> PE Size (KByte)       4096
>>> Total PE              95388
>>> Free PE               1
>>> Allocated PE          95387
>>> PV UUID               YUJcsF-3XP7-OrbO-pITp-5z96-gw1A-DI11QS
>>>
>>>
>>> bigmac@knecht:~$ sudo vgscan
>>> Reading all physical volumes.  This may take a while...
>>> Couldn't find device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN- 
>>> v1Eq81'.
>>> Couldn't find all physical volumes for volume group vgdata.
>>> Couldn't find device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN- 
>>> v1Eq81'.
>>> Couldn't find all physical volumes for volume group vgdata.
>>> Couldn't find device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN- 
>>> v1Eq81'.
>>> Couldn't find all physical volumes for volume group vgdata.
>>> Couldn't find device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN- 
>>> v1Eq81'.
>>> Couldn't find all physical volumes for volume group vgdata.
>>> Volume group "vgdata" not found
>>>
>>> I tried multiple Live-CDs like gparted (with testdisk), Ultimate  
>>> Boot-CD
>>> and SystemRescueCd, but none could help.
>>>
>>> Any idea what to do to get the lvm up and running?
>>> How to restore the metadata on hdc?
>>>
>>> Best Regards,
>>>
>>> BigMac
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>
>>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



-- 
Jayson Vantuyl
Systems Architect
Engine Yard
jvantuyl@engineyard.com



--Apple-Mail-2--405809804
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=ISO-8859-1

<HTML><BODY style=3D"word-wrap: break-word; -khtml-nbsp-mode: space; =
-khtml-line-break: after-white-space; "><DIV>BigMac,</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV>Okay, I think I have a solution, =
but it's your data, so beware.<DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>First force the VG to =
activated.=A0 To do this, use the -P flag (partial).=A0 It will activate =
as much of the VG as it can find.=A0 So, first:</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>vgscan =
-P</DIV><DIV>vgchange -ay -P vgdata</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>Then, get a backup of the =
metadata:</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>vgcfgbackup -f vgdata.lvm =
-P vgdata</DIV><DIV><BR class=3D"khtml-block-placeholder"></DIV><DIV>Now, =
recreate the PV metadata on the damaged disk, just to get the UUID =
back:</DIV><DIV><BR class=3D"khtml-block-placeholder"></DIV><DIV>pvcreate =
-ff -u 9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81 /dev/hdc</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>Now you should have the pv =
there but with inconsistent metadata.=A0 Now, restore the metadata from =
the backup we just made:</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>vgcfgrestore -f vgdata.lvm =
vgdata</DIV><DIV><BR class=3D"khtml-block-placeholder"></DIV><DIV>If the =
planets are aligned and you are very lucky, you might have your LV =
back.=A0 Good luck, and I'm curious if this will actually =
work.</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV><DIV><DIV>On May 21, 2007, =
at 8:57 AM, Dave Wysochanski wrote:</DIV><BR =
class=3D"Apple-interchange-newline"><BLOCKQUOTE type=3D"cite"><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">On Mon, 2007-05-21 at 12:38 +0200, BigMac =
wrote:</DIV> <BLOCKQUOTE type=3D"cite"><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">Nobody an =
idea how to recover the lvm meta data on the disk?</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">The data itself an the other disks are fine, just =
the first sectors of</DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; ">/dev/hdc are gone by =
installing grub on it.</DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; min-height: 14px; =
"><BR></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">I had a deeper look on the disk =
with one of those low level disk editors</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">and =
there are still parts of the meta-data stored on the disk.</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">It seems to be that grub messed up just the first 17 =
sectors of the disk.</DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; min-height: 14px; =
"><BR></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">Regards,</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; =
">BigMac</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; min-height: 14px; "><BR></DIV> =
</BLOCKQUOTE><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; min-height: 14px; "><BR></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">I am working on a tool to do recovery and pull =
metadata out of the</DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; ">disks.<SPAN =
class=3D"Apple-converted-space">=A0 </SPAN>Maybe this will help you. =
<SPAN class=3D"Apple-converted-space">=A0</SPAN></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">You can =
try "pvck -v" in the latest upstream LVM code.<SPAN =
class=3D"Apple-converted-space">=A0 </SPAN>It does not</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">extract metadata to a file yet but makes an attempt =
at identifying areas</DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; ">on the disk that contain =
metadata and prints the offsets and lengths</DIV><DIV style=3D"margin-top:=
 0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">(you =
can then just dd to a file).<SPAN class=3D"Apple-converted-space">=A0 =
</SPAN>Since you have other PVs that are</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">valid =
you could at least get the latest metadata off one of those, =
then</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">use vgcfgrestore with this file =
and uuid option.</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; min-height: 14px; "><BR></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">Also, can you send me the first 256K?<SPAN =
class=3D"Apple-converted-space">=A0 </SPAN>Something like:</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">dd if=3D/dev/hdc of=3D/tmp/file.raw bs=3D1024 =
count=3D256 and send</DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; ">me /tmp/file.raw in an =
email attachment?</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; min-height: 14px; "><BR></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">Maybe I can enhance the extraction and/or add this =
case to my unit test.</DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; ">Ideas on enhancements =
welcome. <SPAN class=3D"Apple-converted-space">=A0</SPAN></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; =
min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; min-height: =
14px; "><BR></DIV> <BLOCKQUOTE type=3D"cite"><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; =
min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; min-height: =
14px; "><BR></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">BigMac schrieb:</DIV> =
<BLOCKQUOTE type=3D"cite"><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; ">Hi lists!</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">My =
fileserver stored it's data on 3 physical disks,building a</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">volumegroup with lvm2.</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">The =
mashine was running ubuntu dapper drake for a long time without =
any</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">problems but I decided to switch =
to ubuntu feisty fawn. Switching from</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">debian =
to dapper drake I installed and removed quite a lot of =
packages,</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">leaving a messy system, so I =
thought a new and clean installation with</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">feisty =
fawn might be a great idea.</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; min-height: =
14px; "><BR></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">box config with dapper =
drake:</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; min-height: 14px; "><BR></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">hda: 120GB (PATA) systemdisk</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">hdb: unused</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">hdc: 250GB =
(PATA) part of the LVM-array</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">hdd: 250GB =
(PATA) part of the LVM-array</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">sda: 400GB =
(SATA) part of the LVM-array</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">sdb: DVD-RW =
(PATA on additional PCI-controller UDMA-100)</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">The =
additional IDE-controller was installed to be able to install =
even</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">more disks, but as I won't buy =
any new PATA stuff the controller was</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; =
">dispensable.</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; min-height: 14px; "><BR></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">new box config:</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; min-height: =
14px; "><BR></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">hda: 120GB (PATA) =
systemdisk</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">hdb: DVD-RW</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">hdc: 250GB (PATA) part of the LVM-array</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">hdd: 250GB (PATA) part of the LVM-array</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">sda: 400GB (SATA) part of the LVM-array</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">I =
exported the vg before shutting down dapper drake and while =
installing</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">festy fawn to the box I - no =
idea what did me do so - installed grub to</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">hdc. =
Ooops, this disk was part of the LVM array and so grub f*cked =
up</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: =
0px; margin-left: 0px; ">the lvm meta-data on hdc.</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">After =
installing grub to hda the box is running fine, despite the =
LVM</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">which can't find one of the vgs =
volumes:</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; min-height: 14px; "><BR></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">Code:</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; min-height: =
14px; "><BR></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">bigmac@knecht:~$ sudo =
pvscan</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">Couldn't find device with uuid =
'9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81'.</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">Couldn't =
find device with uuid =
'9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81'.</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">Couldn't =
find device with uuid =
'9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81'.</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">Couldn't =
find device with uuid =
'9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81'.</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">PV =
/dev/hdd <SPAN class=3D"Apple-converted-space">=A0 =A0 =A0 =A0 </SPAN>VG =
vgdata <SPAN class=3D"Apple-converted-space">=A0 </SPAN>lvm2 [232.88 GB =
/ 0<SPAN class=3D"Apple-converted-space">=A0 =A0 </SPAN>free]</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">PV unknown device <SPAN =
class=3D"Apple-converted-space">=A0 </SPAN>VG vgdata <SPAN =
class=3D"Apple-converted-space">=A0 </SPAN>lvm2 [232.88 GB / 0<SPAN =
class=3D"Apple-converted-space">=A0 =A0 </SPAN>free]</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">PV /dev/sda <SPAN class=3D"Apple-converted-space">=A0 =
=A0 =A0 =A0 </SPAN>VG vgdata <SPAN class=3D"Apple-converted-space">=A0 =
</SPAN>lvm2 [372.61 GB / 4.00 MB free]</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">Total: 3 =
[838.38 GB] / in use: 3 [838.38 GB] / in no VG: 0 [0 <SPAN =
class=3D"Apple-converted-space">=A0 </SPAN>]</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; =
">bigmac@knecht:~$ sudo pvdisplay</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">Couldn't find =
device with uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81'.</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">Couldn't find device with uuid =
'9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81'.</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">Couldn't =
find device with uuid =
'9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81'.</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">Couldn't =
find device with uuid =
'9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81'.</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">--- =
Physical volume ---</DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; ">PV Name <SPAN =
class=3D"Apple-converted-space">=A0 =A0 =A0 =A0 =A0 =A0 =A0 =
</SPAN>/dev/hdd</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">VG Name <SPAN =
class=3D"Apple-converted-space">=A0 =A0 =A0 =A0 =A0 =A0 =A0 =
</SPAN>vgdata</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">PV Size <SPAN =
class=3D"Apple-converted-space">=A0 =A0 =A0 =A0 =A0 =A0 =A0 =
</SPAN>232.88 GB / not usable 0</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">Allocatable =
<SPAN class=3D"Apple-converted-space">=A0 =A0 =A0 =A0 =A0 </SPAN>yes =
(but full)</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">PE Size (KByte) <SPAN =
class=3D"Apple-converted-space">=A0 =A0 =A0 </SPAN>4096</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">Total PE<SPAN class=3D"Apple-converted-space">=A0 =A0 =
=A0 =A0 =A0 =A0 =A0 </SPAN>59618</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">Free PE <SPAN =
class=3D"Apple-converted-space">=A0 =A0 =A0 =A0 =A0 =A0 =A0 =
</SPAN>0</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">Allocated PE<SPAN =
class=3D"Apple-converted-space">=A0 =A0 =A0 =A0 =A0 =
</SPAN>59618</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">PV UUID <SPAN =
class=3D"Apple-converted-space">=A0 =A0 =A0 =A0 =A0 =A0 =A0 =
</SPAN>locW5S-HNFK-b1WW-iOLt-olHl-2SNd-fmXKC8</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">--- =
Physical volume ---</DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; ">PV Name <SPAN =
class=3D"Apple-converted-space">=A0 =A0 =A0 =A0 =A0 =A0 =A0 =
</SPAN>unknown device</DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; ">VG Name <SPAN =
class=3D"Apple-converted-space">=A0 =A0 =A0 =A0 =A0 =A0 =A0 =
</SPAN>vgdata</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">PV Size <SPAN =
class=3D"Apple-converted-space">=A0 =A0 =A0 =A0 =A0 =A0 =A0 =
</SPAN>232.88 GB / not usable 0</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">Allocatable =
<SPAN class=3D"Apple-converted-space">=A0 =A0 =A0 =A0 =A0 </SPAN>yes =
(but full)</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">PE Size (KByte) <SPAN =
class=3D"Apple-converted-space">=A0 =A0 =A0 </SPAN>4096</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">Total PE<SPAN class=3D"Apple-converted-space">=A0 =A0 =
=A0 =A0 =A0 =A0 =A0 </SPAN>59618</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">Free PE <SPAN =
class=3D"Apple-converted-space">=A0 =A0 =A0 =A0 =A0 =A0 =A0 =
</SPAN>0</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">Allocated PE<SPAN =
class=3D"Apple-converted-space">=A0 =A0 =A0 =A0 =A0 =
</SPAN>59618</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">PV UUID <SPAN =
class=3D"Apple-converted-space">=A0 =A0 =A0 =A0 =A0 =A0 =A0 =
</SPAN>9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">--- =
Physical volume ---</DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; ">PV Name <SPAN =
class=3D"Apple-converted-space">=A0 =A0 =A0 =A0 =A0 =A0 =A0 =
</SPAN>/dev/sda</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">VG Name <SPAN =
class=3D"Apple-converted-space">=A0 =A0 =A0 =A0 =A0 =A0 =A0 =
</SPAN>vgdata</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">PV Size <SPAN =
class=3D"Apple-converted-space">=A0 =A0 =A0 =A0 =A0 =A0 =A0 =
</SPAN>372.61 GB / not usable 0</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">Allocatable =
<SPAN class=3D"Apple-converted-space">=A0 =A0 =A0 =A0 =A0 =
</SPAN>yes</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">PE Size (KByte) <SPAN =
class=3D"Apple-converted-space">=A0 =A0 =A0 </SPAN>4096</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">Total PE<SPAN class=3D"Apple-converted-space">=A0 =A0 =
=A0 =A0 =A0 =A0 =A0 </SPAN>95388</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">Free PE <SPAN =
class=3D"Apple-converted-space">=A0 =A0 =A0 =A0 =A0 =A0 =A0 =
</SPAN>1</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">Allocated PE<SPAN =
class=3D"Apple-converted-space">=A0 =A0 =A0 =A0 =A0 =
</SPAN>95387</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">PV UUID <SPAN =
class=3D"Apple-converted-space">=A0 =A0 =A0 =A0 =A0 =A0 =A0 =
</SPAN>YUJcsF-3XP7-OrbO-pITp-5z96-gw1A-DI11QS</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; =
min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; =
">bigmac@knecht:~$ sudo vgscan</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">Reading all =
physical volumes.<SPAN class=3D"Apple-converted-space">=A0 </SPAN>This =
may take a while...</DIV><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; ">Couldn't find device with =
uuid '9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81'.</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">Couldn't find all physical volumes for volume group =
vgdata.</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">Couldn't find device with uuid =
'9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81'.</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">Couldn't =
find all physical volumes for volume group vgdata.</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">Couldn't find device with uuid =
'9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81'.</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">Couldn't =
find all physical volumes for volume group vgdata.</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">Couldn't find device with uuid =
'9kpWwu-LdwT-YiqV-DRPg-kSAN-plYN-v1Eq81'.</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">Couldn't =
find all physical volumes for volume group vgdata.</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">Volume group "vgdata" not found</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">I tried =
multiple Live-CDs like gparted (with testdisk), Ultimate =
Boot-CD</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">and SystemRescueCd, but none =
could help.</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; min-height: 14px; "><BR></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">Any idea what to do to get the lvm up and =
running?</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">How to restore the metadata on =
hdc?</DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; min-height: 14px; "><BR></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">Best Regards,</DIV><DIV style=3D"margin-top: 0px; =
margin-right: 0px; margin-bottom: 0px; margin-left: 0px; min-height: =
14px; "><BR></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; ">BigMac</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; =
">_______________________________________________</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">linux-lvm mailing list</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><A =
href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</A></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><A =
href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.red=
hat.com/mailman/listinfo/linux-lvm</A></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">read the =
LVM HOW-TO at <A =
href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/=
</A></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; min-height: 14px; "><BR></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; min-height: 14px; "><BR></DIV> </BLOCKQUOTE><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; min-height: 14px; "><BR></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; =
">_______________________________________________</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">linux-lvm mailing list</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><A =
href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</A></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><A =
href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.red=
hat.com/mailman/listinfo/linux-lvm</A></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">read the =
LVM HOW-TO at <A =
href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/=
</A></DIV> </BLOCKQUOTE><DIV style=3D"margin-top: 0px; margin-right: =
0px; margin-bottom: 0px; margin-left: 0px; min-height: 14px; =
"><BR></DIV><DIV style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; =
">_______________________________________________</DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; ">linux-lvm mailing list</DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; "><A =
href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</A></DIV><DIV =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; "><A =
href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://www.red=
hat.com/mailman/listinfo/linux-lvm</A></DIV><DIV style=3D"margin-top: =
0px; margin-right: 0px; margin-bottom: 0px; margin-left: 0px; ">read the =
LVM HOW-TO at <A =
href=3D"http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/=
</A></DIV> </BLOCKQUOTE></DIV><BR></DIV><BR><BR><DIV> <SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; =
"><DIV>--=A0</DIV><DIV>Jayson Vantuyl</DIV><DIV><FONT =
class=3D"Apple-style-span" size=3D"2"><SPAN class=3D"Apple-style-span" =
style=3D"font-size: 10px;"><SPAN class=3D"Apple-style-span" =
style=3D"font-size: 10px; "><SPAN class=3D"Apple-style-span" =
style=3D"font-size: 10px; ">Systems =
Architect</SPAN></SPAN></SPAN></FONT></DIV><DIV><B style=3D"font-weight: =
bold; "><A href=3D"http://www.engineyard.com"><SPAN =
class=3D"Apple-style-span" style=3D"font-weight: normal;; color: rgb(0, =
0, 238); -khtml-text-decorations-in-effect: underline; "><SPAN =
class=3D"Apple-style-span" style=3D"color: rgb(0, 0, 238); =
-khtml-text-decorations-in-effect: underline; ">Engine =
Yard</SPAN></SPAN></A></B></DIV><DIV><FONT class=3D"Apple-style-span" =
size=3D"2"><SPAN class=3D"Apple-style-span" style=3D"font-size: =
10px;"><SPAN class=3D"Apple-style-span" style=3D"font-size: 10px; =
"><SPAN class=3D"Apple-style-span" style=3D"font-size: 10px; "><A =
href=3D"mailto:jvantuyl@engineyard.com">jvantuyl@engineyard.com</A></SPAN>=
</SPAN></SPAN></FONT></DIV></SPAN><BR =
class=3D"Apple-interchange-newline"></SPAN></SPAN> =
</DIV><BR></BODY></HTML>=

--Apple-Mail-2--405809804--
