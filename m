From: Spam <spam@tnonline.net>
Message-ID: <883097025.20031208210545@tnonline.net>
Subject: Re: [linux-lvm] EXT3 vs Reiserfs
In-Reply-To: <20031208162615.GJ2015@zaurak.cedar.Buffalo.EDU>
References: <9BBB7C9EFEF1874BAC4DC204E867EFAF02560D49@s99mail06>
 <1070853946.1558.17.camel@avalon>
 <20031208162615.GJ2015@zaurak.cedar.Buffalo.EDU>
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
Date: Mon Dec  8 14:06:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Ajay Shekhawat <linux-lvm@sistina.com>


> On Mon, Dec 08, 2003 at 04:25:47AM +0100, Markus Schiltknecht wrote:
>> why is that? thought reiser was faster than ext3 while ext3 would be
>> considered more stable (in general).

> Reiser has this "tail packing" option, as well as some other optimizations
> that benefit sites with lots of small files (best example: Usenet feeds).
> However, this can come at a price for really LARGE files (as a DB would need).

  Yes,  both  tail  packing  and other options can be turned on/off at
  mount time if you need more speed or space etc..

>> Before getting ways off topic: where can I find a good comparison /
>> discussion on different filesystems?

> Checkout
> http://oregonstate.edu/~kveton/fs/

  Interresting  to  see  the  benchmarks.  But why is ext3 tested with
  several options and the other FS not? For example noatime and notail
  changes performance of ReiserFS too.
  
> Since noone has mentioned XFS, let me throw in my recommendation for XFS.
> XFS (like, probably, IBM's JFS) is a top-notch filesystem. 
> Try it out in your scenario, you might like it.

  How  are  the XFS fsck tools compared to the reiser ones? Reiserfsck
  has saved me on more than one occation =)

> Ajay
