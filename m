From: josv@osp.nl
Date: Wed, 22 Aug 2001 16:49:36 +0200
Subject: Re: [linux-lvm] how to determine if /dev/... is an LV?
Message-ID: <20010822164936.U2000@gatekeeper.osp.nl>
References: <20010822034425.F8742@pc.ilinx>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010822034425.F8742@pc.ilinx>; from 6888736b923846176364586bf2e7649f@interlinx.bc.ca on Wed, Aug 22, 2001 at 03:44:25AM -0400
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

Well,

You could always check the major number of the device file with
the one in /proc/devices, and see whether it is the major number
of the lvm driver. Then check whether the minor number is that
of a valid logical volume (not 0).

++Jos

And thus it came to pass that Brian J. Murrell wrote:
(on Wed, Aug 22, 2001 at 03:44:25AM -0400 to be exact)

> Hi all,
> 
> This should hopefully be simple.  I am modifying some code to deal
> with LVM.  If I am given a device path for an LV, say, /dev/VG/1,
> programatically, how can I determine that it actually is an LV and not
> some other kind of device?  The best I have come up with is:
> 
> lvdisplay -D -c /dev/VG/lvol1 2>&1 | grep "^/dev/VG/lvol1" >/dev/null
> 
> and testing "$?".
> 
> Seems kind of "hacky" though.  Is there a better way?
> 
> Also, is there any relationship between the output from the lvdisplay
> and the minor number for the device?
> 
> Thanx,
> b.
> 
> -- 
> Brian J. Murrell
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 
Fear the Muppet! Winner of the HAL2001 Hacker Quiz...
