From: John DeFranco <defranco@airwolf.cup.hp.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1060906319.18416.1783.camel@airwolf.cup.hp.com>
Mime-Version: 1.0
Subject: [linux-lvm] lvm -- lvm_blk_ioctl: unknown cmd
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
Date: Thu Aug 14 19:06:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I'm running lvm 1.0.7 on RedHat AS2.1 U2 + Errata e25. When I fsck a
logical volume I get the following messages:


lvm -- lvm_blk_ioctl: unknown cmd 0x1260
lvm -- lvm_blk_ioctl: unknown cmd 0x801c0204

This does not occur with reiserfs. Should I be concerned? All the data
seems to be ok.

Thansk!

John DeFranco			Hewlett-Packard Company
john.defranco@hp.com		Availability Clusters Solution Division
phone: 408-447-7543		19111 Pruneridge Ave, M/S 4101
fax: 408-447-0056		Cupertino, CA 95014 
