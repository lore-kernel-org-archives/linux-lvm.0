Date: Tue, 12 Feb 2013 10:10:46 -0500
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20130212151046.GB10702@redhat.com>
References: <511A58B0.3080509@ubuntu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <511A58B0.3080509@ubuntu.com>
Subject: Re: [linux-lvm] Data alignment
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
To: Phillip Susi <psusi@ubuntu.com>
Cc: linux-lvm@redhat.com

On Tue, Feb 12 2013 at  9:58am -0500,
Phillip Susi <psusi@ubuntu.com> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> I have been getting warnings from mke2fs lately that my logical
> volumes are not aligned properly.  I am using a raid5 array as a pv
> and it has a 1.5 MB stripe width, so logical volumes should be aligned
> to that, but it appears lvm is not doing this.
> 
> It looks like you can specify this alignment at pvcreate time, but I
> don't think I did and it doesn't seem to have been picked up
> automatically.  Is there a way to change this without rebuilding the vg?

Please provide the version of lvm2 that you're using.

For MD raid5, lvm2 should pick up the alignment without any manual flags
being required.  The manual flags are only required for users who have
hardware raid where the minimum_io_size and optimal_io_size isn't
populated in /sys/block/<dev>/queue/

But MD does populate those and lvm2 should definitely consume them when
laying out the data area of a PV.  You should be able to see what
pvcreate determines the {minimum,optimal}_io_size to be by running:
pvcreate -vvvv <args>

But no, after the data area is established there is no way to change the
alignment after the fact.
