Date: Fri, 30 May 2014 11:30:31 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
Message-ID: <20140530103031.GA7455@redhat.com>
References: <20140522154946.GD14236@redhat.com>
	<20140522180405.GA6361@redhat.com>
	<20140522181334.GE1302@redhat.com>
	<20140529135246.GA31293@redhat.com>
	<20140529203410.GG1954@redhat.com>
	<20140529204719.GD1302@redhat.com>
	<20140529210648.GA3955@redhat.com>
	<20140529211955.GE1302@redhat.com>
	<20140529215815.GA4183@redhat.com>
	<20140530090422.GB31293@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20140530090422.GB31293@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: thornber@redhat.com, Zdenek Kabelac <zkabelac@redhat.com>

On Fri, May 30, 2014 at 10:04:22AM +0100, Richard W.M. Jones wrote:
> On Thu, May 29, 2014 at 05:58:15PM -0400, Mike Snitzer wrote:
> > On Thu, May 29 2014 at  5:19pm -0400, Richard W.M. Jones <rjones@redhat.com> wrote:
> > > I'm concerned that would delete all the data on the origin LV ...
> > 
> > OK, but how are you testing with fio at this point?  Doesn't that
> > destroy data too?
> 
> I'm testing with files.  This matches my final configuration which is
> to use qcow2 files on an ext4 filesystem to store the VM disk images.
> 
> I set read_promote_adjustment == write_promote_adjustment == 1 and ran
> fio 6 times, reusing the same test files.
> 
> It is faster than HDD (slower layer), but still much slower than the
> SSD (fast layer).  Across the fio runs it's about 5 times slower than
> the SSD, and the times don't improve at all over the runs.  (It is
> more than twice as fast as the HDD though).
> 
> Somehow something is not working as I expected.

Additionally, I ran this command 5 times:

md5sum virt.*   # the test files

and then reran the fio test.  Since I have read_promote_adjustment == 1,
I would expect that these files should be promoted to the fast layer
by reading them several times.

However the results are still the same.  It's about twice as fast as
the HDDs, but 5 times slower than with the SDD.

Are there additional diagnostic commands I can use?

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top
