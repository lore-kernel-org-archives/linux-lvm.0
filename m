Message-ID: <45927A77.1030104@redhat.com>
Date: Wed, 27 Dec 2006 14:51:51 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM full snapshot deletion bug - again
References: <4591227C.9060605@oxeva.fr>
In-Reply-To: <4591227C.9060605@oxeva.fr>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: gabriel@oxeva.fr, LVM general discussion and development <linux-lvm@redhat.com>

Gabriel Barazer wrote:
> Hello,
> 
> This bug has been reported about a few weeks ago, but I don't know if it 
> has been noticed ?
> This is about a segfault with lvremove which occurs when deleting a 
> corrupted snapshot (because COW space is full, attributes are "Swi-I-")

Hi,
fix already included in 2.6.18.6 kernel (and in 2.6.19 too).

Regards,
Milan

--
mbroz@redhat.com
