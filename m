References: <bc1ccc58-1771-183b-2d40-1d8b198fb8b5@suse.com>
	<20180109160622.GB24472@redhat.com>
	<0c7ad5f6-0399-e890-0205-281c0b9b9405@suse.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <e644fe30-4a22-225e-9f70-1d8bc48b5d7e@redhat.com>
Date: Wed, 10 Jan 2018 10:36:53 +0100
MIME-Version: 1.0
In-Reply-To: <0c7ad5f6-0399-e890-0205-281c0b9b9405@suse.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] The benefits of lvmlockd over clvmd?
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Eric Ren <zren@suse.com>

Dne 10.1.2018 v 08:11 Eric Ren napsal(a):
> Hi David,
> 
> Thanks for your explanations!
> 
> On 01/10/2018 12:06 AM, David Teigland wrote:
>> On Tue, Jan 09, 2018 at 11:15:24AM +0800, Eric Ren wrote:
>>> Hi David,
>>>
>>> Regarding the question of the subject, I can think of three main benefits of
>>> lvmlockd over clvmd:
>>>
>>> - lvmlockd supports two cluster locking plugins: dlm and sanlock. sanlock
>>> plugin can supports up to ~2000 nodes
>>> that benefits LVM usage in big virtulizaton/storage cluster,
>> True, although it's never been tried anywhere near that many.  The main
>> point hiding behind the big number is that hosts are pretty much unaware
>> of each other, so adding more doesn't have any affect, and when something
>> happens to one, others are unaffected because they are unaware.
> 
> The comments above is only talking about lvmlockd with sanlock, and it's
> because the different protocols/algorithms used by them: sanlock with Paxos,
> dlm with corosync, right?
> 
>>
>>> while dlm plugin fits HA clsuter.
>>>
>>> - lvmlockd has better design than clvmd. clvmd is command-line level based
>>> locking system, which means the
>>>   whole LVM software will get hang if any LVM command gets dead-locking
>>> issue. However, lvmlockd is *resources* based
>>> cluster locking. The resources to protect is VG and LV so that the deadlock
>>> issue will be isolated inside the resource and
>>> operations on other VG/LV can still proceed.
> 
> Is this point roughly true?
> 
>>>
>>> - lvmlockd can work with lvmetad.
>>>
>>> But, I may be wrong in some points. Could you please help correct me and
>>> complete the benefit list?
>> To me the biggest benefit is the design and internal implementation, which
>> I admit don't make for great marketing.  The design in general follows the
>> idea described above, in which hosts fundamentally operate unaware of
> 
> Sorry, "the idea described above" by me?
> 
>> others and one host never has any effect on another.  That's diametrically
> 
> For example, with clvmd the command "lvchange -ay VG/LV" will try to activate 
> the LV
> on every hosts, but with lvmlockd, we need to perform "lvchange -asy" on each 
> host :)
> 


There are couple fuzzy sentences - so lets try to make them more clear.

Default mode for 'clvmd' is to 'share' resource everywhere - which clearly 
comes from original 'gfs' requirement and  'linear/striped' volume that can be 
easily activated on many nodes.

However over the time - different use-cases got more priority so basically 
every new  dm target (except mirror) does NOT support shared storage (maybe 
raid will one day...).   So targets like snapshot, thin, cache, raid  do 
require 'so called' exclusive activation.

So here comes the difference -  lvmlockd  in its default  goes with 
'exclusive/local' activation and shared (old clvmd default) needs to be requested.

Another difference is -   'clvmd' world is 'automating' activation around the 
whole cluster (so from node A it's possible to activate volume on node B 
without ANY other command then 'lvchange).

With 'lvmlockd' mechanism - this was 'dropped' and it's users responsibility 
to initiate i.e. ssh command with activation on another node(s) and resolve 
error handling.

There are various pros&cons over each solution - both needs setups and while 
'clvmd' world is  'set & done'  lvmlockd world scripting needs to be born in 
some way.


Also ATM  'lvmetad' can't be used even with lvmlockd - simply because we are 
not (yet) capable to handle 'udev' around the cluster (and it's not clear we 
ever will).

On the positive side - we are working hard to enhance 'scanning' speed - so in 
majority of use-cases there is no real performance gain with lvmetad usage anyway.

Regards

Zdenek
