From: Anders Widman <andewid@tnonline.net>
Message-ID: <1851096421.20030119165740@tnonline.net>
Subject: Re: [linux-lvm] Getting 200GB ATA133 and Promise Ultra133 to work
In-Reply-To: <001101c2bfd0$ac08b5f0$4201a8c0@eagle>
References: <001101c2bfd0$ac08b5f0$4201a8c0@eagle>
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
Date: Sun Jan 19 09:57:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Bjorn <programmer@spk.cc>
Cc: linux-lvm@sistina.com

> Hello!

> I have Slackware 8.1 and activated lvm on 4 200GB Maxtor ATA133 drives.
> Only 130 GB became useable on each drive. Upgrading Linux kernel to 2.4.20
> and downloading LVM2 and device mapper from sestina. Doing 2.4.19 patch on
> 2.4.20. Still lvm thinks it is 130 GB drives.
> What is the trick to use 200GB drives?

Do  you  have  a  IDE  controller  that  support  BIG Drive Technology
(132GB+)?

> Regards,

> //Bjorn



> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
