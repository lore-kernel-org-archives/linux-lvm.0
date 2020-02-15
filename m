References: <098d6e8d-2d2c-5067-1435-eefd7e2d09bc@suse.com>
	<20200214191115.GA20792@redhat.com>
	<1f438b012d606d06d77ff9a1fc3a6926@assyoma.it>
	<20200214204028.GB20792@redhat.com>
	<4d31a0bd-4456-aecd-ce19-076b1220fd77@redhat.com>
	<b1ad4af5a77d5f02d6629ee4d48a094c@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <3966a334-3406-94c2-2fce-525b7e14c353@redhat.com>
Date: Sat, 15 Feb 2020 21:19:44 +0100
MIME-Version: 1.0
In-Reply-To: <b1ad4af5a77d5f02d6629ee4d48a094c@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] commit c527a0cbfc3 may have a bug
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Gionatan Danti <g.danti@assyoma.it>
Cc: heming.zhao@suse.com, David Teigland <teigland@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 15. 02. 20 v 20:15 Gionatan Danti napsal(a):
> Il 2020-02-15 13:40 Zdenek Kabelac ha scritto:
>> Dne 14. 02. 20 v 21:40 David Teigland napsal(a):
>>> On Fri, Feb 14, 2020 at 08:34:19PM +0100, Gionatan Danti wrote:
>>>> Hi David, being filters one of the most asked questions, can I ask why we
>>>> have so many different filters, leading to such complex interactions and
>>>> behaviors?
>>>>
>>>> Don't get me wrong: I am sure you (the lvm team) have very good reasons to
>>>> do that, and I am surely missing something? But what, precisely? How should
>>>> we (end users) consider filters? Should we only use global_filter?
>>>
>>> You're right, filters are difficult to understand and use correctly. The
>>> complexity and confusion in the code is no better.� With the removal of
>>> lvmetad in 2.03 versions (e.g. RHEL8) there's no difference between filter
>>> and global_filter, so that's some small improvement.� But, I think filters
>>> should be replaced or overhauled with something easier to use and more
>>> useful at a technical level.
>>>
>>> I've created a bz about that and welcome thoughts about what a replacement
>>> should or should not be like.� With input the work is more likely to be
>>> prioritized.
>>>
>>
>> One of the 'reason' for having 2 sets of filter was the presence of
>> universal 'scanning' tool (aka udev) - which is assessing & reading
>> devices in a system and its combination with various 'VM' environments
>> where actual device are passed to guest systems on your hosting
>> machine.
>>
>> So there are many different combinations where different commands may
>> need to see different subset of devices - so i.e. your guest machine
>> should not have an impact on correctness of your 'hosting' machine no
>> matter what guess will write (i.e. duplicating signatures...)
> 
> Sure. But why having a single, valid filter set is not sufficient? In other 
> words, why/when I can not simply using global_filter, ignoring "plain" filter?

The problem with simple filter - that was 'tried' to be resolved for lvmetad was:

udev should 'see' all devices in your system - so lvmetad should know about 
all devices in the system  (even with duplicates and all sort of 
inconsistencies and garbage) - the idea was 'nice', but the actual 
implementation itself was rising more troubles that it has been solving.

But ATM - we still have sort of 'pvscan' from udev
and  lvm command run by admin - which can run with different '--config'.

So the 'current' (ATM) difference is:

global_filter -  never scan such devices on a machine

filter  -  never scan device within a single command.

and the idea is - you can have 'different' sets of command operating on 
different subset of device on your machine  - which might be useful in the 
world of 'containers' & VMs & clusters...

So while 'global_filter' should mostly never change -  the change of filter is 
kind of ok during system's lifetime.

When there is no lvmetad anymore -  having 2 different 'filter' settings is 
now 'less' fancy and both cases could be somehow solved with just a single 
filter (as there is simply no cache and there is always some scan) -
but the correctness with VMs and other bigger systems could be better handled 
with 2 filter levels -  where basically 'admin' sets  'hard' borders with
global_filter - and tools can play with 'filter' with already preselected
subset of devices...

As has been said - it's not too much useful if there are just couple of disks 
:)...

>> It's worth to note lvm2 is solving way more issues then other similar
>> device technology (i.e. mdraid, btrfs....) where it's very simple to
>> cause big confusion and data corruptions (even unnoticed) once
>> duplicates appears in your system...
>>
>> Zdenek
> 
> I never duplicate devices with mdraid, but BTRFS is so fragile that taking a 
> simple LVM snapshot of a BTRFS component device can lead to data corruption.
> 
> I really think the gold standard here is ZFS.

IMHO ZFS is 'somewhat' slow to play with...
and I've no idea how ZFS can resolve all correctness issues in kernel...

Zdenek
