From: Steven Ihde <sihde@cs.stanford.edu>
Message-ID: <20040109075447.GA6541@hamachi.dyndns.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] vgconvert -M1: seg fault
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
Date: Fri Jan  9 09:55:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

While trying to convert a version 2 volume group to version 1 (I
created it with kernel 2.6 but now need to run it under 2.4)
"vgconvert -M1 vg0" segfaults.  Even "vgconvert -d -v -M1 vg0" doesn't
give much info, it crashes right after "backing up metadata".  Running
in test mode (-t) it also segfaults.

This volume group has four logical volumes and one physical volume (a
software raid5 array), about 150GB in size, 76GB allocated.

I was able to sucessfully downgrade a test volume group containing
only a single PV and a single LV, 40GB size.

Any ideas what could be wrong?  

I'm running Debian unstable with a 2.6.0 kernel.

Thanks,

Steve
