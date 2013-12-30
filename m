Date: Mon, 30 Dec 2013 01:55:55 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20131230015554.GA16777@agk-dp.fab.redhat.com>
References: <52C0C51C.7060806@gmail.com>
	<0930dbad0e746334315c5203d1b67457.squirrel@ssl.verfeiert.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0930dbad0e746334315c5203d1b67457.squirrel@ssl.verfeiert.org>
Subject: Re: [linux-lvm] lvremove is not deleting the file system
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sven@whgl.uni-frankfurt.de, LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Dec 30, 2013 at 02:46:45AM +0100, Sven Eschenberg wrote:
> Think of this, once you delete a partition table and recreate it with the
> same layout, all filesystems will be available, if the drive was not
> touched in any way.
 
Although lvcreate has a --zero option enabled by default that wipes
the beginning of the new device (and the next upstream release extends
this to wipe more signatures using libblkid).

You need to investigate precisely how your version of 'xen-create-image' is
using LVM and with which options.

Alasdair
