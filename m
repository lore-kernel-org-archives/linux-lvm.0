From: Andreas Dilger <adilger@turbolabs.com>
Date: Thu, 4 Oct 2001 11:10:23 -0600
Subject: Re: [linux-lvm] kernel 2.2.19 support
Message-ID: <20011004111023.C31061@turbolinux.com>
References: <3BBC4146.51CD437D@promofinarsa.es> <wv669v3b96.fsf@freeze.oslo.dnmi.no> <3BBC4E6E.BCA3EE70@promofinarsa.es> <wvzo771uju.fsf@freeze.oslo.dnmi.no> <3BBC535B.59D6A5CB@promofinarsa.es> <wv3d4zh1r8.fsf@freeze.oslo.dnmi.no>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <wv3d4zh1r8.fsf@freeze.oslo.dnmi.no>
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

On Oct 04, 2001  17:18 +0200, Adrian Phillips wrote:
> Jesus Manuel NAVARRO LOPEZ <jesus_navarro@promofinarsa.es> writes:
> Note the change in hd_struct in include/linux/genhd.c between 2.2.19
> and 2.4.xxx :-
> 
> # 2.2.19
> struct hd_struct {
> 	long start_sect;
> 	long nr_sects;
> 	int type;		/* RAID or normal */
> };
> 
> # 2.4.0-test12
> struct hd_struct {
> 	long start_sect;
> 	long nr_sects;
> 	devfs_handle_t de;              /* primary (master) devfs entry  */
> };
> 
> So de is being set to the devfs_handle_t returned by lvm_fs_create_lv
> and this doesn't exist in 2.2.19. So what needs to be set in 2.2 ?

What you need to do to "properly" fix this is add a lines like

#if LINUX_VERSION_CODE > KERNEL_VERSION ( 2, 3, X)
	foo.de = bar;
#endif

around the two offending code sections, and find the appropriate kernel version
where this entry was added.  This can be done by looking at the kernel CVS:
                http://lxr.linux.no/

(best to start by checking if it is in 2.4.0, or a recent addition, and then
going back through 2.3.X kernels).

Send the resulting patch back to the list.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
