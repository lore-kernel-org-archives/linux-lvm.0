From: Anders Widman <andewid@tnonline.net>
Message-ID: <99301953.20021118085024@tnonline.net>
Subject: Re: [linux-lvm] mirrored logical volumes
In-Reply-To: <11538.1037603334@www65.gmx.net>
References: <11538.1037603334@www65.gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Mon Nov 18 01:51:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Grill <linux-lvm@sistina.com>

> Hi,

> I would like to install Linux (SuSE 8.1) on my pc (AMD 800 MHz, 2 x 8 GB
> SCSI harddiscs) with mirrored logical volumes (LVM + Soft-RAID). Is this
> possible ? If yes, how can that be done?

It  would  be easy enough to do the mirroring with software raid below
the LVM. Then You run LVM on top of the mirrored volume.

> Best regards,
> Thomas Grill
