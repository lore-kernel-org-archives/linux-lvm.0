From: Marc MERLIN <marc@merlins.org>
Subject: Re: [linux-lvm] Can't mke2fs lv
Message-Id: <20020211183020.GP21505@merlins.org>
References: <20020211173404.GB23@merlins.org>
    <20020211190928.A31248@sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020211190928.A31248@sistina.com>
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
Date: Mon Feb 11 12:30:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Feb 11, 2002 at 07:09:28PM +0100, Heinz J . Mauelshagen wrote:
> On Mon, Feb 11, 2002 at 09:34:04AM -0800, Marc MERLIN wrote:
> > I've never had this problem before, it's on a 2.4.14 kernel with lvm
> > 1.0.1rc4:
> > 
> > gargamel:~# lvscan 
> > lvscan -- ACTIVE            "/dev/BootMylexLVM/usr" [1.50 GB]
> > lvscan -- ACTIVE            "/dev/BootMylexLVM/var" [2.00 GB]
> > lvscan -- ACTIVE            "/dev/BootMylexLVM/home" [115.00 GB]
> > lvscan -- 3 logical volumes with 118.50 GB total in 1 volume group
> <SNIP>
> >         4096000, 7962624, 11239424, 20480000, 23887872
> > 
> > File size limit exceeded
> > 
> > 
> > Did I do something stupid, or do I need to upgrade?
> > (I did do a quick search on this kind of failure, but didn't find anything)
> 
> No, there's  an OS bug related  to the 2  GB file size limit  which causes
> both your  problems. You must be  directly logged  in as 'root',  *no* 'su
> root' in order to run the commands fine.

Mmmh, interesting.

Unfortunately, that's  not it,  the machine  doens't have  any users,  and I
ssh'ed in as root
gargamel:~# id
uid=0(root) gid=0(root) groups=0(root)
gargamel:~#  mke2fs  /dev/BootMylexLVM/var
mke2fs 1.25 (20-Sep-2001)
Filesystem label=
OS type: Linux
Block size=4096 (log=2)
Fragment size=4096 (log=2)
262144 inodes, 524288 blocks
26214 blocks (5.00%) reserved for the super user
First data block=0
16 block groups
32768 blocks per group, 32768 fragments per group
16384 inodes per group
Superblock backups stored on blocks: 
        32768, 98304, 163840, 229376, 294912

mke2fs: Attempt to write block from filesystem resulted in short write zeroing block 524280 at end of filesystem

Since I  suspected the 2G  file limit (although  it didn't make  any sense),
I've made sure I have a recent libc.

gargamel:~# ldd /sbin/mke2fs 
        libext2fs.so.2 => /lib/libext2fs.so.2 (0x49874000)
        libcom_err.so.2 => /lib/libcom_err.so.2 (0x49888000)
        libe2p.so.2 => /lib/libe2p.so.2 (0x4988b000)
        libuuid.so.1 => /lib/libuuid.so.1 (0x49890000)
        libc.so.6 => /lib/libc.so.6 (0x49893000)
        /lib/ld-linux.so.2 => /lib/ld-linux.so.2 (0x49858000)
gargamel:~# l /lib/libc.so.6     
lrwxrwxrwx    1 root     root           13 Feb 11 09:21 /lib/libc.so.6 -> libc-2.2.5.so*

Is the bug at mke2fs time, or  before that, when the vg/lvs are created?  
Do I want  to switch e2fsprogs (I  already have 1.25), libcs,  lvm tools, or
kernels?

Thanks,
Marc
-- 
Microsoft is to operating systems & security ....
                                      .... what McDonalds is to gourmet cooking
  
Home page: http://marc.merlins.org/   |   Finger marc_f@merlins.org for PGP key
