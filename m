From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Trouble switching from LVM2 to LVM1
Message-ID: <20030417214241.F14411@uk.sistina.com>
References: <yw1x4r4yfiab.fsf@zaphod.guide>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <yw1x4r4yfiab.fsf@zaphod.guide>; from mru@users.sourceforge.net on Wed, Apr 16, 2003 at 07:45:16PM +0200
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
Date: Thu Apr 17 15:42:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Apr 16, 2003 at 07:45:16PM +0200, M?ns Rullg?rd wrote:
> without errors, but all the LV device nodes are created with minor 0.

Some time back, LVM1 introduced persistent minors, so the minor number is 
stored on disk and remembered for subsequent activations.

In LVM2, persistent minors are optional and the default is *not* to use
them, so the minor number may be different each time a device is
activated, and no minor number is stored on disk.


IIRC Exporting the VG and then importing it again will reassign LVM1 
minor numbers.

 
Alasdair
-- 
agk@uk.sistina.com
