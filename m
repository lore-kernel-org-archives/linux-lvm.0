From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] offtopic but ...
Message-ID: <20020513223048.C12023@golem.blacknet.de>
References: <1266960000.1021300755@[192.168.200.4]> <Pine.LNX.4.44.0205131123370.6095-100000@dragon.inside.ntisys.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0205131123370.6095-100000@dragon.inside.ntisys.com>; from bscott@ntisys.com on Mon, May 13, 2002 at 11:24:38AM -0400
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
Date: Mon May 13 15:32:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, May 13 '02 at 11:24, Benjamin Scott wrote:
>   Hardware failure is not the leading cause of data loss.  User error is.
> 
>   All the RAID in the world will not help you if an operator deletes the
> wrong file.
Well, that's excatly what a REAL journaling filesystem is good for.
Unfortunately we don't have any of this, but than LVM comes in realy
handy.

"we're at 90% of disc space used on /dev/vg/home"

while "delete fome files" won't work
# lvextend +100G /dev/vg/home 
works. (but we'd need to be able to grow RAIDs than)

Just MHO,
    Goetz :-)
