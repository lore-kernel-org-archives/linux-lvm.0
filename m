From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] can't make new filesystems?
Message-ID: <20021113083216.GB25918@percy.comedia.it>
References: <Pine.A41.4.43.0211121809350.48658-100000@hera.itg.uiuc.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.A41.4.43.0211121809350.48658-100000@hera.itg.uiuc.edu>
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
Date: Wed Nov 13 02:33:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Linux LVM Sistina <linux-lvm@sistina.com>

On Tue, Nov 12, 2002 at 06:19:20PM -0600, Alexander Lazarevich wrote:
[vc/2]bluca@Moskowskaya:~% mkfs.ext3
mke2fs 1.27 (8-Mar-2002)
Usage: mkfs.ext3 [-c|-t|-l filename] [-b block-size] [-f fragment-size]
        [-i bytes-per-inode] [-j] [-J journal-options] [-N number-of-inodes]
        [-m reserved-blocks-percentage] [-o creator-os] [-g blocks-per-group]
        [-L volume-label] [-M last-mounted-directory] [-O feature[,...]]
        [-r fs-revision] [-R raid_opts] [-qvSV] device [blocks-count]

this says the last (only) two non option arguments are the device and the
number of blocks the device has.

>[root@discord root]# mkfs.ext3 /dev/homevg/stafflv /home/staff
>mke2fs 1.27 (8-Mar-2002)
>mkfs.ext3: bad blocks count - /home/staff

this error says that the string '/home/staff' does not look like a number
of blocks at all.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
