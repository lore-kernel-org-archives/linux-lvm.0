Return-Path: <slpratt@us.ibm.com>
Subject: Re: [linux-lvm] LVM Snapshots & journal recovery
Message-ID: <OF0CE9A252.6B27B7A4-ON85256A55.0059D974@raleigh.ibm.com>
From: "Steve Pratt" <slpratt@us.ibm.com>
Date: Wed, 23 May 2001 11:39:28 -0500
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Joe Thornber <thornber@btconnect.com>, adilger@turbolinux.com, linux-fsdevel@vger.kernel.org

Peter Braam wrote:
>Thanks for explaining this.

>That's still not good enough, but better: you must also wait for the
>redirection table to be stable on disk before you can overwrite the
>origin device.

>So journal recovery can indeed work if LVM snapshots wait twice:

> - first for the copied disk to become stable on disk
> - then for the redirection to become stable on disk

>at that point one can safely over-write the origin.

>First, looking at the code, I don't think that this is happening at all.
>Second, to have these two extra waits seems really quite a bad penalty to
>me.

>- Peter -

Peter, I fail to see how your proposed method of remapping writes to the
original to the snapshot volume avoids the synchronous write penalties.

For example in your scenario, the filesystem journal itself will have to be
written to the snapshot volume, so in order to ensure journal consistency
you will need to write the remapping meta data synchronously with the
remapped journal chunk or you would not know that the journal had been
remapped.  Both writes must done synchronously or you have possible
corruption.

In addition to having to do the same number of synchronous writes, you have
the additional penalty that you mentioned of the sync time when deleting
the snapshot.  This resyncing also come with a whole new set of consistency
issues (whole new code path)

Also, you have moved the remapping lookup processing time penalty for reads
from the snapshot to the original.  I think it is much better to optimize
the access to the original as opposed to the snapshot for most cases.


Steve

EVMS Development - http://www.sf.net/projects/evms
Linux Technology Center - IBM Corporation
(512) 838-9763  EMAIL: SLPratt@US.IBM.COM
