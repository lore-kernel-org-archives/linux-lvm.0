Return-Path: <alciocca@ecetra.com>
Date: Tue, 19 Jun 2001 19:00:45 +0200 (CEST)
From: Adam Cioccarelli <alciocca@ecetra.com>
Message-ID: <Pine.LNX.4.33.0106191857020.3018-100000@vie-ac.office.ecetra.com>
MIME-Version: 1.0
Subject: [linux-lvm] RE: LVM and Lilo
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I have made the initrd image, boot is mounted, everything works fine
basically, just that I can't run lilo when my root partition is a logical
volume... If I boot into my old non-lvm root installation I can change the
lilo.conf on the root logical volume and do a lilo -C /mnt/etc/lilo.conf
and it will work.

I read something about having to patch lilo but this was from a fair while
ago. Does it still apply?

Regards,
Adam Cioccarelli
