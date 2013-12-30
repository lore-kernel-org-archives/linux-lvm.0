Date: Mon, 30 Dec 2013 02:00:26 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20131230020026.GB16777@agk-dp.fab.redhat.com>
References: <52C0C51C.7060806@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <52C0C51C.7060806@gmail.com>
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
To: Guy Rouillier <guy.rouillier@gmail.com>
Cc: linux-lvm@redhat.com

On Sun, Dec 29, 2013 at 07:58:04PM -0500, Guy Rouillier wrote:
> /dev/dell-vg/oraclelinux-root appears to contain an existing filesystem  
> (btrfs).
> Error: Use the -f option to force overwrite.

Does your version of xen-create-image offer a way to supply that -f?

If you're running lvremove yourself before retrying, look into running
wipefs manually on the device first.

Alasdair
