From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] df and lvscan show differnet sizes
Message-ID: <20011129145451.E1408@tykepenguin.com>
References: <OF05414B2E.B23B3CDB-ON86256B12.007DCDB5@TEXASMUTUAL.COM>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF05414B2E.B23B3CDB-ON86256B12.007DCDB5@TEXASMUTUAL.COM>
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
Date: Thu Nov 29 08:53:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Nov 29, 2001 at 08:26:28AM -0600, Jonathan S. Polacheck wrote:
> I am running Mandrake 8.1 w/devfs. df shows the original size of
> /dev/vol_usr and /dev/vol_var.  lvscan shows sizes after lvextend.  I have
> rebooted.

You need to resize the filesystems too. for ext2 the command is ext2resize, for
reiserfs resize_reiserfs. ext2 cannot be resized while mounted unless you have
Andreas' ext2online patch.

patrick
