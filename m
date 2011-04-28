Date: Thu, 28 Apr 2011 03:53:55 -0400
From: Christoph Hellwig <hch@infradead.org>
Message-ID: <20110428075355.GA2190@infradead.org>
References: <20110412234706.GA11244@redhat.com>
	<20cf301cbef67d323104a0c2ff52@google.com>
	<20110413224025.GA18589@redhat.com>
	<20110413234854.GA19793@redhat.com>
	<20110426173213.GA19604@redhat.com>
	<20110428001912.GA14659@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20110428001912.GA14659@redhat.com>
Subject: Re: [linux-lvm] [dm-devel] [PATCH] dm snapshot: ignore discards
 issued to the snapshot-origin target
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
To: device-mapper development <dm-devel@redhat.com>
Cc: DarkNovaNick@gmail.com, LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Apr 27, 2011 at 08:19:13PM -0400, Mike Snitzer wrote:
> Discards pose a problem for the snapshot-origin target because they are
> treated as writes.  Treating a discard as a write would trigger a
> copyout to the snapshot.  Such copyout can prove too costly in the face
> of otherwise benign scenarios (e.g. create a snapshot and then mkfs.ext4
> the origin -- mkfs.ext4 discards the entire volume by default, which
> would copyout the entire origin volume to the snapshot).

You also need to make sure that we don't claim discard_zeroes_data for
the origin volume in this case.  Especially as ext4 started to rely
on this actually working (very bad idea IMHO, but that's another story)
