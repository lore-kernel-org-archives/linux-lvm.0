Subject: Re: [linux-lvm] LVM2: Problems with "lvextend" on device with
	mounted filesystem
From: Christophe Saout <christophe@saout.de>
In-Reply-To: <20031226214405.GC20221@orbiter.attika.ath.cx>
References: <20031226214405.GC20221@orbiter.attika.ath.cx>
Message-Id: <1072493983.12644.4.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
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
Date: Fri Dec 26 21:01:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: Piotr Kaczuba <pepe@attika.ath.cx>

Am Fr, den 26.12.2003 schrieb Piotr Kaczuba um 22:44:

> I can confirm this problem; I'm also not able to resize online a  
> reiserfs filesystem since i've upgraded to kernel 2.6 and lvm2. 
> [...]

Known problem in vanilla 2.6, fixed in 2.6.0-mm1. The specific fix is:

http://people.sistina.com/~thornber/patches/2.6-stable/2.6.0-test10/2.6.0-test10-dm1/00001.patch

(the other patches in that directory don't hurt either, that's why it's
called stable ;))

--
Christophe Saout <christophe@saout.de>
Please avoid sending me Word or PowerPoint attachments.
See http://www.fsf.org/philosophy/no-word-attachments.html
