Message-ID: <891f3b74ead41e1fa86471e1085d6b4a8253da80.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
Date: Tue, 25 Jun 2019 09:56:24 +0200
In-Reply-To: <60982841-fabc-71d9-b8b1-6d98b87ba738@suse.com>
References: <3cc84c6a-62d0-96c2-cf6e-9181577f9802@suse.com>
	<662c133e-cebe-1882-a086-edb2219af7f0@redhat.com>
	<4e175852-fd38-2096-a174-046e10af941f@suse.com>
	<8b345d98-abf5-b3f8-50fc-5d86d20fd060@redhat.com>
	<c7b1ca31-b1b5-4964-1263-65b97ec3ed8d@suse.com>
	<d94cb5bd-b327-89e7-ceba-1f53060d060e@redhat.com>
	<448f9dc9-98c0-df99-d527-189bd2aa7a30@suse.com>
	<60982841-fabc-71d9-b8b1-6d98b87ba738@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] confused with lvm2 filter rules
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>, Heming Zhao <heming.zhao@suse.com>
Cc: Martin Wilck <mwilck@suse.de>, David Teigland <teigland@redhat.com>

Hello Zdenek,

On Tue, 2019-06-25 at 05:30 +0000, Heming Zhao wrote:
> Hello Zdenek,
> 
> I raise this topic again. Lvm should have bug in filter code.
> Let me show the example.
> 
> filter = [ "a|^/dev/sd.*|", "r|.*|" ]
> As document description, above filter rules:
>   deny all the devices except "/dev/sd.*"
> 
> issue:
>   pvcreate executes successfully with "/dev/disk/by-id/xxx", but 
> vgextend doesn't.
> 
> expect result:
>   pvcreate should deny the device "/dev/disk/by-id/xxx".
> 

I disagree with Heming in this point. IMO both pvcreate and vgextend
should accept the device because of the first "a" rule. In any case,
it's obviously wrong that the two tools behave differently.

Note also that this difference occurs only if lvmetad is used. Without
lvmetad, both commands accept the device. The reason is that in this
case, lvmcache_label_scan(), which also builds the alias tree, is
called before applying the filter. With lvmetad OTOH,
lvmcache_label_scan() is basically a noop.

IMO this should be fixed by adding a call to
lvmcache_seed_infos_from_lvmetad() before applying the device filter to
vgextend. vgcreate() calls it early on, right after
lvmcache_label_scan(); the same might work for vgextend as well.
Alternatively, it might be possible to add a call to 
lvmcache_seed_infos_from_lvmetad() to pvcreate_each_device(); in that
case it might even be possible to remove the early calls in vgcreate().
I don't understand the initialization sequence of LVM2 commands well
enough to create a patch myself. Besides vgextend, other LVM2 commands
that need to apply the filter may be affected, too, as 
lvmcache_seed_infos_from_lvmetad() seems to be used only in a few hand-
selected code paths.

I suspect that this problem came to be in David's "label_scan" patch
series in April 2018. But we haven't verified that yet. I've put David
on CC.

> 
> analysis:
> 
> vgextend log excerpt: the aliases DB is built up _after_ applying
> the I've put
> filter, which falsely rejects the device.
> ```log
>   lvmcmdline.c:2888    Processing command: vgextend -vvvv -dddddd -t 
> testvg /dev/disk/by-id/scsi-36001405bbbdf17a69ad46ffb287a3340-part3
>   device/dev-cache.c:723     Found dev 8:35 
> /dev/disk/by-id/scsi-36001405bbbdf17a69ad46ffb287a3340-part3 - new.
>   filters/filter-regex.c:172 
> /dev/disk/by-id/scsi-36001405bbbdf17a69ad46ffb287a3340-part3:
> Skipping 
> (regex)
>   filters/filter-persistent.c:346     filter caching bad 
> /dev/disk/by-id/scsi-36001405bbbdf17a69ad46ffb287a3340-part3
>   ...
>   device/dev-cache.c:1212    Creating list of system devices.
>   device/dev-cache.c:763     Found dev 8:35 /dev/sdc3 - new alias
>   device/dev-cache.c:763     Found dev 8:35 
> /dev/disk/by-id/iscsi-iqn.2018-06.de.suse.mwilck:sles15u-sp1-
> 01_i_iface:default-1--iqn.2018-06.de.suse.zeus:01_t_0x1-lun-3-part3 
> - new alias.
> ```
> 
> vgcreate: the aliases DB is built up before applying the filter,
> which 
> works correctly now.
> ```log
>   lvmcmdline.c:2888    Processing command: vgcreate -vvvv -dddddd -t 
> tvg1 /dev/disk/by-id/scsi-36001405bbbdf17a69ad46ffb287a3340-part3
>   device/dev-cache.c:1212    Creating list of system devices.
>   device/dev-cache.c:723     Found dev 8:35 /dev/sdc3 - new.
>   device/dev-cache.c:763     Found dev 8:35 
> /dev/disk/by-id/iscsi-iqn.2018-06.de.suse.mwilck:sles15u-sp1-
> 01_i_iface:default-1--iqn.2018-06.de.suse.zeus:01_t_0x1-lun-3-part3 
> - new alias.
>   filters/filter-persistent.c:312     /dev/sdc3: filter cache using 
> (cached good)
> ```
> 
> pvcreate will convert "/dev/disk/by-id/xxx" into another name 
> "/dev/sdX", which can pass the filter rule.

A bit more precisely: when running pvcreate (or vgcreate), by the time
the filter is called, "/dev/sdX" has been added to the list of aliases
and thus the device is accepted, whereas in a vgextend run, the list of
aliases has not been built up yet, and contains only a single member
"/dev/disk/by-id/...", which is rejected.

Regards,
Martin

-- 
Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
SUSE Linux GmbH, GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
