Message-ID: <3D6DE08B.97898D5D@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] mounting reiserfs snaphost fails
References: <3D6DD029.1010905@dotcom.pl>
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
Date: Thu Aug 29 03:52:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

myciel wrote:
> 
> Hi All
> 
> I can't mount reisefs snapshot:
> 
> mount: block device /dev/interia/intbackup is write-protected, mounting
> read-only
> mount: wrong fs type, bad option, bad superblock on /dev/interia/intbackup,
>         or too many mounted file systems
> 
> linux kernel 2.4.19 and lvm utils version 1.05.
> 
> any hints?

Did you unmount before taking the snapshot ??
I found that i had to unmount before doing a snapshot. I'm using EXT3
though,
but both are journaling filesystems. I havent tried an ext2 one.


JonB
