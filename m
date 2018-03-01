References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<fa8b9d2e-6f1f-d201-263a-48178815a055@assyoma.it>
	<2f9c4346d4e9646ca058efdf535d435e@xenhideout.nl>
	<f934657c1724caba1c432cace2f0ca69@assyoma.it>
	<5df13342-8c31-4a0b-785e-1d12f0d2d9e8@redhat.com>
	<e12f977563bfccf0a2a39aa3e53b9cf4@assyoma.it>
	<b1b73e21196be7c50daa098b2724880a@xenhideout.nl>
	<6dd12ab9-0390-5c07-f4b7-de0d8fbbeacf@redhat.com>
	<3831e817d7d788e93a69f20e5dda1159@xenhideout.nl>
	<0ab1c4e1-b15e-b22e-9455-5569eeaa0563@redhat.com>
	<51faeb921acf634609b61bff5fd269d4@xenhideout.nl>
	<4b4d56ef-3127-212b-0e68-00b595faa241@redhat.com>
	<bd9a12f33412163e9c65b4a9b78eeb4f@xenhideout.nl>
	<6dd3a268-8a86-31dd-7a0b-dd08fdefdd55@redhat.com>
	<9142007eeb745a0f4774710b7c007375@assyoma.it>
	<eea26091-40e7-8f31-e4ba-dfab059f3d70@redhat.com>
	<0a322a6f355a0744427f2a7a45162c81@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <c5f98473-1dad-b48e-ef3f-b311e5de2ee9@redhat.com>
Date: Thu, 1 Mar 2018 09:31:02 +0100
MIME-Version: 1.0
In-Reply-To: <0a322a6f355a0744427f2a7a45162c81@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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
To: Gionatan Danti <g.danti@assyoma.it>
Cc: Xen <list@xenhideout.nl>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 1.3.2018 v 08:14 Gionatan Danti napsal(a):
> Il 28-02-2018 22:43 Zdenek Kabelac ha scritto:
>> On default - full pool starts to 'error' all 'writes' in 60 seconds.
> 
> Based on what I remember, and what you wrote below, I think "all writes" in 
> the context above means "writes to unallocated areas", right? Because even 
> full pool can write to already-provisioned areas.

yes

> 
>> The main problem is - after reboot - this 'missing/unprovisioned'
>> space may provide some old data...
> 
> Can you elaborate on this point? Are you referring to current behavior or to 
> an hypothetical "full read-only" mode?

If the tool wanted to write  1sector  to 256K chunk that needed provisioning,
and provisioning was not possible - after reboot - you will still see
the 'old' content.

In case of filesystem, that does not stop upon 1st. failing write you then can 
see a potential problem since  fs could issue writes - where halve of them
were possibly written and other halve was errored - then you reboot,
and that 'error' halve is actually returning 'some old data' and this can make 
filesystem seriously confused...
Fortunately both ext4 & xfs both have now correct logic here for journaling,
although IMHO still not optimal.

> True, but this not disprove the main point: snapshots are a invaluable tool in 
> building your backup strategy. Obviously, if thin-pool meta volume has a 
> problem, than all volumes (snapshot or not) become invalid. Do you have any 
> recovery strategy in this case? For example, the root ZFS uberblock is written 
> on *both* device start and end. Does something similar exists for thinp?

Unfortunately losing root blocks on thin-pool metadata is a big problem.
That's why metadata should be rather on some resilient fast storage.
Logic of writing should not let data corrupt (% broken kernel).

But yes - there is quite some room for improvement in thin_repair tool....

>> There are also some on going ideas/projects - one of them was to have
>> thinLVs with priority to be always fully provisioned - so such thinLV
>> could never be the one to have unprovisioned chunks....
>> Other was a better integration of filesystem with 'provisioned' volumes.
> 
> Interesting. Can you provide some more information on these projects?

Likely watching Joe's pages (main thin-pool creator) and whatever XFS groups 
is working on....

Also note - we are going to integrate VDO support - which will be a 2nd. way 
for thin-provisioning with different set of features - missing snapshots, but 
having compression & deduplication....

Regards

Zdenek
