From: Dietmar Maurer <dietmar@proxmox.com>
Date: Mon, 28 Nov 2011 06:20:17 +0000
Message-ID: <24E144B8C0207547AD09C467A8259F753ECB683A@lisa.maurer-it.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] clvm, snapshots and live migration
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
To: Vladislav Bogdanov <bubble@hoster-ok.com>, "cluster-devel@redhat.com" <cluster-devel@redhat.com>, "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Hi all,

I started this thread on the wrong (cluster-devel) mailing list. So I post it in
the linux-lvm list to correct that mistake:

> > We use clvm and store VM images on shared storage, and our backup tool
> > uses LVM snapshots, which seems to require that we exclusively lock the LVs.
> >
> > But live migration requires that we activate the LVs on two nodes, so this
> conflicts with exclusive locks.
> >
> > So is there a way to convert the exclusive lock into a local lock. I get an error
> when try that.
> >
> > For example:
> >
> > First acquire an exclusive lock:
> > # lvchange -aey vmdisks/vm-102-disk-1
> >
> > I now want to change that into an local lock:
> >
> > # lvchange -aly vmdisks/vm-102-disk-1
> >   Error locking on node proxmox-7-60: Device or resource busy
> >
> > Is there a way to do that? What is the reasoning behind not allowing that?
> 
> Not actually an answer.
> After migration you'd need to convert lock opposite way.
> One problem I see here is that if we upgrade local lock to exclusive, then we
> need either to force other nodes to drop their local lock unless LV is used or just
> fail.

Yes - the idea is that the migration tool release the lock on the other node.

So after migration only the target node holds a local lock, and we can upgrade
that lock to exclusive without problems.

> Probably lvm list is a better place for such discussions?

Sure, you are right (just noticed that I posted to the wrong list).

- Dietmar
