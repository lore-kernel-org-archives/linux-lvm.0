Message-Id: <3C42F587.3060907@liberate.com>
From: Chris Worley <cworley@liberate.com>
MIME-Version: 1.0
Subject: [linux-lvm] Fun little horror story -- please add to FAQ if it
    isn't already documented
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
Date: Mon Jan 14 08:51:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com, ben@bens-house.org.uk

Sorry for the late reply... I don't subscribe to the list.

You've got to change the device minor number associated with the lvm 
partition.  I.E. if you partition name is /dev/foo/system, then you've 
got to get it to have the same minor device number vgscan is going to 
give during initrd.

If you're booted from some sort of rescue system that has a different 
root, "mount" your lvm root file system, "cd" to the directory where 
mounted, "chroot ." in that directory, manually delete and recreate 
(using "mknod") the /dev/foo/system file, with the correct minor 
number (the one vgscan is going to assign when initrd is running), 
then re-run lilo.

Note that this assumes that you've got a different root file system 
than the one you want, and the one you want won't boot because you 
deleted a lv with a lower minor number than your root partition.

<rant>I still think this should be documented under lvremove</rant>

Chris

Ben Holness writes:

>> Upon the next reboot, the initrd ran fine... found and activated the
>> lv's... but the kernel said "no root partition" and hung.  I could
>> rescue boot the system from the SuSE CD -- everything was there... I
>> finally added a "vgdisplay -v" to the initrd's linuxrc, and
>> that showed me the problem.
>>
>> The file system it was trying to mount was, to lilo, the device "3a:03"
>> (major device number 58, minor 3), but, once I'd removed the old lv for
>> extra disk space, any new vgscan during initrd assigned my new root lv
>> to minor device number 2.  "root=/dev/..." doesn't help, for lvm (it
>> doesn't like the name).  There was no longer an lvm minor device 3 to
>> mount.
> 
> This looks like the same problem that I am having, although I haven't
> removed any logical volumes!
> 
> I am not 100% sure how to find the device number, but common sense tells me
> that it is the "Block #" at the bottom of the logical volume information, in
> which case my root LV is Block # 58:1
> 
>> Once I saw the problem, I recue booted and chrooted to my new lvm, and
>> manually changed the minor number before running lilo.
> 
> Please can you tell me how you changed this?
