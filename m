Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D1C2A2895
	for <linux-lvm@redhat.com>; Sat,  7 Dec 2019 22:44:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6E0818E6C56
	for <linux-lvm@redhat.com>; Sat,  7 Dec 2019 22:44:06 +0000 (UTC)
Received: from quad.stoffel.org (66-189-75-104.dhcp.oxfr.ma.charter.com
	[66.189.75.104])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.stoffel.org (Postfix) with ESMTPSA id 2D5111E12B
	for <linux-lvm@redhat.com>; Sat,  7 Dec 2019 17:44:03 -0500 (EST)
MIME-Version: 1.0
Message-ID: <24044.11058.338208.602498@quad.stoffel.home>
Date: Sat, 7 Dec 2019 17:44:02 -0500
From: "John Stoffel" <john@stoffel.org>
In-Reply-To: <alpine.LRH.2.21.1912071532450.27214@fairfax.gathman.org>
References: <1p3erjcoc4qsk3gplvduhoep.1575740265800@gmail.com>
	<alpine.LRH.2.21.1912071532450.27214@fairfax.gathman.org>
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

Stuart> On Tue, Oct 29, 2019 at 12:14 PM Daniel Janzon <daniel.janzon@edgeware.tv> wrote:
>> I have a server with very high load using four NVMe SSDs and
>> therefore no HW RAID. Instead I used SW RAID with the mdadm tool.
>> Using one RAID5 volume does not work well since the driver can only
>> utilize one CPU core which spikes at 100% and harms performance.
>> Therefore I created 8 partitions on each disk, and 8 RAID5s across
>> the four disks.

>> Now I want to bring them together with LVM. If I do not use a striped
>> volume I get high performance (in expected magnitude according to disk
>> specs). But when I use a striped volume, performance drops to a
>> magnitude below. The reason I am looking for a striped setup is to

Stuart> The mdadm layer already does the striping.  So doing it again
Stuart> in the LVM layer completely screws it up.  You want plain JBOD
Stuart> (Just a Bunch Of Disks).

Umm... not really.  The problem here is more the MD layer not being
able to run RAID5 across multiple cores at the same time, which is why
he split things the way he did.

But we don't know the Kernel version, the LVM version, or the OS
release so as to give better ideas of what to do.

The biggest harm to performance here is really the RAID5, and if you
can instead move to RAID 10 (mirror then stripe across mirrors) then
you should be a performance boost.

As Daniel says, he's got lots of disk load, but plenty of CPU, so the
single thread for RAID5 is a big bottleneck.

I assume he wants to use LVM so he can create volume(s) larger than
individual RAID5 volumes, so in that case, I'd probably just build a
regular non-striped LVM VG holding all your RAID5 disks.  Hopefully
the Parity disk is spread across all the partitions, though NVMe
drives should have enough IOPs capacity to mask the RMW cost of RAID5
to a degree.

In any case, I'd just build it like:

  pvcreate /dev/md#     (do for each of 8 RAID5 MD devices)
  vgcreate datavg /dev/md[#-#]   (give all 8 RAID5 MD devices here.
  lvcreate -n "name" -L <size> datavg

And then test your performance.  Since you only have four disks, the 8
RAID5 volumes in your VG are all going to suck for small writes, but
NVMe SSDs will mask that to an extent.

If you can, I'd get more SSDs and move to RAID1+0 (RAID10) instead,
though you do have the problem where a double disk failure could kill
your data if it happens to both halves of a mirror.

But, numbers talk, BS walks.  So if the original poster can provide
some details and numbers... then maybe we can help more.

John
