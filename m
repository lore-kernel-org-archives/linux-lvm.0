Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0J76IJd002400
	for <linux-lvm@redhat.com>; Tue, 19 Jan 2010 02:06:18 -0500
Received: from maude.comedia.it (maude.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o0J765ig015123
	for <linux-lvm@redhat.com>; Tue, 19 Jan 2010 02:06:06 -0500
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 13CF786FC2
	for <linux-lvm@redhat.com>; Tue, 19 Jan 2010 08:06:05 +0100 (CET)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id gR9u7Lr8SHQn for <linux-lvm@redhat.com>;
	Tue, 19 Jan 2010 08:06:04 +0100 (CET)
Date: Tue, 19 Jan 2010 08:06:04 +0100
From: Luca Berra <bluca@comedia.it>
Message-ID: <20100119070604.GA2891@maude.comedia.it>
References: <4B5535ED.3090406@speakeasy.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4B5535ED.3090406@speakeasy.net>
Subject: Re: [linux-lvm] How To Clone and Resize Luks-Encrypted Fedora	System
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Mon, Jan 18, 2010 at 11:32:45PM -0500, Robert L Cochran wrote:
> I am looking for a way to clone and resize a Fedora 12 x86_64 system to a 
> new hard drive which provides a lot more capacity. The system I wish to 
> clone is encrypted with luks. I basically need to move the whole system to 
> a larger drive, then resize the partitions larger. These are ext4 
> partitions. Here is what my grub.conf kernel line says:
not much to do with lvm... anyway

why don't you just clone the data?
install the new disk, partition, create luks device, mkfs, mount, copy
data (eg rsync -aHAX, the X should preserve selinux xattrs), install
grub on new disk, reboot.

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
