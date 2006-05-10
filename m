Date: Wed, 10 May 2006 21:36:26 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] [BUG] Spaces in LVM1 LV names => *deep trouble* when
	converting to LVM2
Message-ID: <20060510203626.GW16180@agk.surrey.redhat.com>
References: <44624C66.4050600@idealx.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44624C66.4050600@idealx.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
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
Cc: pierre.machard@idealx.com, Benoit Picaud <benoit@idealx.com>, evms-devel@lists.sourceforge.net, 'Mathias BROSSARD' <mbrossard@idealx.com>

On Wed, May 10, 2006 at 10:26:14PM +0200, Dominique Quatravaux wrote:
> Hi, I encountered a very serious bug with LVM today. I'm using
> lvm2-2.01.04-5 from Debian stable, kernel 2.6.17-rc3
> # lvm version
>   LVM version:     2.01.04 (2005-02-09)
>   Library version: 1.01.00-ioctl (2005-01-17)
>   Driver version:  4.6.0
> What I did:
>     * created a LV in an LVM1 VG using EVMS (yeah, I know) with a
>       space in the name (yeah, yeah, I know, I know :-));

LVs are not permitted to have spaces in their names.
EVMS should have prevented you from doing that!

>     * converted the VG to LVM2 using vgconvert;
>     * as a result the space in the LVM1 metadata was converted over
>       into a space in LVM2 textual metadata, which causes a nice
>       "Parse error line 123" for every subsequent LVM command on that
>       VG, including "vgcfgrestore"...
> 
> Of course I did that on the root VG of my work laptop (Backups? What
> backups?) and ended up in the aforementioned pickle. I tried some dd
> stunts to overwrite the space with a dash, having discovered the
> correct offset and block size with strace() (which for the record were
> respectively one block and 2560 bytes, YMMV) - But bummer, some
> wiseguy put a CRC32 checksum in there! :-) I had to recompile a custom
> version of lvm that passes NULL as the checksum_fn parameter to
> text_vg_import_fd (again for the record, that's a trivial one-line
> patch in function _vg_read_raw_area, in format-text.c around line 286).
> 
> The situation definitely needs some fixing. My humble suggestions:
> 
>     * vgconvert should surface-test the LVM1 metadata as strictly as
>       the command-line "lvcreate" tool does on its arguments;

Some metadata sanity checks are always performed before writing out
metadata.  They're designed to trap internal errors to stop
the programs writing out invalid metadata.  I'll see about enhancing
them to catch this sort of problem.

>     * there should be a mechanism for dealing with corrupt LVM
>       metadata, at the minimum a global command-line switch to
>       temporarily disable checksum verifications.

Nope.
 
Alasdair
-- 
agk@redhat.com
