From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] error mounting snapshot of ext3 filesystem
Message-Id: <20020123150757.GE1002@tykepenguin.com>
References: <1011729567.6638.40.camel@benway.cv.telegroup.com>
    <E16TOej-0001qC-00@arwen.dev33.cvf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E16TOej-0001qC-00@arwen.dev33.cvf>
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
Date: Wed Jan 23 09:08:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jan 23, 2002 at 03:45:41PM +0100, Pierrick PONS wrote:
> 
> I do have the same problem :
> 
> mount /dev/testlvm/snap /mnt/snap 
> mount: block device /dev/testlvm/snap is write-protected, mounting read-only
> mount: wrong fs type, bad option, bad superblock on /dev/testlvm/snap,
>        or too many mounted file systems
> 
> I tried with -text2 or -text3 option and it's the same. 
> What is the type wanted  ?
> 
> Is there a more documentated snapshot section where to found some more 
> explanation ?

You do need the VFS lock patch if you want to mount snapshots of reiserfs or
ext3 filesystems. The 2.4.11 patch inthe LVM distribution works with 2.4.17.

patrick
