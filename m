From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] ext2resize error
Message-ID: <20020807175601.GN23923@clusterfs.com>
References: <OF4C7BCDD3.EAA70700-ON86256C0E.004A63CB@TEXASMUTUAL.COM>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF4C7BCDD3.EAA70700-ON86256C0E.004A63CB@TEXASMUTUAL.COM>
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
Date: Wed Aug  7 12:56:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Jonathan S. Polacheck" <JPolache@texasmutual.com>
Cc: linux-lvm@sistina.com

On Aug 07, 2002  08:34 -0500, Jonathan S. Polacheck wrote:
> resize2fs did the trick.  Here is the additional system information;
> 
> ext2resize -v -d;
> ext2_resize_fs
> ext2_shrink_fs
> Your filesystem is too occupied to resize it to 160000
> blocks. Sorry.
> direct hits: 0, indirect hits: 0, misses: 0
> 
> strace ext2resize;
> ext2resize v1.1.14 - 1999/08/28 for EXT2FS 0.5b
             ^^^^^^^^^^^^^^^^^^^^ this is _very_ old, and no doubt has bugs.

Feel free to update to 1.1.17 if you want.

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/
