From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] reiserfs panic
Message-ID: <20011130175255.A27048@lynx.no>
References: <20011129164915.I1408@tykepenguin.com> <20011130102423.E1452@tykepenguin.com> <20011130124421.05D5F76F5@oscar.casa.dyndns.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011130124421.05D5F76F5@oscar.casa.dyndns.org>; from tomlins@cam.org on Fri, Nov 30, 2001 at 07:44:20AM -0500
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
Date: Fri Nov 30 18:51:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ed Tomlinson <tomlins@cam.org>
Cc: linux-lvm@sistina.com, Patrick Caulfield <patrick@tykepenguin.com>, Chris Mason <mason@suse.com>

On Nov 30, 2001  07:44 -0500, Ed Tomlinson wrote:
> Wonder if this is the result of something not getting into cvs?  Mid October
> Chris fixed a bunch of snapshot problems.  One was with full snapshots...
> He posted a fix here, some one else posted an alternate.  Bet neither has 
> been put into cvs.  Here is what I am using with 'rc4ish'.  Does it help?

Hmm, I thought I had put this into CVS.  Note that my version put the
checks into lvm_snapshot_remap_block() rather than requiring the caller
to check it.  It looks like it is there in my CVS.

> @@ -1142,7 +1142,8 @@
>  
>  	/* we must redo lvm_snapshot_remap_block in order to avoid a
>  	   race condition in the gap where no lock was held */
> -	if (!lvm_snapshot_remap_block(&rdev, &rsector, pe_start, lv) &&
> +	if (lv->lv_block_exception && 
> +	    !lvm_snapshot_remap_block(&rdev, &rsector, pe_start, lv) &&
>  	    !lvm_snapshot_COW(rdev, rsector, pe_start, rsector, vg, lv))
>  		lvm_write_COW_table_block(vg, lv);

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
