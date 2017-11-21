References: <dc362b54-42cf-025d-ec3a-22e14abc4745@suse.com>
	<20171120161007.GA29888@redhat.com>
From: Eric Ren <zren@suse.com>
Message-ID: <f77fe769-5bb9-58c4-89ca-7a707a78deac@suse.com>
Date: Tue, 21 Nov 2017 12:11:44 +0800
MIME-Version: 1.0
In-Reply-To: <20171120161007.GA29888@redhat.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Subject: Re: [linux-lvm] lvmlockd: how to convert lock_type from sanlock to
	dlm?
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
To: David Teigland <teigland@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

David,

> First you'll need this recent fix:
> https://sourceware.org/git/?p=lvm2.git;a=commitdiff;h=f611b68f3c02b9af2521d7ea61061af3709fe87c
>
> --force was broken at some point, and the option is now --lockopt force.

Thanks!

> To change between lock types, you are supposed to be able to change to a
> local VG, then from local to the other lock type.  The man page sections:
>
>    changing a lockd VG to a local VG
>    changing a local VG to a lockd VG
>
> But it looks like a fix is needed in those instructions.  I believe
> "vgchange --lock-type none <vgname>" needs to include --lockopt force.
> If you could verify this for me, I'll update the man page.

It works! I did as the following:

"""
sle15-c1-n1:~ # vgs
   Reading VG vg1 without a lock.
   VG  #PV #LV #SN Attr   VSize  VFree
   vg1   1   1   0 wz--ns 19.97g 18.72g
sle15-c1-n1:~ # vgchange --lock-type none vg1
   Cannot access VG vg1 due to failed lock.
sle15-c1-n1:~ # vgchange --lock-type none --lockopt force vg1
Forcibly change VG lock type to none? [y/n]: y
   Volume group "vg1" successfully changed
sle15-c1-n1:~ # vgchange --lock-type dlm vg1
   Volume group "vg1" successfully changed
sle15-c1-n1:~ # vgs
   Reading VG vg1 without a lock.
   VG  #PV #LV #SN Attr   VSize  VFree
   vg1   1   1   0 wz--ns 19.97g 18.72g
sle15-c1-n1:~ # vgs -o+lock_type
   Reading VG vg1 without a lock.
   VG  #PV #LV #SN Attr   VSize  VFree  LockType
   vg1   1   1   0 wz--ns 19.97g 18.72g dlm
sle15-c1-n1:~ # vgchange --lockstart
   VG vg1 starting dlm lockspace
   Starting locking.  Waiting until locks are ready...
sle15-c1-n1:~ # lvs
   LV   VG  Attr       LSize Pool Origin Data%  Meta%  Move Log Cpy%Sync 
Convert
   lv1  vg1 -wi------- 1.00g
"""

Thanks,
Eric
