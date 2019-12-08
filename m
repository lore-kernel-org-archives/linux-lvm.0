Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EB4E2026D69
	for <linux-lvm@redhat.com>; Sun,  8 Dec 2019 22:51:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B93C908766
	for <linux-lvm@redhat.com>; Sun,  8 Dec 2019 22:51:43 +0000 (UTC)
Received: from quad.stoffel.org (66-189-75-104.dhcp.oxfr.ma.charter.com
	[66.189.75.104])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id E26CA217AF
	for <linux-lvm@redhat.com>; Sun,  8 Dec 2019 17:51:39 -0500 (EST)
MIME-Version: 1.0
Message-ID: <24045.32379.341578.79820@quad.stoffel.home>
Date: Sun, 8 Dec 2019 17:51:39 -0500
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <alpine.LRH.2.21.1912071804540.9108@fairfax.gathman.org>
References: <1p3erjcoc4qsk3gplvduhoep.1575740265800@gmail.com>
	<alpine.LRH.2.21.1912071532450.27214@fairfax.gathman.org>
	<24044.11058.338208.602498@quad.stoffel.home>
	<alpine.LRH.2.21.1912071804540.9108@fairfax.gathman.org>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Best way to run LVM over multiple SW RAIDs?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

>>>>> "Stuart" == Stuart D Gathman <stuart@gathman.org> writes:

Stuart> On Sat, 7 Dec 2019, John Stoffel wrote:
>> The biggest harm to performance here is really the RAID5, and if you
>> can instead move to RAID 10 (mirror then stripe across mirrors) then
>> you should be a performance boost.

Stuart> Yeah, That's what I do.  RAID10, and use LVM to join together as JBOD.
Stuart> I forgot about the raid 5 bottleneck part, sorry.

Yeah, it's not ideal, and I don't know enough about the code to figure
out if it's even possible to fix that issue without major
restructuring.  

>> As Daniel says, he's got lots of disk load, but plenty of CPU, so the
>> single thread for RAID5 is a big bottleneck.

>> I assume he wants to use LVM so he can create volume(s) larger than
>> individual RAID5 volumes, so in that case, I'd probably just build a
>> regular non-striped LVM VG holding all your RAID5 disks.  Hopefully

Stuart> Wait, that's what I suggested!

Must have missed that, sorry!  Again, let's see if the original poster
can provide more details of the setup. 

>> If you can, I'd get more SSDs and move to RAID1+0 (RAID10) instead,
>> though you do have the problem where a double disk failure could kill
>> your data if it happens to both halves of a mirror.

Stuart> No worse than raid5.  In fact, better because the 2nd fault
Stuart> always kills the raid5, but only has a 33% or less chance of
Stuart> killing the raid10.  (And in either case, it is usually just
Stuart> specific sectors, not the entire drive, and other manual
Stuart> recovery techniques can come into play.)

I don't know the failure mode of NVMe drives, a bunch of SSDs didn't
so much fail single sectors as they just up and died instantly,
without any chance of recovery.  So I worry about the NVMe drive
failure modes, and I'd want some hot spares in the system if at all
possible, because you know they're going to fail just as you get home
and stop checking email... so having it rebuild automatically is a big
help.  If your business can afford it.  Can it afford not too?  :-)

John
