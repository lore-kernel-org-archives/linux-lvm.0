From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] can't mount snapshot, if created at ext3 logical volume
Message-ID: <20020717182859.GA3723@tykepenguin.com>
References: <OE49paiw5Y5z4IssCQq0000187f@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OE49paiw5Y5z4IssCQq0000187f@hotmail.com>
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
Date: Wed Jul 17 13:28:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jul 18, 2002 at 01:44:53AM +0900, YC wrote:
>    I am testing LVM 1.0.4 in Linux 2.4.18.
>    and I found one problem in mounting snapshot volume for ext3 file system.
>    at 1.0.3, it was usable, but not now.
>     
>    in my testing,
>    it was OK if created snapshot volume for ext2 file system.
>    But if created snapshot volume for ext3 file system,
>    that snapshot volume can not mount with error-message
>    "mount: wrong fs type, bad option, bad superblock on /dev/VG00/snap3,
>           or too many mounted file systems".
>     
>    if I mount original volume with ext2, snapshot volume also has no problem
>    in create and mount.
>    But
>    if I mount same original volume with ext3, snapshot volume was created
>    successfully, and can not mount.

You need to apply the VFS lock patch included in the source distribution.

note: the VFS lock patch is 1.0.4 is rather broken so use the one from 1.0.5 -
it'll be fine with a 1.0.4 kernel.
-- 

patrick
