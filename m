From: Friedrich Lobenstock <fl@fl.priv.at>
Subject: Re: [linux-lvm] lvextend problem
In-Reply-To: <20020316201203.A29806@connectlive.com>
Message-Id: <Pine.LNX.4.44.0203170858550.11152-100000@www.scotty.co.at>
MIME-Version: 1.0
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
Date: Sun Mar 17 02:01:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, 16 Mar 2002 20:12, Tim wrote:

>
> you need to
>
> 1) extend the volume group (which you did)
> 2) extend the logical volume (which you did), and
> 3) extend the filesystem

If you've used a ReiserFS filesystem a
  /sbin/resize_reiserfs /dev/store_vg/store_lv
would have done the trick - online!

I can only say resize_reiserfs works like a charm for me.

-- 
MfG / Regards
Friedrich Lobenstock
