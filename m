From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM and devfs
Message-ID: <20031215194252.GA30671@percy.comedia.it>
References: <20031214113328.74647.qmail@web13505.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031214113328.74647.qmail@web13505.mail.yahoo.com>
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
Date: Mon Dec 15 13:44:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Dec 14, 2003 at 03:33:28AM -0800, Stuart Felenstein wrote:
>   I  didn't  see a search option in the archives and I apologize if this
>   is  more  appropriate  to  the  devfs list.  I installed RedHat9 , and
>   partitioned  with DiskDruid using LVM.  The only partition that is not
>   LVM is /boot.
- devfs in not supported on redhat 9
- lvm created on a non devfs system do not work on a devfs system
  without tinkering and vice versa. devfs=nomount yelds even worse
  results
  remove devfs from your kernel

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
