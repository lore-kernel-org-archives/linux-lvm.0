Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0ONZQO08088
	for <linux-lvm@redhat.com>; Mon, 24 Jan 2005 18:35:26 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.202])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0ONZLsf009395
	for <linux-lvm@redhat.com>; Mon, 24 Jan 2005 18:35:21 -0500
Received: by wproxy.gmail.com with SMTP id 67so226075wri
	for <linux-lvm@redhat.com>; Mon, 24 Jan 2005 15:35:16 -0800 (PST)
Message-ID: <87f94c370501241535568896c9@mail.gmail.com>
Date: Mon, 24 Jan 2005 18:35:15 -0500
From: Greg Freemyer <greg.freemyer@gmail.com>
In-Reply-To: <20050125085526.B1628305@wobbly.melbourne.sgi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <1106304669.3943.14.camel@grma-lap>
	<87f94c3705012108241f812e0e@mail.gmail.com>
	<20050124113204.B1604791@wobbly.melbourne.sgi.com>
	<87f94c37050124095332866424@mail.gmail.com>
	<20050125085526.B1628305@wobbly.melbourne.sgi.com>
Subject: [linux-lvm] XFS and snapshots [WAS: Re: Why the dramatic increase
	in filesystem performance when usingxfs????]
Reply-To: Greg Freemyer <greg.freemyer@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: Nathan Scott <nathans@sgi.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 25 Jan 2005 08:55:26 +1100, Nathan Scott wrote:
> On Mon, Jan 24, 2005 at 12:53:01PM -0500, Greg Freemyer wrote:
> 
> > Also, last springs release of Knoppix may have XFS support (I don't
> > know), but it is so unreliable, I still use the 2-year old version.
> > No XFS support there.
> 
> Hmm (looks aside into desk draw) - I have Knoppix 1.0 and it's a
> wonderful thing with complete XFS support.  Pretty sure thats at
> least a couple of years old, so not sure what you've got there?
> Knoppix has supported XFS for as long as I can remember.
> 
Mine works too.  :)

I guess I need to verify before I post.

> > Another problem I've recently read about is that XFS on / and software
> > RAID5 are incompatible.  (I have not tried this.)
> 
> That is not correct.

Good to hear.
 
> > Now a question for you:
> >
> > I have not read a status update of XFS/snapshots/2.6.x.   Can you tell
> > me if this is expected to work or not?  (Obviously, I don't care about
> > '/').
> 
> Hmm, off the top of my head, not sure - does that test you wrote
> function on device mapper?; I should find time to look into that.
> I remember Christoph doing some work to tie XFS into the 2.6 API
> once that was merged, but I haven't needed to look at it since.
> If there are problems, send details to us on the linux-xfs list.
> 

The test script uses LVM 1 userland tools.  I have not yet done any
LVM2 userland testing.

I'm not sure if there are any differences between LVM1 and LVM2 CLI commands.

Does anyone on the list know?

The script is available at 

http://oss.sgi.com/cgi-bin/cvsweb.cgi/xfs-cmds/xfstests/068?rev=1.7&content-type=text/x-cvsweb-markup

and the lvm sections are:

#Verify we have the lvm user tools
[ -x /sbin/lvcreate ] || _notrun "lvcreate utility is not installed in /sbin"
[ -x /sbin/lvremove ] || _notrun "lvremove utility is not installed in /sbin"

# If the above fails for LVM 2, the below may be useful notes
#    try "lvm vgdisplay --version" and look for a > 1.9x version number, eg,
# 
#     LVM version:     1.95.10-cvs (2002-05-31)
#     Library version: 0.96.03-ioctl-cvs (2002-06-27)
#     Driver version:  1.0.3

LVM=false

# Check if LVM 1 is in the kernel
if grep lvm /proc/devices > /dev/null; then LVM=true; fi

# Check if LVM 2 is in the kernel
if grep device-mapper /proc/devices > /dev/null; then LVM=true; fi

<snip>
#TODO' are commented out.  I run them by hand, but for an automated
script they can be uncommented.
# Create a PV set from the scratch partition
#TODO # (I don't know if this is needed.and it is dangerous because it
intentionally deletes the partition table!!!
#TODO # dd if=/dev/zero of="$SCRATCH_LVM_DEV" bs=512 count=1
#TODO # pvcreate "$SCRATCH_LVM_DEV"

# Create a VG from the PV
#TODO # vgcreate "$VG" "$SCRATCH_LVM_DEV"

# Create a LV in the VG to snapshot
#TODO # lvcreate -L 2G -n scratch "$VG"

<snip>
	xfs_freeze -f "$SCRATCH_MNT"
	[ $? != 0 ] && echo xfs_freeze -f "$SCRATCH_MNT" failed
	(
		lvcreate --snapshot --size 1G --name scratch_snap "$VG/scratch"\
			> /dev/null 2>&1

<snip>
	lvremove -f "$VG/scratch_snap" > /dev/null 2>&1
	[ $? -eq 0 ] || echo lvremove for "$VG/scratch_snap" failed

> cheers.
> 
> --
> Nathan
> 
Greg
-- 
Greg Freemyer
