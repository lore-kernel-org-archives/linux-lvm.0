Date: Mon, 4 Jun 2018 13:52:33 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20180604185233.GA28542@redhat.com>
References: <CAANaKqdnGfgxxHwQVA+L3uNDe5aMydssLius94wcp6LxA1-w+g@mail.gmail.com>
	<CAANaKqdPjq9sK=DvZjDDSm8Vd_28C1k2i2xLyTrkFzwVq69NZw@mail.gmail.com>
	<CAANaKqdRgfcZvUZXUgwSX-WXaQ0K=yg6ubDGwRkMk8mU+bDpUw@mail.gmail.com>
	<CAANaKqcv2bF1X1S3L5xi-7HOsV2J29a4BvhMjiqwigRm2SGbVw@mail.gmail.com>
	<CAANaKqd98zjbv2Mh60aeny=UL8oMGadGcLUXgOURbQmnFxojEA@mail.gmail.com>
	<CAANaKqeKDaBcAHAh91ycm9SwB0gDD+cNHqsAVkW6y-RzNzgifg@mail.gmail.com>
	<20180604153434.GB19875@redhat.com>
	<CAANaKqf91hdLSHs5CyX_AFaoV0L2Jr6mVE+RRCJODRUF0bM+hQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAANaKqf91hdLSHs5CyX_AFaoV0L2Jr6mVE+RRCJODRUF0bM+hQ@mail.gmail.com>
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

On Mon, Jun 04, 2018 at 11:26:29AM -0700, Jim Haddad wrote:
> Do you think I'm right, that there are no lasting effects from having
> ran into problem?  Meaning, if I run 2.02.176/178/2018-06-01-stable
> I'm all set, and don't need to copy all the data off the disk and redo
> it?

It's probably ok.  With one of the good versions above, run 'vgs -vvvv'
and check that the offsets look good.  Then run a pointless command to
write the metadata with -vvvv and check that the vg writes are happening
correctly.  "vgchange -vvvv --addtag foo <vgname>" will write a new
version of the metadata and won't have any effect on LVs.
