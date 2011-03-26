Received: from localhost (dhcp-100-19-150.bos.redhat.com [10.16.19.150])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p2QKUN8I019083
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2011 16:30:23 -0400
Date: Sat, 26 Mar 2011 16:30:23 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20110326203022.GA11173@redhat.com>
References: <alpine.LRH.2.00.1103260013380.25820@bmsred.bmsi.com>
	<4D8D6EAF.8050403@cox.net>
	<alpine.LRH.2.00.1103260047590.26023@bmsred.bmsi.com>
	<4D8D78D5.7050701@cox.net>
	<alpine.LRH.2.00.1103261143510.28300@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.00.1103261143510.28300@bmsred.bmsi.com>
Subject: Re: [linux-lvm] Powerfailure and snapshot consistency
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

On Sat, Mar 26 2011 at 12:07pm -0400,
Stuart D. Gathman <stuart@bmsi.com> wrote:

> On Sat, 26 Mar 2011, Ron Johnson wrote:
> 
> >>Yes, but a power failure can then mess up the ordering of write completions
> >>distributed between 2 or more PVs, which could defeat the assumptions made
> >>by your file system journaling.
> >
> >File a bug...  But against what?  LVM?  The FS?  The block layer?
> 
> It is not a bug.  Some progress can be made with barriers (similar to fsync())
> that block until all affected blocks are confirmed written on all devices
> through all levels of the storage stack (e.g. written to all legs
> of a raid1 device).  My database does an fsync after each journal batch,
> and I think it reasonable to hope that this guarantees that the writes
> from the journal batch complete before any subsequent writes.  I don't
> depend on any other ordering.
> 
> In the case of a snapshot, I believe the COW and origin blocks are written
> in parallel.  Snapshots are slow enough as it is.  :-)  So it is not
> surprising that it loses  consistency on power failure.

The cow is completed before the origin is written.  In addition, the
snapshot volume offers full support for flush (barriers) to both the
origin and snapshot devices.

Your FUD about inconsistency due to the snapshot implementation needs
to be substantiated with something more than an incoherent guesswork
theory.

That said, anything is possible.  But if you want real help you need to
be specific about which kernel you're using.  What is your underlying
hardware (and caching mode)?  And what it was you were doing at the time
of the power failure (running some FS benchmark? or what?).
