Message-ID: <3E515E16.8050209@stamppot.demon.nl>
From: Sander Alberink <alberink@stamppot.demon.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Severe problem: data lost while adding a partition
References: <3E3C62E4.7030409@home.nl> <20030203113148.B8501@sistina.com> <3E42D82B.3070003@stamppot.demon.nl> <20030207152736.C27442@sistina.com>
In-Reply-To: <20030207152736.C27442@sistina.com>
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
Date: Mon Feb 17 16:12:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Heinz, all,

I really appreciate your help in this. However, I am rather reluctant to 
dive in and be hasty in my commands. I really don't want to destroy my 
data....
As I understand it, pvcreate -ff would re-initialize the physical 
volume. As I understand it, I will have to add them to a volume group 
again. But will the filesystem still be intact after that then?

Sorry if this sound like a beginner question to you. It very well might 
be, but I'd rather be careful....

Best regards,

Sander

>Sander,
>
>if you want to redo from scratch, "pvcreate -ff" the disks/partitions
>you want to use with LVM. Partitions need to have type 0x8E (Linux LVM).
>
>
>Regards,
>Heinz    -- The LVM Guy --
>
>
>On Thu, Feb 06, 2003 at 10:48:27PM +0100, Sander Alberink wrote:
>  
>
>>Heinz,
>>
>>Thanks for your reply, but I have some more questions....
>>
>>    
>>
>>>can you tell what you mean with
>>>'...something went horribly wron during install...' ?
>>>
>>>Any particular messages which can help analyzing this ?
>>> 
>>>
>>>      
>>>
>>Well, actually no real error messages, just a GUI installer that didn't 
>>do what I expected it to do. However, the LVM was hosed already at the 
>>time I realized something was wrong
>>
>>    
>>
>>>If you don't have any, take your most recent LVM metedata from the archive 
>>>(/etc/lvconf/ ; you've got a backup, right ?), figure out disks used as PVs
>>>with "vgcfgrestore -ll ..." and run "pvcreate -ff ..." and vgcfgresto
>>>on all of them. The archive you use shall _not_ include the recently added
>>>disk.
>>>
>>>      
>>>
>>Well, guess what? The LVM used in Mandrake doesn't make a backup copy. 
>>And of course I hadn't executed it myself.... So as such I cannot 
>>restore the exact configuration. Is pvcreate still the way to go then? 
>>Please advice!
>>
>>Best regards,
>>
>>Sander
>>
>>    
>>
>>>Regards,
>>>Heinz    -- The LVM Guy --
>>>
>>>
>>>On Sun, Feb 02, 2003 at 01:14:28AM +0100, Sander Alberink wrote:
>>> 
>>>
>>>      
>>>
>>>>Hello all,
>>>>
>>>>I write to you with a rather grave problem. I have a small LVM setup at 
>>>>home, consisting of 4 partitions. These were created by the Mandrake 8.2 
>>>> installation system. After deciding to upgrade the system to Mandrake 
>>>>9.0, I found out that I had another partition lying around which was 
>>>>also prepared for LVM use. I had meant for that disc to use later on in 
>>>> a different scheme for my /usr partition but never got around to do it.
>>>>However, during installation I decided to add it to the LVM. The idea 
>>>>was that I would extend the FS later (of course, I was not going to 
>>>>involve this LVM setup in the rest of the installation, I would do all 
>>>>that manually.)
>>>>
>>>>But as you probably guessed, something went horribly wrong during 
>>>>install time and my LVM setup is properly hosed. I wanted to re-create 
>>>>the setup, but alas: I forgot which was the disk that I added.
>>>>
>>>>The name of the LV (there was only 1) was home, the disks involved were 
>>>>/dev/hda1, /dev/hda[4-6].
>>>>
>>>>Output of pvscan:
>>>>----------------------------------------------------------------------
>>>>pvscan -- reading all physical volumes (this may take a while...)
>>>>pvscan -- walking through all physical volumes found
>>>>pvscan -- inactive PV "/dev/ide/host0/bus0/target0/lun0/part1"  is 
>>>>associated to an unknown VG (run vgscan)
>>>>pvscan -- inactive PV "/dev/ide/host0/bus0/target0/lun0/part4"  is 
>>>>associated to an unknown VG (run vgscan)
>>>>pvscan -- inactive PV "/dev/ide/host0/bus0/target0/lun0/part5"  is 
>>>>associated to an unknown VG (run vgscan)
>>>>pvscan -- inactive PV "/dev/ide/host0/bus0/target0/lun0/part6"  is 
>>>>associated to an unknown VG (run vgscan)
>>>>pvscan -- inactive PV "/dev/ide/host0/bus0/target0/lun0/part7"  is 
>>>>associated to an unknown VG (run vgscan)
>>>>pvscan -- total: 5 [1.97 GB] / in use: 5 [1.97 GB] / in no VG: 0 [0]
>>>>
>>>>-----------------------------------------------------------------------
>>>>
>>>>output of vgscan:
>>>>-----------------------------------------------------------------------
>>>>vgscan -- reading all physical volumes (this may take a while...)
>>>>vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
>>>>vgscan -- WARNING: This program does not do a VGDA backup of your volume 
>>>>group
>>>>
>>>>-----------------------------------------------------------------------
>>>>
>>>>output of pvdisplay /dev/hda1 (this partition belonged to the LV for sure)
>>>>-----------------------------------------------------------------------
>>>>pvdisplay -- getting physical volume size
>>>>--- Physical volume ---
>>>>PV Name               /dev/ide/host0/bus0/target0/lun0/part1
>>>>VG Name               home
>>>>PV Size               399.62 MB / NOT usable 3.62 MB [LVM: 121.00 KB]
>>>>PV#                   1
>>>>PV Status             NOT available
>>>>Allocatable           yes (but full)
>>>>Cur LV                1
>>>>PE Size (KByte)       4096
>>>>Total PE              99
>>>>Free PE               0
>>>>Allocated PE          99
>>>>PV UUID               NCf9U6-nqVy-zn3K-upFo-S0PB-SFqb-o2ERjs
>>>>-----------------------------------------------------------------------
>>>>
>>>>If you need any further information, please let me know!
>>>>I do hope you can help me with this, since I stand to loose a lot of 
>>>>personal data, of which exists no backup (of course, you guys probably 
>>>>hear this all the time).
>>>>
>>>>Best regards,
>>>>
>>>>Sander Alberink
>>>>        
>>>>
