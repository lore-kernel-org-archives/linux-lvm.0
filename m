Date: Wed, 22 Aug 2001 03:44:25 -0400
Message-ID: <20010822034425.F8742@pc.ilinx>
Mime-Version: 1.0
Content-Disposition: inline
Resent-To: linux-lvm@sistina.com
From: "Brian J. Murrell" <6888736b923846176364586bf2e7649f@interlinx.bc.ca>
Resent-Message-Id: <20010822135843.E53A4230C5@pc.interlinx.bc.ca>
Subject: [linux-lvm] how to determine if /dev/... is an LV?
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
To: linux-lvm@sistina.com

Hi all,

This should hopefully be simple.  I am modifying some code to deal
with LVM.  If I am given a device path for an LV, say, /dev/VG/1,
programatically, how can I determine that it actually is an LV and not
some other kind of device?  The best I have come up with is:

lvdisplay -D -c /dev/VG/lvol1 2>&1 | grep "^/dev/VG/lvol1" >/dev/null

and testing "$?".

Seems kind of "hacky" though.  Is there a better way?

Also, is there any relationship between the output from the lvdisplay
and the minor number for the device?

Thanx,
b.

-- 
Brian J. Murrell
