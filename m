Message-Id: <00a501c1d1f6$6207e890$6501a8c0@bomoon>
From: "bo" <bo@sosnetwork.net>
References: <Pine.LNX.4.44.0203170858550.11152-100000@www.scotty.co.at>
Subject: Re: [linux-lvm] lvextend problem
MIME-Version: 1.0
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
Date: Fri Mar 22 17:07:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> > 1) extend the volume group (which you did)
> > 2) extend the logical volume (which you did), and
> > 3) extend the filesystem
>
> If you've used a ReiserFS filesystem a
>   /sbin/resize_reiserfs /dev/store_vg/store_lv
> would have done the trick - online!
>
> I can only say resize_reiserfs works like a charm for me.
>
From my experiences,
mkreiserfs takes more time than resize_reiserfs, and also it has a
message like "formating" but no such message on resize_reiserfs.
I thought resize_reiserfs does not format the device added but it did not
have any problem to access after resize.

My question is "Does resize_reiserfs format the device which is added and
unformatted yet?"

Bo
