Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o95Ff7GF028327
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 11:41:07 -0400
Received: from EXHUB016-3.exch016.msoutlookonline.net
	(exhub016-3.exch016.msoutlookonline.net [207.5.72.226])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o95FeqpU028824
	for <linux-lvm@redhat.com>; Tue, 5 Oct 2010 11:40:52 -0400
Message-ID: <4CAB46FE.9050309@cfl.rr.com>
Date: Tue, 5 Oct 2010 11:40:46 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <87363.97197.qm@web120701.mail.ne1.yahoo.com>
In-Reply-To: <87363.97197.qm@web120701.mail.ne1.yahoo.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM mirror questions
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
Cc: Jay <jrharris19@yahoo.com>

On 10/4/2010 7:55 PM, Jay wrote:
> the other disk and lvcovert.    But it wouldn't work, saying I needed to
> add space on yet a third device for the log.   Either that, or I could
> keep the mirror log in memory.  Lvm would have to rebuild a 1TB mirror
> every time the system was rebooted if the log was left in memory.   That
> doesn't sound efficient.   So.   Put the log on disk.   I couldn't find
> an answer in man pages, but if the log is lost, then is the whole mirror
> lost ?   That would mean to have the benefits of a mirror, the log would
> have to be at least as reliable as the mirror itself (or
> inconsequential).   
> 
> So, another mirror would have to be built of tiny size to hold the log,
> then lvconvert can be given something like -log disk /dev/vghuh/lvtiny,
> etc..

As you have noticed, LVM mirror support is basically broken or not fully
implemented yet.  The mirror log SHOULD be stored on both legs of the
mirror in a block allocated automatically in the metadata area by lvm,
but isn't.  If you want to mirror, you should do so using mdadm and then
use the md device as an lvm pv.
