From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] lvm with gpt partitioning?
Message-ID: <20021015072108.GA31465@percy.comedia.it>
References: <20021014200329.GA4885@msmd.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021014200329.GA4885@msmd.net>
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
Date: Tue Oct 15 02:34:48 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Oct 14, 2002 at 04:03:29PM -0400, Josh Duncan wrote:
>Hi all,
>the disk is labelled using an "EFI GPT" disk label/partitioning arrangement.  I
>currently have two partitions defined, the first is 2gb and the second is 16gb.
>I can do a pvcreate on the second, but not on the first.  I've attached output
>from parted, fdisk, and pvcreate below...
looks like you have both a gpt partition and a compatibility dos-like
one. i am missing some info (partition detection logs at boot) output of
/proc/partition and lvmdiskscan. and i don't have an ia64 to play with
any more. might try modifiyng the partition detection code in the kernel
config

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
