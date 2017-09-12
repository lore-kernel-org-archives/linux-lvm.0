References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<872ad7be3b36e2eb0afc080fa781d84d@assyoma.it>
	<e580b78b-0aaa-d075-5009-278d26823a7c@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <e3bc609f-a1fd-e2e8-e431-4820cd9f9487@assyoma.it>
Date: Tue, 12 Sep 2017 13:34:35 +0200
MIME-Version: 1.0
In-Reply-To: <e580b78b-0aaa-d075-5009-278d26823a7c@redhat.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

On 12/09/2017 13:01, Zdenek Kabelac wrote:
> There is very good reason why thinLV is fast - when you work with thinLV -
> you work only with data-set for single thin LV.
> 
> So you write to thinLV and either you modify existing exclusively owned 
> chunk
> or you duplicate and provision new one.   Single thinLV does not care about
> other thin volume - this is very important to think about and it's 
> important for reasonable performance and memory and cpu resources usage.

Sure, I grasp that.

> I think you need to think 'wider'.
> 
> You do not need to use a single thin-pool - you can have numerous 
> thin-pools,
> and for each one you can maintain separate thresholds (for now in your own
> scripting - but doable with today's  lvm2)
> 
> Why would you want to place 'critical' volume into the same pool
> as some non-critical one ??
> 
> It's simply way easier to have critical volumes in different thin-pool
> where you might not even use over-provisioning.

I need to take a step back: my main use for thinp is virtual machine 
backing store. Due to some limitation in libvirt and virt-manager, which 
basically do not recognize thin pools, I can not use multiple thin pools 
or volumes.

Rather, I had to use a single, big thin volumes with XFS on top.

> Seems to me - everyone here looks for a solution where thin-pool is used 
> till the very last chunk in thin-pool is allocated - then some magical 
> AI step in,
> decides smartly which  'other already allocated chunk' can be trashed
> (possibly the one with minimal impact  :)) - and whole think will continue
> run in full speed ;)
> 
> Sad/bad news here - it's not going to work this way....

No, I absolutely *do not want* thinp to automatically dallocate/trash 
some provisioned blocks. Rather, I all for something as "if free space 
is lower than 30%, disable new snapshot *creation*"

> lvm2 also DOES protect you from creation of new thin-pool when the fullness
> is about lvm.conf defined threshold - so nothing really new here...

Maybe I am missing something: this threshold is about new thin pools or 
new snapshots within a single pool? I was really speaking about the latter.

>> [root@blackhole ~]# zfs destroy tank/vol1@snap1
>> [root@blackhole ~]# dd if=/dev/zero of=/dev/zvol/tank/vol1 bs=1M 
>> count=500 oflag=direct
>> 500+0 records in
>> 500+0 records out
>> 524288000 bytes (524 MB) copied, 12.7038 s, 41.3 MB/s
>> [root@blackhole ~]# zfs list -t all
>> NAME        USED  AVAIL  REFER  MOUNTPOINT
>> tank        622M   258M    96K  /tank
>> tank/vol1   621M   378M   501M  -
>>
>> # Snapshot creation now FAILS!
> 
> ZFS is filesystem.
> 
> So let's repeat again :) amount of problems inside a single filesystem 
> is not comparable with block-device layer - it's entirely different 
> world of problems.
> 
> You can't really expect filesystem 'smartness' on block-layer.
> 
> That's the reason why we can see all those developers boldly stepping 
> into the 'dark waters' of  mixed filesystem & block layers.

In the examples above, I did not use any ZFS filesystem layer. I used 
ZFS as volume manager, with the intent to place an XFS filesystem on top 
of ZVOL block volumes.

The ZFS man page clearly warns about ENOSP with sparse volume. My point 
is that, by cleaver using of the refreservation property, I can engineer 
a setup where snapshot are generally allowed, unless free space is under 
a certain threshold. In this case, the are not allowed (but newer 
automatically deleted!).

> lvm2/dm trusts in different concept - it's possibly less efficient,
> but possibly way more secure - where you have different layers,
> and each layer could be replaced and is maintained separately.

And I really trust layer separation - it is for this very reason I am a 
big fan of thinp, but its fail behavior somewhat scares me.

> ATM thin-pool cannot somehow auto-magically 'drop'  snapshots on its own.

Let me repeat: I do *not* want thinp to automatically drop anything. I 
simply what it to disallow new snapshot/volume creation when unallocated 
space is too low

> And that's the reason why we have those monitoring features provided 
> with dmeventd.   Where you monitor  occupancy of thin-pool and when the
> fullness goes above defined threshold  - some 'action' needs to happen.

And I really thank you for that - this is a big step forward.
> AFAIK current kernel (4.13) with thinp & ext4 used with remount-ro on 
> error and lvm2 is safe to use in case of emergency - so surely you can 
> lose some uncommited data but after reboot and some extra free space 
> made in thin-pool you should have consistent filesystem without any 
> damage after fsck.
> 
> There are not known simple bugs in this case - like system crashing on 
> dm related OOPS (like Xen seems to suggest... - we need to see his bug 
> report...)
> 
> However - when thin-pool gets full - the reboot and filesystem check is 
> basically mandatory  -  there is no support  (and no plan to start 
> support randomly dropping allocated chunks from other thin-volumes to 
> make space for your running one)
> 
> 
> I'd like to still see what you think is  'deadly'

Committed (fsynced) writes are safe, and this is very good. However, 
*many* application do not properly issue fsync(); this is a fact of life.

I absolutely *do not expect* thinp to automatically cope well with this 
applications - I full understand & agree that application *must* issue 
proper fsyncs.

However, recognizing that real world is quite different from my ideals, 
I want to exclude how many problems are possible: for this reason, I 
really want to prevent full thin pools even in the face of failed 
monitoring (or somnolent sysadmins).

In the past, I testified that XFS take its relatively long time to 
recognize that a thin volume is unavailable - and many async writes can 
be lost in the process. Ext4 + data=journaled did a better job, but a) 
it is not the default filesystem in RH anymore and b) data=journaled is 
not the default option and has its share of problems.

Complex systems need to be monitored - true. And I do that; in fact, I 
have *two* monitor system in place (Zabbix and custom shell based one). 
However, being bitten from a failed Zabbix Agent in the past, I learn a 
good lesson: to design system where some types of problems can not 
simply happen.

So, if in the face of a near-full pool, thinp refuse me to create a new 
filesystem, I would be happy :)

> And also I'd like to be explained what better thin-pool can do in terms
> of block device layer.

Thinp is doing a great job, and nobody wants to deny that.

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
