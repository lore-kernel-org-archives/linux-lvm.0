From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] disk naming
Message-ID: <1216750000.1041705320@[192.168.200.4]>
In-Reply-To: <20030104100014.GA11424@tykepenguin.com>
References: <1041610095.19844.45.camel@mosix>
 <20030103174618.Z9539@zealot.blacknet.de> <1041613503.20036.49.camel@mosix>
 <1023440000.1041619125@[192.168.200.4]>
 <20030103192045.GI18613@tykepenguin.com>
 <1121550000.1041664663@[192.168.200.4]>
 <20030104100014.GA11424@tykepenguin.com>
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
Date: Sat Jan  4 12:27:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Patrick Caulfield <caulfield@sistina.com>

> On Sat, Jan 04, 2003 at 01:17:43AM -0600, Steven Lembark wrote:
>>
>> > NOPE, NOPE, NOPE.
>> >
>> > LVM writes a UUID to each disk and uses that as the PV identifier. it
>> > does NOT matter what it is called to the kernel. (as long as the device
>> > actually visible  to the code).*
>> >
>> > I regularly plug and unplug disks around LVM systems and it works just
>> > fine.
>>
>> And you move the SCSI cards around so that their bus
>> addresses are changed w/o having any effect on LVM?
>
> No, but that makes no difference either. Linux allocates the first disk
> as sda and the second as sdb regardless of whether they are on the same
> controller or not.
>
> LVM uses the UUID to identify PVs, NOT major/minor numbers or names
> (didn't I just say that?)

But if you switch two scsi controllers around it can leave
one booted befre the other. You then end up with "sda" being
the first disk on another scsi chain. I have seen this happen
when people strip a machine and don't re-assemble the cards
in the same order -- or do and the bus is reverse-ordered on
the new system.

You can also have problems if devices on one scsi chain
has devices on it that will sometimes slow down the card's
bus scan. This shows up as machines that don't boot if
there is media in one device. The card takes longer to
init itself, the other card comes online first, and you
have a reversal of bus0 and bus1.

Since the second card is frequently a different make or
model it usually works to have that one as a module and
insmod it in the rc.sysinit or SVR4 files. At that point
you are guaranteed of getting the right card online first.


Try this on a system with two scsi cards and you'll see what
I mean: without changing anything else, switch which of the
cards the two disk chains connect to (i.e., disks on bus0
are now on bus1). Reboot the machine and see if it will boot
successfully.

The UUID is bus specific.


--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 8773 252 1080
