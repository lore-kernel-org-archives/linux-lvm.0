From: Anders Widman <andewid@tnonline.net>
Message-ID: <50136624625.20021126105306@tnonline.net>
Subject: Re: [linux-lvm] vgchange with lvm_snapshot_fill_COW_page failed
In-Reply-To: <007001c29531$c63392c0$dc64a8c0@pcjeffrey>
References: <007001c29531$c63392c0$dc64a8c0@pcjeffrey>
MIME-Version: 1.0
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
Date: Tue Nov 26 03:53:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Jeffrey van Hout - Van Boxtel Software BV <linux-lvm@sistina.com>

> Hi,

> When we changed the physical position of the harddrives we were able to
> mount the existing volumegroup.

> When we rechanged these drives to the original position and tried to
> activate the volume group with vhchange -a y we got the following error:


> vgchange -ay
> vgchange -- ERROR "Bad address" activating volume group "lvmgroup1"
> .
> vm -- _pv_get_number failed for rdev = 65535
> lvm -- lvm_snapshot_fill_COW_page failed

What version of LVM tools (and kernel-module) to you use?

> (I tried:
> lvscan -D
> vgscan
> vgchange -a y)

> Do you have any suggestions?

> Regards,
> Jeffrey (jvhout@van-boxtel-sftware.nl)
