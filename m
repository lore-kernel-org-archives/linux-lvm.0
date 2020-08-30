References: <1598544320-3198-1-git-send-email-heming.zhao@suse.com>
	<128df0c3-beeb-7f8a-e611-e1372185209c@redhat.com>
	<20200828182608.GA17233@redhat.com>
	<4cce4f81-24b6-3730-a331-8b31cf57cd51@suse.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <9858a759-7686-a7c9-6bbb-6915803b2a90@redhat.com>
Date: Sun, 30 Aug 2020 19:06:05 +0200
MIME-Version: 1.0
In-Reply-To: <4cce4f81-24b6-3730-a331-8b31cf57cd51@suse.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH] lib/metadata: add new api lv_is_available()
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "heming.zhao@suse.com" <heming.zhao@suse.com>, David Teigland <teigland@redhat.com>
Cc: linux-lvm@redhat.com

Dne 30. 08. 20 v 17:49 heming.zhao@suse.com napsal(a):
> Hello David, & Zdenek,
> 
>> For the lvs, I ever said in previous mail:
>   is it necessary to add a new letter '(N)ot_available' in bit 9 (Volume Health) for top layer LV.

Hi

Bit-attr fields are somewhat 'overloaded' and more or less 'confusing' already 
and serve rather 'quick' check purpose for skilled lvm user.

So normally you would likely either want to experiment with field:

lvs -o+lv_health_status

or maybe there is needed some extra new field
(i.e. thin,cache,vdo... has lots of explicit fields)

Having and explicit 1-purpose thing is our current 'prefered' logic.

> in my opinion, the 'not available' means the LV can't correctly do r/w io.

The main trouble with adding 'more meanings' to the existing fields is - you
have big troubles if you have existing users/scripts and they are faced with
unknown output in fields.

That's why in general the 'availability' fields should not be mixed with 
meaning about healthiness or correctness or usability or whatever else comes.

> for raid, if the missing or breaking underlying devs number beyond raid level limit. the
> 'not available' shoud be display.

In practice there is ATM quite some fuzzy land at handling all states of mdadm 
raid logic within lvm2 -  it's not clear even in mdadm context and the lvm2 
layer with it's  PV & VG model makes it even way more complicated
(as 1 PV might be broken in many different ways - far more then 'mdadm' 
meaning of present/missing).

> for linear, any one of underlying dev is missing, upper layer module like fs may don't work
> (e.g. missing first disk, fs will missing w/r first disk's super-block metadata). the
> 'not available' should be display.

Here comes the issue you might not have yet realized.

Activation code currently has intentional 'disconnection' between metadata and 
real disk state. So there is big difference if the PV is missing and lvm2 
metadata KNOWS about the thing or the disk is missing and metadata 'thinks' 
device is there.

This has very big impact on the overall complexity of the whole 'activation' 
engine - where 'partial' activation has it's own recovery purpose - but 
unfortunately due to various API not-so-good designs got mixed-in with
'raid' logic of activation with missing devices for fully usable raid.

It's basically very complex thing with no so clear path forward and it will 
require some further brainstorming how to go forward.

Then there is the 'mdadm complexity' itself - when there is not quite clear 
even for our lvm2 team which policy for missing device is the best -
is there even is lot's of different type of being 'missing' - i.e. large 
arrays can have transiently missing devs - which can be handled by md raid
code without intervention of lvm2 - but it has lots of 'dark' edges

Anyway - all I want to say here - general 'a'  attr  5
(or lvs -o+lv_active)  had originally relatively simple meaning of having 
device present/suspended in DM table - but got overcomplexed to the level that
hardly anyone can see what's going on there (see 'man lvs' attr 5 doc)
In general this design is also not quite good when 'stacking' gets used -
i.e. what is thinLV from thin-pool on cache  raid dataLV in troubles....

How the device is usable and whether it's in partial mode or any other
sort of mode is basically a very complex topic.

Note - currently there is big topic even the initial activation
of raid during boot when you have VG composed from many PVs
and and few of them are needed to raid activation and even less
for 'usable raid activation'.    Current Dracut script is unfortunately
not doing right thing...

> 
> At last, the new letter attr needs a lot of jobs to do and need to take care of various LV type.
> I can change my patch to modify lvs attr field for linear & raid type.
> But other LV types works need to do by other guys.
> 

So you are welcome to try to come with ideas - but as mentioned above generic 
solution can be really hard - so an explicit '1-purpose' thing which
can be maintained is currently the easiest small-step forward option

Zdenek
