Message-ID: <32978.192.168.240.41.1033049145.squirrel@creative-realms.net>
Subject: Re: [linux-lvm] Debian 3.0, kernel 2.4.18 booting with a LVM root fs LVM  doesn't work
From: "Andy Baillie" <andyb@creative-realms.net>
In-Reply-To: <3D9301EF.8421C344@cti-paysloire.cnamts.fr>
References: <3D92DF4A.1625D3C4@cti-paysloire.cnamts.fr>
        <20020926125048.A2836@sistina.com>
        <3D92EFE8.CE5CEBE8@cti-paysloire.cnamts.fr>
        <20020926134718.A3083@sistina.com>
        <3D9301EF.8421C344@cti-paysloire.cnamts.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Thu Sep 26 09:18:48 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> "Heinz J . Mauelshagen" wrote:
>
>> On Thu, Sep 26, 2002 at 01:30:48PM +0200, LEBRETON Philippe wrote:
>> > "Heinz J . Mauelshagen" wrote:
>> >
>> > > On Thu, Sep 26, 2002 at 12:19:54PM +0200, LEBRETON Philippe wrote:
>> > > > hello,
>> > > >
>> > > > My configuration is :
>> > > >
>> <SNIP>
>> >
>> > yes my initrd is read-only but hox i can made initrd read-write?
>>
>> boot parameter "rw" or "read-write" in lilo.conf.
>>
>> >
>> >
>> > _______________________________________________
>> > linux-lvm mailing list
>> > linux-lvm@sistina.com
>> > http://lists.sistina.com/mailman/listinfo/linux-lvm
>> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>> --
>>
>> Regards,
>> Heinz    -- The LVM Guy --
>>
>> *** Software bugs are stupid.
>>     Nevertheless it needs not so stupid people to solve them ***
>>
>> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=->>
>> Heinz Mauelshagen                                 Sistina Software
>> Inc. Senior Consultant/Developer                       Am Sonnenhang
>> 11
>>                                                   56242 Marienrachdorf
>>                                                   Germany
>> Mauelshagen@Sistina.com                           +49 2626 141200
>>                                                        FAX 924446
>> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=->>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@sistina.com
>> http://lists.sistina.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> i change my lilo.conf :
> image=/boot/vmlinuz-2.2.18-smp
>        label=LinuxLVM
>        initrd=/boot/initrd-lvm.img
>        root=/dev/rootvg/root
>        read-write
>        ramdisk=8192
>
> The problem is the same.
> The read-write parameter is for /dev/rootvg/root not for the RAM Disk?
> And mount, vgscan can't to the RAM Disk.
> I can't mount my root filesystem because LVM is not initialize (vgscan,
> vgchange not working in RAM Disk)
>
the problem is not the root filesystem but probably the initrd filesystem.
Are you a debian user, if so the default kernel make procedures give you a
cram filesystem which is only ever read-only. The default kernel build if
Iremember rightly doesn't even have ext2 built into the kernel but loads it
as a module when running through the initrd boot process.
To get round this you will have to ensure a writable fs is built into the
kernel (not a module) and then mount the initrd image on a loopback device
then repeat with an ext2 filesystem created using mke2fs, copy from the
first loopback to the second, unmount both and compress the ext2 fs
version and copy this back to your /boot partition.
I did it a couple of times then accepted that until various changes are
made to the debian kernel build process you won't have default debian
systems able to boot into root on lvm setups. and went back to a normal
root device.
Regards
Andy


-- 
                   ---~~~===~~~---
http://www.landsofstone.org    http://194.159.1.90
telnet:mud.landsofstone.org:4801  212.46.65.2:4801
                   ---~~~===~~~---
