Date: Thu, 18 Oct 2012 15:01:15 +0100
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20121018140114.GB24912@ubuntu>
References: <CB12DB70-5C4F-4936-9EDE-BFF4096D064F@active.ee>
	<507FDA2E.8080301@redhat.com> <508003F1.8090308@shiftmail.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <508003F1.8090308@shiftmail.org>
Subject: Re: [linux-lvm] how to recover after thin pool metadata did fill up?
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
Cc: Andres Toomsalu <andres@active.ee>, Zdenek Kabelac <zkabelac@redhat.com>

On Thu, Oct 18, 2012 at 03:28:17PM +0200, Spelic wrote:
> So, supposing one is aware of this problem beforehand, at pool creation
> can this problem be worked around by using --poolmetadatasize  to
> make a metadata volume much larger than the default?
> 
> And if yes, do you have any advice on the metadata size we should use?

There are various factors that effect this.

- block size
- data dev size
- nr snapshots

The rule of thumb I've been giving is:

work out the number of blocks in your data device.  ie. data_dev_size / data_block_size.
Then multiply by 64.  This gives the metadata size in bytes.

The above calculation should be fine for people who're primarily using
thinp for thin provisioning, and not lots of snapshots.  I recommend
these people use a large block size.  eg, 4M.  I don't think this is
what lvm does by default (at one point it was using a block size of
64k).

Snapshots require extra copies of the metadata for devices.  Often the
data is shared, but the btrees for the metadata diverge as cow
exceptions occur.  So if you're using snapshots allocate more space.
This is compounded by the fact that it's often better to use small
block sizes for snapshots.

- Joe
