From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Chicken and egg problem..
Message-ID: <46460000.1006374706@dizzy>
In-Reply-To: <20011121144408.GI9907@pc.ilinx>
References: <1006347197.3bfba3bd23d95@imp.free.fr>
 <7510000.1006331425@dizzy> <20011121144408.GI9907@pc.ilinx>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Wed Nov 21 20:32:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- "Brian J. Murrell" <724b581f59b221086926026402b50126@interlinx.bc.ca>

> On Wed, Nov 21, 2001 at 02:30:25AM -0600, Steven Lembark wrote:
>>
>> The kernel panic is extactly why you probably wouldn't
>> want to use only LVM on the system.
>
> I do it.  Only my boot partition is a regular ol' partition.  I won't
> say I haven't had problems that I had to recover from in the past with
> an LVM root, but luckily enough my distro vendor's LVM support is
> decent and their BOOT kernel/media has an LVM module built for it.

Luck has a rather nasty way of running out just when
you need the system. I've spent way too much time
helping extricate people from LVM problems to run
my root file system on it. The "all LVM" systems
from HP and Sun depend on a non-braindead boot ROM
and the ability to fake out the file system with
sequentail LV's that look to the boot loader like
partitions. On HP's this lets you boot -lm, fix
things and reboot. Lacking this option on Intel
systems, I'd make a point of leaving the main boot
area on a native hardware format.

>
>> Leaving the root
>> volume (a.k.a., '/'), primary swap and probably /var on
>> the first three partitions of the boot device will make
>> your life enormously simpler in the long run.
>
> I completely disagree.  Eventually you will get to a point where an
> upgrade of your system will require more space in / or /usr and even
> just normal usage will want more space in /var.  Being able to expand
> these easily with LVM is awesome!

Who said anything about not having /usr on LVM? If the root
(basically /etc, /lib and a wholelotta mount points) is a
partition and your primary swap is also then you can boot just
as easily without LVM as with it. I've been running with / on
a 128MB partition for years and never pushed it past 50%. Same
for /var: adding a few choice mount points can reduce the need
for expanding the main storage enormously. If /var/log, for
example, is on a partition it makes life easier trying to
diagnose any problems.


> Just use a good boot disk.  You are even luckier if your distro
> vendor's stock kernel and/or media support LVM.

Even luckier than that if they're patched to exactly the
same level you are and can read your LVM system. This only
has to blow up once before you get to spend a weekend [or
worse] fixing the problem.



--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
