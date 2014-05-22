Date: Thu, 22 May 2014 19:13:34 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
Message-ID: <20140522181334.GE1302@redhat.com>
References: <20140522101837.GB14236@redhat.com> <537E0D25.7010108@redhat.com>
	<20140522152232.GC14236@redhat.com>
	<20140522154946.GD14236@redhat.com>
	<20140522180405.GA6361@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20140522180405.GA6361@redhat.com>
Subject: Re: [linux-lvm] Testing the new LVM cache feature
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: Zdenek Kabelac <zkabelac@redhat.com>, thornber@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

On Thu, May 22, 2014 at 02:04:05PM -0400, Mike Snitzer wrote:
> By default dm-cache (as is currently upstream) is _not_ going to cache
> sequential IO, and it also isn't going to cache IO that is first
> written.  It waits for hit counts to elevate to the promote threshold.
> So dm-cache effectively acts as a hot-spot cache by default.

OK, that makes sense, thanks.

I wrote about using the LVM cache feature here:

https://rwmj.wordpress.com/2014/05/22/using-lvms-new-cache-feature/#content

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v
