Message-ID: <20040108163409.A3963@cs.mcgill.ca>
From: Navindra Umanee <navindra@cs.mcgill.ca>
Subject: Re: [linux-lvm] setting VG UUID
References: <20040107065801.A27995@cs.mcgill.ca> <20040107092415.A28215@cs.mcgill.ca> <20040108212542.GF23918@homer.msp.redhat.com>
Mime-Version: 1.0
In-Reply-To: <20040108212542.GF23918@homer.msp.redhat.com>; from Alasdair G Kergon on Thu, Jan 08, 2004 at 03:25:42PM -0600
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
Date: Thu Jan  8 16:35:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Alasdair G Kergon <agk@redhat.com> wrote:
> > So much for universal uniqueness...
> The VG UUIDs *are* meant to all be the same on devices that are part of the
> same VG.  It's the PV UUIDs that differ.

Oh, I realise that.  Just a small joke about my non-random choice of
UUID... :)

> > For the record, I created my LVM1 partitions with Linux Mandrake 9.2.
> Could /dev/urandom have been missing when pvcreate was run?
> We think that would explain the symptoms.

Good thought!  It's very possible since of course only a crippled
environment is available at install time.  I'll try to verify it
later.

> > Should "vgchange -a n" maybe clean up these symlinks?
> It's supposed to do.

Hmmm.  I've hacked my init scripts to do it in the meanwhile, but I
will pay closer attention to what happens next time I boot and report
back.

Happily, so far I don't see any reason to go back to Linux 2.4 though
and a quite a few reasons to stay in 2.6....

Cheers,
Navin.
