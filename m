Message-Id: <200401281828.i0SISoI27919@ecstasy.winternet.com>
From: Ken Fuchs <kfuchs@winternet.com>
In-reply-to: <20040128163917.13042.qmail@web21402.mail.yahoo.com> (message
	from duane no-name on Wed, 28 Jan 2004 08:39:17 -0800 (PST))
Subject: Re: [linux-lvm] How To Question
References: <20040128163917.13042.qmail@web21402.mail.yahoo.com>
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
Date: Wed Jan 28 13:23:02 2004
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

duane wrote:

>Right now, I have a single /var/foo implemented as an
>LVM vol using reiserfs. It turns out - I allocated too
>much space to it.

>I now need a /var/bar.

>I'd like to re-allocate or shrink /var/foo by say 20G,
>and give it to /var/bar.

>The "How To" do this two step process is not very
>clear in the docs.

For reiserfs the (safe = unmounted logical volume) steps are:

1) umount the logical volume that contains the reiserfs to shrink.
2) Shrink the reiserfs by a specific amount using resize_reiserfs.
3) Reduce the logical volume containing the reiserfs using lvreduce by
   exactly the same amount as in step 2 above.
4) mount the just shrunk/reduced reiserfs/logical volume.

It may help to relate the mount point /var/foo to the actual LVM lv
device for example, /dev/vg/foo.  The four steps above would become:

# umount /var/foo
# resize_reiserfs -s -20G /dev/vg/foo
# lvreduce --size -20G /dev/vg/foo
# mount -t reiserfs /dev/vg/foo /var/foo

>I'm quite able to shrink and expand /var/foo - at
>will. My confusion is - now that I have shrunk it -
>reallocate the space I just got back?

The following command will report the size of the logical volume:

# lvdisplay /dev/vg/foo

The reported size after the shrink/reduce should 20GB less than before.

To use the freed space, do one or more the following two things:

1) Create a new logical volume in the vg volume group using lvcreate.
   (For example, a new /dev/vg/bar to be mounted on /var/bar.)

2) Extend another volume with lvextend and enlarge its filesystem by the
   exact same size using the appropriate filesystem resizing tool.

Sincerely,

Ken Fuchs <kfuchs@winternet.com>
