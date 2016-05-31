References: <1464692258.30702.376.camel@interlinx.bc.ca>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <4f3ac280-86a3-a63d-803c-5719bca79d3e@redhat.com>
Date: Tue, 31 May 2016 13:22:49 +0200
MIME-Version: 1.0
In-Reply-To: <1464692258.30702.376.camel@interlinx.bc.ca>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] thin: 235:2 pool target (735616 blocks) too small:
 expected 809216
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Brian Murrell <brian@interlinx.bc.ca>

Dne 31.5.2016 v 12:57 Brian J. Murrell napsal(a):
> I have a Fedora 23 system running (presumably, since I can't boot it to
> be 100% sure) 2.02.132 of LVM.  It has ceased to boot and reports:
>
> device-mapper: resume ioctl on (253:2) failed: Invalid argument
> Unable to resume laptop-pool00-tpool (253:2)
> thin: Data device (dm-1) dicard unsupported: Disabling discard passdown.
> thin: 235:2 pool target (735616 blocks) too small: expected 809216
> table: 253:2: thin-pool preresume failed, error = -22
>
> Any ideas what the problem could be?  I can't imagine why all of a
> sudden the pool target would be smaller than it should be.
>
> What further information can I provide to help debug (and very
> hopefully repair) this system?

Hi

Well - could you post somewhere for download 1st. MB of your
PV device?

dd if=/dev/sdX of=/tmp/upload_me bs=1M count=1

Have you already tried to restore in some way ?

Regards


Zdenek
