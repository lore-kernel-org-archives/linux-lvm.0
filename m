Return-Path: <iain@g7iii.junglelink.co.uk>
Date: Sun, 22 Apr 2001 15:10:24 +0100
From: Iain Young <iain@g7iii.junglelink.co.uk>
Subject: Re: [linux-lvm] What have snapshots got to do with LVM ?
Message-ID: <20010422151024.A599@g7iii.junglelink.co.uk>
References: <20010422130924.A10390@66bassett.freeserve.co.uk>
Mime-Version: 1.0
In-Reply-To: <20010422130924.A10390@66bassett.freeserve.co.uk>; from thornber@btconnect.com on Sun, Apr 22, 2001 at 01:09:24PM +0100
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi Joe,

On Sun, Apr 22, 2001 at 01:09:24PM +0100, Joe Thornber wrote:

> Why don't we split snapshots off into their own driver so we can
> snapshot any block device, putting the COW tables on any other block
> device ?  

Id like this - There is snapfs gives similar functionality to this
(If I understand LVM snapshots correctly), but it is only avaliable for
the 2.2 kernel and then only for ext2/ext3 filesystems IIRC.

My only question is, is it 2.5 fodder, or would Linus accept it into 
the 2.4 tree ? I don't really know enough about what changes would be
required to the kernel, and what Linus is willing to accept in the
2.4 tree.

(And please everyone, lets not get back on the One-Big-Patch vs
Several-Small-Patches "debate" - My mailbox is full enough of that =>)


All the Best

Iain.
