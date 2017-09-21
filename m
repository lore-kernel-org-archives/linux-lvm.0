MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Thu, 21 Sep 2017 16:34:19 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <943c9d2c-0dd6-5d9a-ce98-6b30d12824fc@redhat.com>
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
	<f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
	<9115414464834226be029dacb9b82236@xenhideout.nl>
	<50f67268-a44e-7cb7-f20a-7b7e15afde3a@redhat.com>
	<aca4355a-d7f3-c116-fc7b-7379f269a21a@assyoma.it>
	<B6F45B41-86FC-4810-BC40-0EEE8DD9E372@redhat.com>
	<f2e24a01b1e548b6b15db6d30596208b@xenhideout.nl>
	<595ff1d4-3277-ca5e-a18e-d62eaaf0b1a0@redhat.com>
	<9aa2d67c38af3e4042bd3f37559b799d@xenhideout.nl>
	<eb24f4de-2b58-38a4-9c8d-950a36530ed7@redhat.com>
	<2d1025d7784ab44cbc03cfe7f6778599@xenhideout.nl>
	<58f99204-d978-3f6a-9db8-b7122b30575e@redhat.com>
	<458d105938796d90f4e426bc458e8cc4@xenhideout.nl>
	<f7665fc3546d23200e9b08c6cdb67d2e@xenhideout.nl>
	<67e57de26f65447bde9e55bcf9a99ccc@xenhideout.nl>
	<d4b39ca6a299eb609f27f99e24eb7e26@assyoma.it>
	<e313e53f07abafead1713f03cf179542@xenhideout.nl>
	<45079be3-aa18-01f4-a663-7015c018e6f1@redhat.com>
	<5a579d450c0b079c3bc635eeb70e7c62@xenhideout.nl>
	<943c9d2c-0dd6-5d9a-ce98-6b30d12824fc@redhat.com>
Message-ID: <410c61eda29cf72cc9d056327c77a413@xenhideout.nl>
Subject: [linux-lvm] Clarification (and limitation) of the kernel feature I
	proposed
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Zdenek, you will believe in below email that I am advocating for max 
snapshot size.

I was not.

Only kernel feature I was suggesting was making judgement about when or 
how to refuse allocation for new chunks. Nothing else. Not based on 
consumed space, unique space consumed by volumes or snapshots.

Based only on FREE SPACE metric, not USED SPACE metric (which can be 
more complex).

When you say that freezing allocation has same effect as error target, 
you could be correct.

I will not respond to individual remarks but rewrite here below as 
summary:

- call collection of all critical volumes C.

- call C1 and C2 members of C.

- each Ci ∈ C has a number FE(Ci) for the number of free (unallocated) 
extents of that volume
- each Ci ∈ C has a fixed number RE(Ci) for the number of reserved 
extents.

Observe that FE(Ci) may be smaller than RE(Ci). E.g. a volume may have 
1000 reserved extents (RE(Ci)) but 500 free extents (FE(Ci)) at which 
point it has more reserved extents than it can use.

Therefore in our calculations we use the smaller of those two numbers 
for the effective reserved extents (ERE(Ci)).

ERE(Ci) = min( FE(Ci), RE(Ci) )

Now the total number of effective reserved extents of the pool is the 
total effective number of reserved extents of collection C.

ERE(POOL) = ERE(C) = ∑ ERE(Ci)

This number is dependent on the live number of free extents of each 
critical volume Ci.

Now the critical equation that each time will be evaluated when a chunk 
is being requested for allocation, is:

ERE(POOL) < FE(POOL)

As long as the Effective Reserved Extents of the entire pool is smaller 
than the number of Free Extents in the entire pool, nothing is the 
matter.

However, when

ERE(POOL) >= FE(POOL) we enter a critical 'fullness' situation.

This may be likened to a 95% threshold.

At this point you will start 'randomly' denying not only write requests 
for regular volumes, or writeable snapshots, but also regular read-only 
snapshots can see their allocation requests (for CoW) denied.

This would of course immediately invalidate those snapshots, if the 
write request was caused by a critical volume (Ci) that is still being 
serviced.

If you say this is not much different from replacing the volumes by 
error targets, I would agree.

As long as pool fullness is maintained, this 'denial of service' is not 
really random but consistent. However if something was done to e.g. drop 
a snapshot, and space would be freed, then writes would continue after.
