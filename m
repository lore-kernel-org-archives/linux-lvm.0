From: "Rupert Hair" <rupert.hair@ntlworld.com>
Date: Tue, 13 Apr 2004 15:29:18 +0100
Message-ID: <000801c42163$b4b50e60$1530a8c0@aphrodite>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Stable Mirror Target?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: dm-devel@redhat.com, linux-lvm@redhat.com

Just a quick question:  Is there a stable DM mirror target for 2.6?

More detail (in case I'm being silly and don't need the mirror target): 

I got the following error from pvmove:
	"device-mapper ioctl cmd 9 failed: Invalid argument"
And from the LVM mailing list archives I found that I need the DM mirror
target to use pvmove in LVM2.  The kernel I'm using (debian testing's
2.6.3-1-k7) does not have a mirror target module or an option in the kernel
source.  I found some kernel patches here:
	http://people.sistina.com/~thornber/patches/
But there is not very much documentation on the status of this code.  Have
other LVM2 users had good experiences with the mirror target patches
available in the 2.6-unstable/ directory?

Thanks for your time,

Rupert
