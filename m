From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] file system type
Message-Id: <20020121114450.G30661@kluge.net>
References: <E16ShQA-0000Wq-00@arwen.dev33.cvf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E16ShQA-0000Wq-00@arwen.dev33.cvf>; from ppons@cvf.fr on Mon,
    Jan 21, 2002 at 05:35:46PM +0100
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
Date: Mon Jan 21 10:45:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jan 21, 2002 at 05:35:46PM +0100, Pierrick PONS wrote:
> I don't really understand how we can have ext2 partition as we use linuxx-lvm 
> type (8E) for logical volume.

ext2 is a filesystem, the partition type doesn't matter.

> I can't see how I can mount a ext2 file system from a logical volume.

First, create the LV:

lvcreate -n foo -L 1G volume_group

Then make the filesystem:

mke2fs /dev/volume_group/foo

The mount the filesystem:

mkdir /mnt/temp
mount /dev/volume_group/foo /mnt/temp


:)

-- 
Randomly Generated Tagline:
Interstellar Matter is a Gas
