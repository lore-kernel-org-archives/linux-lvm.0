From: "John Moser" <jmoser@erc.wisc.edu>
Message-Id: <CBEHLLOPCKAOIAOINGKAEEHACAAA.jmoser@erc.wisc.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20020124021457.GA15661@balu.kawo2.rwth-aachen.de>
Subject: [linux-lvm] I/O Error removing a file
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
Date: Mon Feb  4 12:46:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I encountered what I was able to diagnose as a hardware error on one of the
hard drives in my system.  In order to make sure my data was safe, I added
an additional drive, and performed a pvmove of the data onto the healthy
drive (moving all the PE's off the bad disk).  That all went fairly well
(except for taking forever).

However, I still have a few files which are giving me troubles.

root@vpn:/home/vpnwork# rm -R TestData2k
rm: cannot remove `TestData2k': Input/output error

Is there a way to remove these files so that I can recreate them?  I'm using
LVM version 1.0.1-rc4, on a Linux kernel 2.5.0.

Thanks,
-John Moser
