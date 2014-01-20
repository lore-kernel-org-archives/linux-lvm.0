Message-ID: <52DD0D54.6060704@redhat.com>
Date: Mon, 20 Jan 2014 12:49:40 +0100
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <87zjmxzmga.fsf@red.mvo.lan> <87y52fdiyp.fsf@red.mvo.lan>
In-Reply-To: <87y52fdiyp.fsf@red.mvo.lan>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Identifying useable block devices
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: marius.vollmer@redhat.com

On 01/17/2014 11:02 AM, Marius Vollmer wrote:
> [ I am not subscribed, so please keep me in CC.  I'll just reply to
>   myself, sorry for breaking the threading.
> ]
> 
> Peter Rajnoha wrote:
> 
>> For now, these flags are only documented directly in libdevmapper.h
>> (as they were only meant to direct udev rules and these situations
>> were all audited directly by communicating with other teams).  I could
>> probably add a few lines to the man page directly though as others
>> could use this even when reading udev database...
> 
> That would be great!
> 
>> However, for your purpose, I'd better use
>> DM_UDEV_DISABLE_OTHER_RULES_FLAG which just tells that everything else
>> other than DM/LVM related should skip this device.
> 
> Hmm, DM_UDEV_DISABLE_OTHER_RULES_FLAG is (now) set for thin volumes, as
> far as I can tell.  This is what lead me down this rabbit hole in the
> first place: UDisks2 _does_ ignore events for nodes with
> DM_UDEV_DISABLE_OTHER_RULES_FLAG set, and since Fedora 20, this causes
> it to ignore thin volumes.
> 
> The use of DM_UDEV_DISABLE_OTHER_RULES_FLAG or any other such flag in
> UDisks2 looked like a ugly hack to me, so I started looking for
> alternatives.
> 
> The best option seemed to be to ignore any DISABLE flag in UDisks, and
> to set UDISKS_IGNORE for LVM2 block devices that do not have the
> /dev/VG/LV symlink.
> 
> Now you say that DM_UDEV_DISABLE_OTHER_RULES_FLAG is actually the Right
> Way, but it seems to be buggy re thin volumes.  Correct?
>

Thing here is that when LVs are created then at first they have this flag
set until proper initialization is finished - meaning zeroing of any existing
signatures found on the volume before this LV can be used cleanly (otherwise,
it could happen that some scanning done outside LVM could find stale metadata
on just created LV, like FS labels, MD signatures.. whatever that might pose
a confusion about what is layed on top of the LV). Only after the signature
wiping is done, the flag is dropped and so others are free to use it as the
LV is clean now.

However, you're right that in case of thin LVs, this is set incorrectly.
The DM_UDEV_DISABLE_OTHER_RULES flag should not be there. I've fixed that:

https://git.fedorahosted.org/cgit/lvm2.git/commit/?id=91b26b63b408b7d7b4f79f0754d190783874e4cc

Thanks for spotting this!
-- 
Peter
