From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@users.sourceforge.net>
Message-ID: <yw1xn0cxkluw.fsf@users.sourceforge.net>
References: <yw1xzngxktrs.fsf@users.sourceforge.net> <20030922123435.X2618@sistina.com>
 <yw1xr829kps6.fsf@users.sourceforge.net>
 <20030922145440.Y2618@sistina.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: Resizing PV
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
Date: Mon Sep 22 08:14:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

"Heinz J . Mauelshagen" <mauelshagen@sistina.com> writes:

> pe_start is the sector offset into the device.

OK, I thought it might be, but I wasn't sure.

> Yes, you need to reduce pe_count by 32 making it 1157 and vgcfgrestore.
> You need to have recent LVM2 code so that vgcfgrestore updates the pe_count

How recent?  Is this new enough?

  LVM version:     2.00.03 (2003-07-13)
  Library version: 1.00.02-ioctl (2003-07-12)
  Driver version:  4.0.0

I'm using whatever device-mapper is in Linux 2.6.0-test5.

> properly (and of course, the 32 PEs need to be empty).

-- 
M�ns Rullg�rd
mru@users.sf.net
