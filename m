Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9N8dvMo013224
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2006 04:39:57 -0400
Received: from bluewhale.planbit.co.uk (82-71-36-240.dsl.in-addr.zen.co.uk
	[82.71.36.240])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9N8dtNb016025
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2006 04:39:55 -0400
Received: from wolverine (unknown [192.168.1.127])
	by bluewhale.planbit.co.uk (Postfix) with ESMTP id CAD7112EE2
	for <linux-lvm@redhat.com>; Mon, 23 Oct 2006 09:39:44 +0100 (BST)
From: "Roger Lucas" <roger@planbit.co.uk>
Subject: RE: [linux-lvm] Re: [RFC] Reverting "bd_mount_mutex" to "bd_mount_sem"
Date: Mon, 23 Oct 2006 09:39:38 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1160493546.3000.303.camel@laptopd505.fenrus.org>
Message-Id: <20061023083944.CAD7112EE2@bluewhale.planbit.co.uk>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Hi,

Checking through the code, I think that the semaphore -> mutex change was introduced in the original 2.6.17 kernel release.  If it
has problems, then it will affect all 2.6.17 and 2.6.18 kernels as the mutex code is still in the 2.6.18.1 release.

Can someone explain under what conditions this bug will occur and what its impact is?  We are currently using the 2.6.16.20 kernel
(which seems OK) but were keen to move to 2.6.18 as it has the new SATA hotplug ability.  We use LVM and dmapper heavily, however,
so don't want to switch if there are issues with it.

Alternatively, would locally updating the 2.6.18.1 kernel with Srinivasa's patch be sensible to restore the 2.6.16 style semaphore
code (which does seem to be stable)?

Thanks,

Roger

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Arjan van de
> Ven
> Sent: 10 October 2006 16:19
> To: Srinivasa Ds
> Cc: Eric Sandeen; linux-kernel@vger.kernel.org; dm-devel@redhat.com; linux-lvm@redhat.com; Ingo
> Molnar; agk@redhat.com
> Subject: [linux-lvm] Re: [RFC] Reverting "bd_mount_mutex" to "bd_mount_sem"
> 
> On Tue, 2006-10-10 at 20:34 +0530, Srinivasa Ds wrote:
> > Eric Sandeen wrote:
> > > Ingo Molnar wrote:
> > >
> > >> * Srinivasa Ds <srinivasa@in.ibm.com> wrote:
> > >>
> > >>
> > >>>   On debugging I found out that,"dmsetup suspend <device name>" calls
> > >>> "freeze_bdev()",which locks "bd_mount_mutex" to make sure that no new
> > >>> mounts happen on bdev until thaw_bdev() is called.
> > >>>   This "thaw_bdev()" is getting called when we resume the device
> > >>> through "dmsetup resume <device-name>".
> > >>>   Hence we have 2 processes,one of which locks
> > >>> "bd_mount_mutex"(dmsetup suspend) and Another(dmsetup resume) unlocks
> > >>> it.
> > >>>
> > >> hm, to me this seems quite a fragile construct - even if the
> > >> mutex-debugging warning is worked around by reverting to a semaphore.
> > >>
> > >> 	Ingo
> > >>
> > >
> > > Ingo, what do you feel is fragile about this?  It seems like this is a
> > > reasonable way to go, except that maybe a down_trylock would be good if
> > > a 2nd process tries to freeze while it's already frozen...
> > >
> > > Thanks,
> > >
> > > -Eric
> > >
> > Ingo, As per the discussion resending the patch with down_trylock.
> 
> Hi,
> 
> I still think that effectively exporting this semaphore to userspace is
> a big design mistake; but at least it can't be a mutex for this reason
> so the patch is sane in that regard...
> 
> Greetings,
>    Arjan van de Ven
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
