From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] pvmove hangs
Message-ID: <20030818124515.A29420@uk.sistina.com>
References: <20030816102005.GA12916@gondor.com> <20030816195606.B25758@uk.sistina.com> <20030817231415.GA4328@gondor.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030817231415.GA4328@gondor.com>; from list039@gondor.com on Mon, Aug 18, 2003 at 01:14:15AM +0200
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Aug 18 06:46:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Niehusmann <list039@gondor.com>
Cc: linux-lvm@sistina.com

On Mon, Aug 18, 2003 at 01:14:15AM +0200, Jan Niehusmann wrote:
> So I looked at the underlying devices, and both /dev/hda4 and /dev/md2 had
> a copy of the actual filesystem, only differing in the last 512K. This
> conforms to the fact that the mirroring was done for all but one 512K
> block. But these 512K are completely different (target device all zeroes).
 
Please confirm which kernel you are using, and the device-mapper
patch(es) you applied.  [patches/linux-2.4.2?* from the 1.00.02
device-mapper tarball?]

Some more diagnostics:
  check that you have 'activation = 1' and 'level = 7' in the log{}
  section of lvm.conf and if not, recreate a problem pvmove application log 
  (The you put on the web seems incomplete)
  ['activation = 1' setting is only meant for use when diagnosing
  problems like this - don't leave it there permanently]

> However, these are only the underlying devices. Looking at
> /dev/vgraid/lvol5 a little bit closer revealed that it contained parts
> of some other filesystem. Very strange. And worrying. I don't even want
> to know if writing to this LV would overwrite some unrelated partition.

Use dmsetup to see what's going on:
  run 'dmsetup ls' to get a list of internal device names,
  then 'dmsetup -v table <device_name_shown_in_ls>' 
on all the relevant ones (e.g. vgraid-lvol5*)

After all the interruptions you've had, check the /dev/vgraid/lvol5 
symlink (->/dev/mapper/vgraid-lvol5) & destination major/minor is 
still right.

Check the current metadata (with vgcfgbackup) still looks right.
[Does it show pvmove(s) in progress, or is it clean again?]

Alasdair
-- 
agk@uk.sistina.com
