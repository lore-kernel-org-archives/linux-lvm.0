Return-Path: <lembark@wrkhors.com>
Message-ID: <3A60E42E.B7588C50@wrkhors.com>
Date: Sat, 13 Jan 2001 17:26:38 -0600
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] *** ANNOUNCEMENT *** LVM 0.9.1 beta1 available at 
 www.sistina.com
References: <20010113011532.B21587@srv.t-online.de> <20010113170408.A4296@gondor.com> <20010113163514.A24224@goliath.geekthing.com>
Content-Transfer-Encoding: 7bit
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> I wonder if this is why I lost all of my data last Thursday...
> 
> vg w/ 2 pv's (hde1 & hdg1) and 3 lv's.  Add a pv (hdc1) and
> reboot, and all of a sudden, even though the vg is still there,
> with 3 pv's and 3 lv's, the lv's won't even fsck (bad magic
> number in superblock -- doesn't even look like a filesystem was
> even there).  I though maybe it had a problem w/ rearranging the
> pv's or something...  How else could it completely lose track
> of my data?
> 
> It was kernel 2.4.0 w/ the several-line vg_extend patch, and the 0.9
> tools...

you probably hadn't lost anything.  one approach that usually
works is to:

	vgexport vg0;
	vgimport vg0 /first/disk /second/disk;

likely to get you back to where you were before the vgextend.

if vgimport doesn't like them anymore you can create a new lv,
vgextend it to the two devices and create new vg's w/ the same
allocations as the old ones (simple enough if they havn't been
extended too many times).

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
