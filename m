From: Tim <tim@connectlive.com>
Subject: Re: [linux-lvm] lvextend problem
Message-Id: <20020316201203.A29806@connectlive.com>
References: <3298.213.89.4.172.1016322904.squirrel@192.168.0.253>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3298.213.89.4.172.1016322904.squirrel@192.168.0.253>;
    from jens@berlips.com on Sun, Mar 17, 2002 at 12:55:04AM +0100
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
Date: Sat Mar 16 19:13:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

you need to 

1) extend the volume group (which you did)
2) extend the logical volume (which you did), and
3) extend the filesystem

before df will show the changes.  The last item is the trickiest, I know
it *should* work with ext3, but when I did my big migration I added a
new LV and built a new fs on that -- no room for error since recovering
from a failure would take too long (1/2TB of live data!).  With ext2 I
would have bit the bullet and done the extend.  As for other
filesystems, I have no idea.  ReiserFS gave me trouble with NFS/Samba so
I dropped it, maybe XFS is better, but I use ext3 for compatibiliy.

I think Andreas Dilger on this list actually maintains the ext2resize
codebase (or helps to, or took over from Ted T'so, or something) so
he'll hopefully chime in soon.  Bottom line, make your backups first!


--t



Quoth Jens Berlips:
> Hello
> 
> I have two partitions on a 80gb harddrive.
> 
> /dev/hdb1
> /dev/hdb2
> 
> I have created a VG called store_vg.
> $vgcreate store_vg /dev/hdb2
> then
> $lvcreate -lXXX -nstore_lv store_vg
> creating an LV using all space left on hdb2
> 
> What I wanted to do next was adding the hdb1
> without loosing the data on hdb2.
> 
> So I did.
> vgextend store_vg /dev/hdb1
> then
> lvextend -lXXX /dev/store_vg/store_lv /dev/hdb1
> 
> But I noticed that this didnt work and when doing a
> $ df. I got the same results as before. I guess this has
> to do with hdb1 not being formatted (using mkfs.xfs) correctly. When
> reformatting the entire LV (extended with hdb1) I got everything to work.
> But all data lost.
> 
> This was more of a test, so I didn't loose any critical data. But how
> should this proceedure be done correctly?
> 
> Thanks in advance
> Jens Berlips
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 
    "Make it ten... I am only a poor corrupt official."
                  --Capt. Louis Renault, _Casablanca_
