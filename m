From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] lvm -- lvm_chr_ioctl: unknown command 4004fe0a
Message-ID: <20011028154118.A11252@lynx.no>
References: <Pine.LNX.4.21.0110271411390.12053-100000@miami.datech2.er.heitec.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0110271411390.12053-100000@miami.datech2.er.heitec.net>; from Holger.Rauch@heitec.de on Sat, Oct 27, 2001 at 02:16:33PM +0200
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
Date: Sun Oct 28 19:45:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Oct 27, 2001  14:16 +0200, Holger Rauch wrote:
> I'm running LVM 0.9.1_beta4 on a SuSE 7.0 (glibc 2.1.3 based) system
> together with a 2.2.19 SMP kernel (allegedly certified by SAP), the
> LVM version mentioned was in the same dir on a SuSE FTP mirror) and the
> message

Your kernel is using old LVM code.

> lvm -- lvm_chr_ioctl: unknown command 4004fe0a
> is repeated three times. What causes this message to appear?

This is just a warning and not a source of problems in itself.  It does
mean that there are still bugs in the LVM code that have not been fixed. 
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
