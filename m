From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Logical Volume Limit Size
Message-ID: <20030402130118.A26952@uk.sistina.com>
References: <000801c2f772$a7e8cee0$0201a8c0@assiexp>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000801c2f772$a7e8cee0$0201a8c0@assiexp>; from lvm@thehideout.nl on Mon, Mar 31, 2003 at 12:44:55PM +0200
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
Date: Wed Apr  2 06:01:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Mar 31, 2003 at 12:44:55PM +0200, Tony Scheffer wrote:
> I simply could not find this info, I hope its not written somewhere obvious and I am just being blind. BUT:
> If I upgrade from LVM1 to LVM2 will the 255G limit be exceeded? I cannot create a LV bigger then that.

LVM1 on-disk format:
  This limit is fixed by the Physical Extent size chosen when
  you create the Volume Group - see the vgcreate man page.
  It can't be changed later.

LVM2 on-disk format:
  You should only be limited by the kernel's 2TB limit.

So you would need to upgrade to LVM2 and use vgconvert to 
convert your metadata into the new format.

[Note:  (a) I've not tested this yet;  (b) Certain LVM2 tool 
operations may appear slow as they are still (unnecessarily) 
proportional to the total number of physical extents in the VG 
and need optimising.]

At some point we should have an LVM2 tool that changes the 
Physical Extent size.

Alasdair
-- 
agk@uk.sistina.com
