Date: Mon, 4 Jun 2018 10:34:34 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20180604153434.GB19875@redhat.com>
References: <CAANaKqdnGfgxxHwQVA+L3uNDe5aMydssLius94wcp6LxA1-w+g@mail.gmail.com>
	<CAANaKqdPjq9sK=DvZjDDSm8Vd_28C1k2i2xLyTrkFzwVq69NZw@mail.gmail.com>
	<CAANaKqdRgfcZvUZXUgwSX-WXaQ0K=yg6ubDGwRkMk8mU+bDpUw@mail.gmail.com>
	<CAANaKqcv2bF1X1S3L5xi-7HOsV2J29a4BvhMjiqwigRm2SGbVw@mail.gmail.com>
	<CAANaKqd98zjbv2Mh60aeny=UL8oMGadGcLUXgOURbQmnFxojEA@mail.gmail.com>
	<CAANaKqeKDaBcAHAh91ycm9SwB0gDD+cNHqsAVkW6y-RzNzgifg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAANaKqeKDaBcAHAh91ycm9SwB0gDD+cNHqsAVkW6y-RzNzgifg@mail.gmail.com>
Subject: Re: [linux-lvm] "write failed.. No space left", "Failed to write VG",
 and "Failed to write a MDA"
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
To: Jim Haddad <jimhaddad46@gmail.com>
Cc: linux-lvm@redhat.com

On Sun, Jun 03, 2018 at 07:47:35PM -0700, Jim Haddad wrote:
> Writing past the end of the disk seems to be fixed in git master.

> Hoping I understood the situation well enough that it wouldn't cause
> harm, using 2.02.177, I ran:

You'll notice some ongoing changes with releases and branches.  I'd
suggest using 2.02.176 and 2.02.178 (skip 2.02.177).  If you want to use a
git branch directly, you may want to look at 2018-06-01-stable since the
master branch may be unstable for a while.

As you suggest, the changes in 2.02.177 related to rounding up write sizes
seems to be your problem with writing beyond the end of the device:

> #format_text/format-text.c:799
  Writing lvm metadata to /dev/sdh3 at 106496 len 20934
  (rounded to 24576) of 20934 aligned to 4096

> #device/dev-io.c:96
  Write /dev/sdh3:   24576 bytes (sync) at 106496

> #format_text/format-text.c:799
  Writing lvm metadata to /dev/sdh3 at 4993488961536 len 20934
  (rounded to 24576) of 20934 aligned to 4096

> #device/dev-io.c:96
  Write /dev/sdh3:   24576 bytes (sync) at 4993488961536

> #device/dev-io.c:129
  /dev/sdh3: write failed after 24064 of 24576 at 4993488961536:
  No space left on device


> With git master, I ran the same command.  It no longer says exactly
> how much and where it's writing, just the header address. 

You should see more writing debug information than you included, like
this...

The first writes will occur in the metadata areas which will be the
closest to the end of the disk, and where you had the errors above:

format-text.c:331 Reading mda header sector from /dev/sdb at 4096
format-text.c:678 Writing metadata for VG foo to /dev/sdb at 7168 len 1525 (wrap 0)
format-text.c:331 Reading mda header sector from /dev/sdb at 999665172480
format-text.c:678 Writing metadata for VG foo to /dev/sdb at 999665175552 len 1525 (wrap 0)
format-text.c:331 Reading mda header sector from /dev/sdg at 4096
format-text.c:678 Writing metadata for VG foo to /dev/sdg at 7168 len 1525 (wrap 0)
format-text.c:331 Reading mda header sector from /dev/sdg at 999665172480
format-text.c:678 Writing metadata for VG foo to /dev/sdg at 999665175552 len 1525 (wrap 0)

Then the subsequent writes (to precommit/commit the changes) will occur to
the metadata headers which are just a 512 byte sector, not as close to the
end:

format-text.c:331 Reading mda header sector from /dev/sdb at 4096
format-text.c:790 Pre-Committing foo metadata (3) to /dev/sdb header at 4096
format-text.c:331 Reading mda header sector from /dev/sdb at 999665172480
format-text.c:790 Pre-Committing foo metadata (3) to /dev/sdb header at 999665172480
format-text.c:331 Reading mda header sector from /dev/sdg at 4096
format-text.c:790 Pre-Committing foo metadata (3) to /dev/sdg header at 4096
format-text.c:331 Reading mda header sector from /dev/sdg at 999665172480
format-text.c:790 Pre-Committing foo metadata (3) to /dev/sdg header at 999665172480

format-text.c:331 Reading mda header sector from /dev/sdb at 4096
format-text.c:790 Committing foo metadata (3) to /dev/sdb header at 4096
format-text.c:331 Reading mda header sector from /dev/sdb at 999665172480
format-text.c:790 Committing foo metadata (3) to /dev/sdb header at 999665172480
format-text.c:331 Reading mda header sector from /dev/sdg at 4096
format-text.c:790 Committing foo metadata (3) to /dev/sdg header at 4096
format-text.c:331 Reading mda header sector from /dev/sdg at 999665172480
format-text.c:790 Committing foo metadata (3) to /dev/sdg header at 999665172480


> But, it doesn't give an error, so I'm hoping it's properly handling the
> situation again:

Most of the metadata writing changes from 2.02.177 should not be in 178.
