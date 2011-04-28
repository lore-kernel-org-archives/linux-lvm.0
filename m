Date: Thu, 28 Apr 2011 16:59:36 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20110428205935.GA24979@redhat.com>
References: <20110412234706.GA11244@redhat.com>
	<20cf301cbef67d323104a0c2ff52@google.com>
	<20110413224025.GA18589@redhat.com>
	<20110413234854.GA19793@redhat.com>
	<20110426173213.GA19604@redhat.com>
	<20110428001912.GA14659@redhat.com>
	<20110428075355.GA2190@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20110428075355.GA2190@infradead.org>
Subject: [linux-lvm] do not disable ext4 discards on first discard failure?
 [was: Re: dm snapshot: ignore discards issued to the snapshot-origin
 target]
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
To: Christoph Hellwig <hch@infradead.org>
Cc: sandeen@redhat.com, dm-devel@redhat.com, linux-ext4@vger.kernel.org, DarkNovaNick@gmail.com, linux-lvm@redhat.com

[cc'ing linux-ext4]

On Thu, Apr 28 2011 at  3:53am -0400,
Christoph Hellwig <hch@infradead.org> wrote:

> On Wed, Apr 27, 2011 at 08:19:13PM -0400, Mike Snitzer wrote:
> > Discards pose a problem for the snapshot-origin target because they are
> > treated as writes.  Treating a discard as a write would trigger a
> > copyout to the snapshot.  Such copyout can prove too costly in the face
> > of otherwise benign scenarios (e.g. create a snapshot and then mkfs.ext4
> > the origin -- mkfs.ext4 discards the entire volume by default, which
> > would copyout the entire origin volume to the snapshot).
> 
> You also need to make sure that we don't claim discard_zeroes_data for
> the origin volume in this case.  Especially as ext4 started to rely
> on this actually working (very bad idea IMHO, but that's another story)

Eric Sandeen helped me see that having the DM snapshot-origin target
return success but actually ignore discards is just bad form.

Especially when you consider that this exercise was motivated by the
fact that ext4 will disable discards on the first discard failure, see:
http://www.redhat.com/archives/dm-devel/2011-April/msg00070.html

Eric and I think it is best to revert this commit:
a30eec2 ext4: stop issuing discards if not supported by device

(though ideally ext4 would still WARN_ONCE per superblock with something
 like: "discard failed, please consider disabling discard support")

1) The user asked for discards (with '-o discard' mount option)
   - what is the real harm in coninuing to issue them even if it _seems_
     they aren't supported?
2) assuming the entire block device uniformly supports discards can
   be flawed (a DM device's discard support can vary based on logical
   offset).

Thoughts?
