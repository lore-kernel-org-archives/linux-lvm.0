From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] reiserfs panic
Message-ID: <742840000.1007128632@tiny>
In-Reply-To: <20011130102423.E1452@tykepenguin.com>
References: <20011129164915.I1408@tykepenguin.com>
 <20011130102423.E1452@tykepenguin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Fri Nov 30 07:55:03 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


On Friday, November 30, 2001 10:24:23 AM +0000 Patrick Caulfield
<patrick@tykepenguin.com> wrote:

> I'm posting this here partly because I hope Chris Mason is reading(!) and
> partly because it may be of some use to others on the list.

;-)

> 
> There seems to be a problem when reading from a deactivated snapshot of a
> reiserfs volume that causes a panic.
> 
> The problem is caused by the fact that when a snapshot becomes full, LVM
> returns I/O errors for the volume and when reiserfs hits an I/O error it
> panics.
> 
> The solution is, of course, to make your snapshots large enough that this
> never happens :-) but just in case this is not possible the following patch
> may be of use:
> 
> 
> diff -u fs/reiserfs/namei.c.orig fs/reiserfs/namei.c
> --- fs/reiserfs/namei.c.orig    Thu Nov 29 16:13:28 2001
> +++ fs/reiserfs/namei.c Thu Nov 29 16:34:49 2001
> @@ -320,9 +320,10 @@
>  
>      while (1) {
>         retval = search_by_entry_key (dir->i_sb, &key_to_search,
> path_to_entry, de); -       if (retval == IO_ERROR)
> +       if (retval == IO_ERROR) 
> +           return NAME_NOT_FOUND;

The problem here is that NAME_NOT_FOUND does not mean error.  It means it is
safe to insert something with that name, which isn't what we want.  For
snapshots though, it will work fine.

Now that 2.5.x is out I expect more of these to get cleaned up, and I'm
workin on patches to turn reiserfs_panic into a forced readonly mount.

-chris
