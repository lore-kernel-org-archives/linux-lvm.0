Message-ID: <4E7B1EF6.3060400@redhat.com>
Date: Thu, 22 Sep 2011 13:41:42 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
	<1316623554-28975-12-git-send-email-lczerner@redhat.com>
	<4E7B08A8.3030409@redhat.com>
	<alpine.LFD.2.00.1109221227490.4968@dhcp-27-109.brq.redhat.com>
	<4E7B1144.3050301@redhat.com>
	<alpine.LFD.2.00.1109221247570.4968@dhcp-27-109.brq.redhat.com>
In-Reply-To: <alpine.LFD.2.00.1109221247570.4968@dhcp-27-109.brq.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH 11/35] fsadm: Add "remove" command
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
To: Lukas Czerner <lczerner@redhat.com>
Cc: linux-lvm@redhat.com

Dne 22.9.2011 12:52, Lukas Czerner napsal(a):
> On Thu, 22 Sep 2011, Zdenek Kabelac wrote:
> 
>> Dne 22.9.2011 12:36, Lukas Czerner napsal(a):
>>> On Thu, 22 Sep 2011, Zdenek Kabelac wrote:
>>>
>>>> Dne 21.9.2011 18:45, Lukas Czerner napsal(a):
>>>>> Remove command allows to remove unused devices from the pool (volume
>>>>> group).
>>>>>
>>>>> Signed-off-by: Lukas Czerner <lczerner@redhat.com>
>>>>> ---
>>>>>  scripts/fsadm.sh |   82 ++++++++++++++++++++++++++++++++++++++++-------------
>>>>>  1 files changed, 62 insertions(+), 20 deletions(-)
>>>>>
>>>>> diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
>>>>> index 6617de0..4a4f625 100755
>>>>> --- a/scripts/fsadm.sh
>>>>> +++ b/scripts/fsadm.sh
>>>>> @@ -823,11 +823,12 @@ list_filesystems() {
>>>>>  	IFS=$NL
>>>>>  	local c=0
>>>>>  	for line in $(LANG=C $LVM lvs -o lv_path,lv_size,segtype --noheadings --separator ' ' --nosuffix --units k 2> /dev/null); do
>>>>> -		c=$((c+1))
>>>>>  		line=$(echo $line | sed -e 's/^ *\//\//')
>>>>>  		volume=$(echo $line | cut -d' ' -f1)
>>>>> -		volumes[$c]=$volume
>>>>> -		segtype[$c]=$(echo $line | cut -d' ' -f3)
>>>>> +		[ "$volume" == "$last_volume" ] && continue
>>>>> +		c=$((c+1))
>>>>> +		local volumes[$c]=$volume
>>>>> +		local segtype[$c]=$(echo $line | cut -d' ' -f3)
>>>>>  		detect_fs $volume
>>>>>  		detect_mounted
>>>>>  		detect_fs_size
>>>>
>>>> Could you please update/cleanup the patch set - so it doesn't rework same code
>>>> multiple times over and over ?
>>>> (It's a waste of time to review new code, which gets replaced several times
>>>> during the whole patch set)
>>>
>>> Unfortunately that is what I have mentioned in the patch 0. The main
>>> problem is that the fsadm is one file script and while adding other
>>> functionality I was building helpers and yes also changing other parts
>>> of the code.
>>>
>>> It was not possible for me make one feature, be done with it and move to
>>> the another feature. Some of them actually supports each other and not
>>> having to rebase with every change made my work significantly easier. So
>>> at this point I am not going to rework the patches, since it would take
>>> more time that actually write that code :).
>>>
>>> But, since it is a single file script, and I changed the whole thing
>>> significantly (there is not much left from the original code) I can
>>> create one big patch covering all the new features, so it will be easier
>>> for you to review it. Will that be acceptable for you ?
>>
>>
>> Yes - I could imagine in certain cases it might be useful to squash several
>> patches together to improve readability here.
>>
>> But before you change some code - please look at how it has looked and do not
>> put problem which were already resolved.
> 
> I am sorry, but I am not sure what you have in mind. Cold you be more
> specific ?

i.e. those  "$var" changes which were already fixed upstream.


> 
>>
>> Few notes for script writing:  use  "$VAR"  (since path may contain spaces)
>> Preferred way for using shell test is  'test '  instead of []
> 
> Yes, as Stephane already said, using "$var" is really what we need to
> use. I'll change it. But I am really not sure why would using 'test' be
> preferred over [] ? doing things like [ -b "$dev" ] or similar seems
> just better readable for me. But maybe I am missing something.

Well it's the preferred shell coding style used in lvm for lines like:

test 1 -eq 0 &&

instead of

[ 1 -eq 0 ] &&

And while it's not the case of bash - in some older non bash shells it's been
more often 'test' was shell builtin, and '[' is externally executed program.
(Yet, that's why bashism should be eliminated - some distros even
intentionally replace bash with something faster & lighter).
AFAIK in all cases we could probably avoid usage of bash specific extensions.
Have you tested your script on some older distros? (i.e. upstream fsadm.sh has
couple hacks around commands where its syntax changed over the time)

Zdenek
