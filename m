Date: Mon, 4 Jun 2018 11:35:17 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20180604163517.GC19875@redhat.com>
References: <CAANaKqdnGfgxxHwQVA+L3uNDe5aMydssLius94wcp6LxA1-w+g@mail.gmail.com>
	<CAANaKqdPjq9sK=DvZjDDSm8Vd_28C1k2i2xLyTrkFzwVq69NZw@mail.gmail.com>
	<CAANaKqdRgfcZvUZXUgwSX-WXaQ0K=yg6ubDGwRkMk8mU+bDpUw@mail.gmail.com>
	<CAANaKqcv2bF1X1S3L5xi-7HOsV2J29a4BvhMjiqwigRm2SGbVw@mail.gmail.com>
	<CAANaKqd98zjbv2Mh60aeny=UL8oMGadGcLUXgOURbQmnFxojEA@mail.gmail.com>
	<CAANaKqeKDaBcAHAh91ycm9SwB0gDD+cNHqsAVkW6y-RzNzgifg@mail.gmail.com>
	<20180604153434.GB19875@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180604153434.GB19875@redhat.com>
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

On Mon, Jun 04, 2018 at 10:34:34AM -0500, David Teigland wrote:
> format-text.c:331 Reading mda header sector from /dev/sdb at 4096
> format-text.c:678 Writing metadata for VG foo to /dev/sdb at 7168 len 1525 (wrap 0)
> format-text.c:331 Reading mda header sector from /dev/sdb at 999665172480
> format-text.c:678 Writing metadata for VG foo to /dev/sdb at 999665175552 len 1525 (wrap 0)
> format-text.c:331 Reading mda header sector from /dev/sdg at 4096
> format-text.c:678 Writing metadata for VG foo to /dev/sdg at 7168 len 1525 (wrap 0)
> format-text.c:331 Reading mda header sector from /dev/sdg at 999665172480
> format-text.c:678 Writing metadata for VG foo to /dev/sdg at 999665175552 len 1525 (wrap 0)

To illustrate what you should see when the metadata wraps, using the default
metadata area size:

The initial metadata written by vgcreate:

Reading mda header sector from /dev/sdb at 4096
Writing metadata for VG foo to /dev/sdb at 4608 len 931 (wrap 0)
Reading mda header sector from /dev/sdb at 999665172480
Writing metadata for VG foo to /dev/sdb at 999665172992 len 931 (wrap 0)
Reading mda header sector from /dev/sdg at 4096
Writing metadata for VG foo to /dev/sdg at 4608 len 931 (wrap 0)
Reading mda header sector from /dev/sdg at 999665172480
Writing metadata for VG foo to /dev/sdg at 999665172992 len 931 (wrap 0)

When writing the metadata wraps, it does not go beyond the end of the device
and it returns to the original offset used above:

Reading mda header sector from /dev/sdb at 4096
Writing metadata for VG foo to /dev/sdb at 1043968 len 4608 (wrap 19895)
Writing metadata for VG foo to /dev/sdb at 4608 len 19895 (wrapped)
Reading mda header sector from /dev/sdb at 999665172480
Writing metadata for VG foo to /dev/sdb at 999666212352 len 8704 (wrap 15799)
Writing metadata for VG foo to /dev/sdb at 999665172992 len 15799 (wrapped)
Reading mda header sector from /dev/sdg at 4096
Writing metadata for VG foo to /dev/sdg at 1043968 len 4608 (wrap 19895)
Writing metadata for VG foo to /dev/sdg at 4608 len 19895 (wrapped)
Reading mda header sector from /dev/sdg at 999665172480
Writing metadata for VG foo to /dev/sdg at 999666212352 len 8704 (wrap 15799)
Writing metadata for VG foo to /dev/sdg at 999665172992 len 15799 (wrapped)

The write that goes to the end of the metadata area starts at 999666212352 and
has length 8704.  start+length is 999666221056 which matches the device size:

# pvs -o name,dev_size --units b /dev/sdb /dev/sdg
  PV         DevSize      
  /dev/sdb   999666221056B
  /dev/sdg   999666221056B
