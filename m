From: Patrick Caulfield <patrick@tykepenguin.com>
Message-ID: <20011130102423.E1452@tykepenguin.com>
References: <20011129164915.I1408@tykepenguin.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011129164915.I1408@tykepenguin.com>
Subject: [linux-lvm] reiserfs panic
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
Date: Fri Nov 30 04:22:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I'm posting this here partly because I hope Chris Mason is reading(!) and partly
because it may be of some use to others on the list.

There seems to be a problem when reading from a deactivated snapshot of a
reiserfs volume that causes a panic.

The problem is caused by the fact that when a snapshot becomes full, LVM
returns I/O errors for the volume and when reiserfs hits an I/O error it panics.

The solution is, of course, to make your snapshots large enough that this never
happens :-) but just in case this is not possible the following patch may be of
use:


diff -u fs/reiserfs/namei.c.orig fs/reiserfs/namei.c
--- fs/reiserfs/namei.c.orig    Thu Nov 29 16:13:28 2001
+++ fs/reiserfs/namei.c Thu Nov 29 16:34:49 2001
@@ -320,9 +320,10 @@
 
     while (1) {
        retval = search_by_entry_key (dir->i_sb, &key_to_search, path_to_entry, de);
-       if (retval == IO_ERROR)
+       if (retval == IO_ERROR) 
+           return NAME_NOT_FOUND;
            // FIXME: still has to be dealt with
-           reiserfs_panic (dir->i_sb, "zam-7001: io error in " __FUNCTION__ "\n");
+           // reiserfs_panic (dir->i_sb, "zam-7001: io error in " __FUNCTION__ "\n");
 
        /* compare names for all entries having given hash value */
        retval = linear_search_in_dir_item (&key_to_search, de, name, namelen);



patrick
