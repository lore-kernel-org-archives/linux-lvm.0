Return-Path: <glenn@gecpalau.com>
Message-ID: <3B0BAE8C.20308@gecpalau.com>
Date: Wed, 23 May 2001 21:35:24 +0900
From: Glenn Shannon <glenn@gecpalau.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Is now: Resizing & LVM shutdown
References: <Pine.LNX.4.33.0105232235480.29374-100000@UberGeek.coremetrics.com> <990663899.1165.0.camel@localhost> <3B0B548F.5020106@gecpalau.com> <20010524072941.A17828@minime.sistina.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I am sure you do...I was merely observing that it may be the same 
problem I had (due to me *improperly* copying the files from the 
physical partition to the new LVM partition) and these are the steps I 
took to resolve it.

I am betting he will see many files opened on /usr/lib.

Hopefully that is NOT the case however. I was lucky enough to have 2 
identical RedHat installs at my disposal to create a script and create 
files that my other scripts could read to redo the symlinking.

If he requires those, the I will gladly let him have them provided he 
has another machine to create the linklists from.

One of many such tools I have found a necessity from time to time :)

Glenn

Ben Lutgens wrote:

> On Wed, May 23, 2001 at 03:11:27PM +0900, Glenn Shannon wrote:
> 
>> Rupert Heesom wrote:
>> 
>>> On 23 May 2001 22:36:20 -0500, Austin Gonyou wrote:
>>> 
>>>> I'd say use reiser of XFS for your LVM partition. The grow utilities are
>>>> pretty kick ass and seem to work really well.
>>> 
> 
> I run it as my root device with reiserfs on it and don't bother with init /
> shutdown scripts. No problems.
> 
>>> 
>>> Thanks for your advice.
>>> 
>>> However, right now I need more help getting LVM to properly shut down
>>> when the PC is unmounting the disks in the /etc/rc.d/init.d/halt script.
>>> 
>>> An extract from another post of mine:
>>> 
>>> I've discovered that my /etc/rc.d/init.d/halt script is set up
>>> incorrectly for LVM.  When I previously installed LVM, I followed
>>> instructions, and put a "vgchange -an" into the halt script just after
>>> /proc is umounted.
>>> 
>>> What I'm finding now is that when I'm shutting the PC down, vgchange is
>>> complaining that it can't close the VG down because there's an active
>>> partition (something like that).  I've had a look at the halt script,
>>> and I can't figure out exactly how umounting the LV & deactivating the
>>> VG would work.
>>> 
>>> I put a tentative line right above the "/sbin/vgchange -an" saying
>>> "umount /dev/vg/root".   However, if I'm unmounting root BEFORE
>>> deactivating the VG, then the system won't find the /sbin/vgchange util
>>> will it?  
>>> 
>>>>>>  I've tried shutting the PC down with that extra "halt" script line
>>>>> 
>>> in there.  It doesn't help at all.
>>> 
>>> I do have  /boot/initrd-lvm-2.4.3.gz which is used at boot time.  This
>>> ramdisk does have /sbin/vgchange in it (which you probably know).  If
>>> root is unmounted when /sbin/vgchange is called, will the system use the
>>> ramdisk?   If so, how does it know to use it?   (I'm kinda new to
>>> figuring out how ramdisks work, I just follow instructions and they
>>> work!)
>>> 
>>> 
>>>> -- 
>>>> Austin Gonyou
>>>> Systems Architect, CCNA
>>>> Coremetrics, Inc.
>>>> Phone: 512-796-9023
>>>> email: austin@coremetrics.com
>>>> 
>>>> On 23 May 2001, Rupert Heesom wrote:
>>>> 
>>>>> As I write this, a new kernel is being compiled with the patch for
>>>>> online ext2resizing.  According to xconfig, enabling the option was
>>>>> DANGEROUS!
>>>>> 
>>>>> As I think about it, since I've installed that root ramdisk (works
>>>>> great), I don't actually need to be able to resize my LVM partition
>>>>> mounted.  Still, it's good to have a kernel with such a capability.
>>>>> 
>>>>> I'm not concerned now about UNMOUNTING / deactivating the LVM when
>>>>> shutting the PC down.  That doesn't seem to be working at all.  (See
>>>>> another post of mine re details there).
>>>>> 
>>>>> Perhaps you would know how to help me there?  I'll experiment a bit
>>>>> myself, but I'm afraid of damaging the LV, since when I reboot my PC,
>>>>> the VG is not yet deactivated!  However it _has_ happened twice now
>>>>> without a problem.
>>>>> 
>>>>> On 23 May 2001 16:56:35 -0600, Andreas Dilger wrote:
>>>>> 
>>>>>> If you patch your kernel with the online ext2 patches, you can resize
>>>>>> your root partition while it is still mounted.  You will still need a
>>>>>> reboot to install the new kernel, however, but only the one time.  See
>>>>>> http://sourceforge.net/projects/ext2resize/
>>>>>> 
>>>>>> It still isn't a bad idea to have a small non-LVM partition on one of
>>>>>> your disks which has a kernel you can boot from, along with useful
>>>>>> tools in /lib and /sbin.  I guess miniroot is such a thing.
>>>>> 
>>>> _______________________________________________
>>>> linux-lvm mailing list
>>>> linux-lvm@sistina.com
>>>> http://lists.sistina.com/mailman/listinfo/linux-lvm
>>>> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>>>> 
>> Try this:
>> 
>> Right before the line in your /etc/init.d/halt script (it may be named 
>> different than that however, like shutdown or maybe even reboot):
>> 
>> Before the line that remounts the root (/) partition read-only, put the 
>> line:
>> 
>> lsof >/lsof.output
>> 
>> Then reboot. There should be a file in / called lsof.output. Read that 
>> and it will let you know all files in use (which would be the reason 
>> that it can't unmount the partition).
>> 
>> Good luck!
>> 
>> Glenn Shannon
>> 
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@sistina.com
>> http://lists.sistina.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
