Subject: Re: [linux-lvm] kernel 2.2.19 support
References: <3BBC4146.51CD437D@promofinarsa.es>
	<wv669v3b96.fsf@freeze.oslo.dnmi.no> <3BBC4E6E.BCA3EE70@promofinarsa.es>
	<wvzo771uju.fsf@freeze.oslo.dnmi.no> <3BBC535B.59D6A5CB@promofinarsa.es>
From: Adrian Phillips <a.phillips@dnmi.no>
Date: 04 Oct 2001 17:18:51 +0200
In-Reply-To: <3BBC535B.59D6A5CB@promofinarsa.es>
Message-ID: <wv3d4zh1r8.fsf@freeze.oslo.dnmi.no>
MIME-Version: 1.0
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

>>>>> "Jesus" == Jesus Manuel NAVARRO LOPEZ <jesus_navarro@promofinarsa.es> writes:

    Jesus> I'm trying now lvm-1.0.1rc4 onto kernel 2.2.19 Raw-io patch
    Jesus> applied is that for 2.2.18 (I tested both with that from
    Jesus> kernel.org, and the one provided within the lvm tar).  I
    Jesus> don't know if the problem comes from raw-io or lvm itself
    Jesus> (I don't even know why or when raw-io patch is needed on
    Jesus> 2.2 kernel series).  What I can say is that the problem
    Jesus> shows up in the making modules phase at the lvm.c file.  It
    Jesus> is used there an struct member that doesn't seem to be
    Jesus> defined anywhere else.

Okay, calling LVM developers (or anyone else with more clue than me
:-). I've tried this myself :-

- linux 2.2.19
- reiserfs
- linux-2.2.18-rawio.patch
- lvm-1.0.1-rc4-2.2.19.patch

cc -D__KERNEL__ -I/mirrors/linux/linux-2.2.19/include -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -pipe -fno-strength-reduce -m486 -malign-loops=2 -malign-jumps=2 -malign-functions=2 -DCPU=586 -DMODULE -DMODVERSIONS -include /mirrors/linux/linux-2.2.19/include/linux/modversions.h   -c -o lvm.o lvm.c
lvm.c: In function `lvm_do_lv_create':
lvm.c:2192: structure has no member named `de'
{standard input}: Assembler messages:
{standard input}:9: Warning: Ignoring changed section attributes for .modinfo
lvm.c: In function `lvm_do_lv_remove':
lvm.c:2277: structure has no member named `de'
make[3]: *** [lvm.o] Error 1

Note the change in hd_struct in include/linux/genhd.c between 2.2.19
and 2.4.xxx :-

# 2.2.19
struct hd_struct {
	long start_sect;
	long nr_sects;
	int type;		/* RAID or normal */
};

# 2.4.0-test12
struct hd_struct {
	long start_sect;
	long nr_sects;
	devfs_handle_t de;              /* primary (master) devfs entry  */
};

So de is being set to the devfs_handle_t returned by lvm_fs_create_lv
and this doesn't exist in 2.2.19. So what needs to be set in 2.2 ?

What has been changed between 0.9.1beta7 (or later) and 1.0.1rc4 ?

I'll send this now and have a look (in CVS as well) to see if I can
anything obvious but not being a kernel hacker I am unsure of what is
required.

Thanks for any help,

Sincerely,

Adrian Phillips

-- 
Your mouse has moved.
Windows NT must be restarted for the change to take effect.
Reboot now?  [OK]
