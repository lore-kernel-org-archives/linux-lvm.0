Return-Path: <thomas@n-ary.com>
Message-ID: <31470A1D25F5D311940A0020182B88D319F974@mail.n-ary.com>
From: Thomas Inglis <thomas@n-ary.com>
Date: Thu, 17 May 2001 15:05:46 +0100
MIME-Version: 1.0
Subject: [linux-lvm] main drive fail
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
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Dominique,

Maybe I didn't explain it well enough. Main drive is gone, poof, no longer
exists. Its the other three drives I want to restore now that ive done the
kernel/LVM stuff on the new drive. No existing LVM files remain on the main
drive. The only thing the main drive did was boot and start LVM. Obviously
that's now not the case. Upshot is I do not have /etc/lvmconf anymore.

Im not particularly bothered about restoring all as it was, but I DO need to
get the data contained on the drive, however painful or time consuming so I
hope there's a way.
What's this about each physical volume containing this data? Can I restore
/etc/lvmconf/ from that in any way?

Anyway :-)

pvscan gives

  pvscan -- reading all physical volumes (this may take a while)
  pvscan -- inactive PV "/dev/hdb1" is associated to an unkown VG (run
vgscan)
  pvscan -- inactive PV "/dev/hdc1" is associated to an unkown VG (run
vgscan)
  pvscan -- inactive PV "/dev/hdd1" is associated to an unkown VG (run
vgscan)
  pvscan -- total: 3 [21.75 GB] / in use: 3 [21.75 GB] / in np VG: 0 [0]

pvdisplay /dev/hdb1 gives

  -- Physical Volume -- 
  PV Name		/dev/hdc1
  VG Name		lvmGroup
  PV Size		7.87 GB / NOT usable 3.48 MB [LVM: 128 KB]
  PV#			3
  PV Status		Not available
  Allocatable		yes (but full)
  Cur LV		1
  PE Size (KByte)	4096
  Total PE		2015
  Free PE		0
  Allocated PE		2015
  PV UUID		yspotL-fxXr-dfOH-BNN8-uYkB-6VGq-hku

Also, this may seem a silly Question, how do I reply to the thread I
created, lol, it seems silly to post it as an apparent new one?

Im no daft, just a programmer, ROFL.

Thomas
__________________________________________________
n-ary .. .. .. functionality through creativity
http://www.n-ary.com/ +44 (1387) 242800

tagServlet ... a java alternative to ColdFusion!
http://www.tagServlet.com/
