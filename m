Received: from localhost (dhcp-100-19-150.bos.redhat.com [10.16.19.150])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o9KKtUVU014067
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 20 Oct 2010 16:55:31 -0400
Date: Wed, 20 Oct 2010 16:55:30 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20101020205530.GC31510@redhat.com>
References: <4CBF4B79.9080008@cfl.rr.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4CBF4B79.9080008@cfl.rr.com>
Subject: Re: [linux-lvm] Snapshot merge in the background?
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Oct 20 2010 at  4:05pm -0400,
Phillip Susi <psusi@cfl.rr.com> wrote:

> Last night I tested out the new snapshot merge feature by taking a
> snapshot, running a dist-upgrade, then lvconvert --merge.  After
> rebooting, it merged the snapshot back into the origin, but it waited
> for the merge to complete before finishing the boot.

"Before finishing the boot"... can you be more specific?  Where was it
stopped waiting for a snapshot merge?  How did you know it was waiting
for snapshot merge?  Which distro are you using?

> Can't the merge be completed in the background while the volume is
> mounted and the boot continues?

Yes that is how it _should_ work.

Mike
