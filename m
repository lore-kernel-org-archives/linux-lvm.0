Message-ID: <3C064B71.60707@larsshack.org>
From: Lars Kellogg-Stedman <lars@larsshack.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] df and lvscan show differnet sizes
References: <OF05414B2E.B23B3CDB-ON86256B12.007DCDB5@TEXASMUTUAL.COM>
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
Date: Thu Nov 29 08:50:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Jonathan S. Polacheck wrote:

> I am running Mandrake 8.1 w/devfs. df shows the original size of
> /dev/vol_usr and /dev/vol_var.  lvscan shows sizes after lvextend.  I have
> rebooted.


Jonathan,

lvscan is showing you the amount of available space on the LVM *device*, 
while df is showing you the size of the *filesystem*.  The filesystem 
will not automatically expand to fill the additional space -- you have 
to do this manually using a tool such as e2fsadm or resize2fs (for 
ext2), xfs_growfs (for xfs), resize_reisterfs (for reiserfs), or 
whatever other tool is appropriate for the filesystem you're using.

-- Lars
