From: Wolfgang Weisselberg <weissel@netcologne.de>
Date: Thu, 18 Oct 2001 02:09:32 +0200
Subject: Re: [linux-lvm] read_intr errors
Message-ID: <20011018020932.A18634@tiger.bigcats.invalid>
References: <134783342.1003350775542.JavaMail.root@boots> <000901c15751$8839ee70$0300000a@pacbell.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000901c15751$8839ee70$0300000a@pacbell.net>; from e@arix.com on Wed, Oct 17, 2001 at 02:20:23PM -0700
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

Hi, Erick!

Erick Calder (e@arix.com) wrote:
> From Karl

> > Have you tried mke2fs with the -c option in LVM and on the drive without

> I haven't tried that but if I unmount the filesystem and check it:

> # umount /dev/LVM/mp3z
> # fsck /dev/LVM/mp3z

> it comes up clean....  is that not an equivalent test?

No.  Definitively not.  mke2fs -c also runs badblocks(8),
which tries to read every single byte in the partition.
(Optionally you can even have it do a write test.  There is
even a non-destructive write test in newer badblocks.  Use with
care and do have current backups.)

fsck just checks that the metadata (directories, space used
by files, etc) looks OK.

-Wolfgang
