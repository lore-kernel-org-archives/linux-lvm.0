From: Nils Juergens <nils@muon.de>
Subject: Re: [linux-lvm] Best practice for lvm on raid-5
Message-ID: <20040202162025.GA27150@muon.de>
References: <20040202153506.GN5191@deepthought.hausboot.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040202153506.GN5191@deepthought.hausboot.org>
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
Date: Mon Feb  2 11:22:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, 02.02.04, Jens Hoffrichter <joho@hausboot.org> wrote:

> Currently I have /dev/md0 as my only physical volume, but this will lead
> to problems if I am going to expand the raid 5 by adding another 80 GB
> harddrive to (as pvresize is not implemented again yet, as I understand).

Unless I am mistaken, it is not even possible to expand /dev/md0 by adding
another drive in the first place. And because linux software raid has
no way of knowing which blocks are in use and which are not, i do not see
how this could ever be possible.

If you add another array (raid1 or raid5) as /dev/md1, you can vgextend your
VG.

cheers,

Nils

-- 
Nils Juergens  | nils@muon.de | icq 7090774
Having problems sending big files over the net?
Try out Efisto (http://efisto.rnbhq.org).
