From: Hadmut Danisch <hadmut@danisch.de>
Message-ID: <20011030204337.A2598@danisch.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Bug Report LVM 1.0.1 RC4
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
Date: Tue Oct 30 13:42:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-LVM@sistina.com

Hi,

I'd like to report a bug in LVM 1.0.1 RC4:

I was using a 2.4.12 Linux Kernel with LVM 1.0.1 RC4
patched in.

I was removing logical volumes and a volume group
formerly installed with LVM 0.9.

when removing the volumen group, a segmentation fault
(null pointer access) occured in the kernel. Same
problem occured on two independent computers.

regards
Hadmut Danisch
