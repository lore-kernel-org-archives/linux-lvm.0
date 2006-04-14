Date: Fri, 14 Apr 2006 17:22:20 -0400 (EDT)
From: Paul Raines <raines@nmr.mgh.harvard.edu>
Subject: Re: [linux-lvm] LVM2, NFS and random device (major:minor) numbers
In-Reply-To: <20060414145052.GD10725@agk.surrey.redhat.com>
Message-ID: <Pine.LNX.4.62.0604141708370.4454@gate.nmr.mgh.harvard.edu>
References: <20060414145052.GD10725@agk.surrey.redhat.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Alasdair G Kergon <agk@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 14 Apr 2006, Alasdair G Kergon wrote:

> On Fri, Apr 14, 2006 at 10:08:40AM -0400, Paul Raines wrote:
>> I have a NFS server still running CentOS 4.0 (kernel 2.6.9-5.0.5.ELsmp,
>> lvm2-2.00.31-1.0.RHEL4).
>
> man exports
> /fsid

Yes, I mentioned in my email I did not considered this a viable solution
as for one it only solves the issue for NFS and not for other programs
like incremental backup that depend on a persistent device id.

Your quick short response seems to imply to me this is a common issue
and so should really be in the HOWTO and FAQ so new admins putting
up NFS servers using LVM should be pre-informed.  Especially since
is the kind of thing that will seem to work fine at the start and
then bite them in the ass later on.
