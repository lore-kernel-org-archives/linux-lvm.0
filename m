Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m0OHTkLB011896
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2008 12:29:47 -0500
Message-ID: <4798CB0A.8090501@redhat.com>
Date: Thu, 24 Jan 2008 17:29:46 +0000
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] is LVM cluster-aware?
References: <4798C8D9.6020506@wpkg.org>
In-Reply-To: <4798C8D9.6020506@wpkg.org>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Tomasz Chmielewski wrote:
> Is LVM cluster-aware? Of course it's not, but... Will I loose data if I
> have a LVM physical volume replicated on two machines with DRBD, and I
> want to access two separate logical volumes on different machines?

LVM2 supports clustering with several generations of Red Hat cluster
(RHEL4 cman, RHEL5 openais with dlm or gulm locking) via the clvmd
deamon. Once a volume group is marked as clustered & the infrastructure
is set up, the tools automatically lock and unlock LVM resources across
the cluster. This prevents a tool running on one node from interfering
with another tool running at the same time on a different node.

If you need it to work with another clustering environment you'll need
to make code changes - see the code in daemons/clvmd/ for the existing
cluster types.

> I don't want to add/remove/rename/resize/etc. any volumes - just access
> them on separate machines.

As long as you never try to update the LVM metadata from two nodes at
the same time (e.g. add/remove/rename/resize etc. running on two nodes
simultaneously) then this is fine, but there is no automatic prevention
of this situation.

If/when you do need to make changes, you'll want to make sure the VG you
are working with is only active on one node.

See various threads on this mailing list & linux-cluster for further
discussion of clvmd and using LVM in a clustered environment without it.

Regards,
Bryn.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFHmMsK6YSQoMYUY94RAiXoAJ9TAFF1QbQa6bK0aycb9udk5XvXiwCffQce
T4mLoq+DEPWqOA2DODXVcuU=
=VzSD
-----END PGP SIGNATURE-----
