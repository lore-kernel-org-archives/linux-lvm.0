Date: Mon, 10 Sep 2001 00:43:53 -0400
From: Chris Siebenmann <cks@utcc.utoronto.ca>
Message-Id: <01Sep10.004402edt.230178@ugw.utcc.utoronto.ca>
Subject: [linux-lvm] Mixing different versions of user-level tools and kernel LVM?
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

 Are there any guidelines on how mixable various versions of user level
tools and the kernel LVM code are?

 I prefer to test-boot new kernels before comitting to them, which is a
bit difficult if the user-level tools must be strictly synchronized to
the kernel versions.

 So I am wondering how widely it is safe to wander: for example, can
0.9.1_beta8 user level tools be used safely to assemble and start up
volume groups with kernel LVM 1.0 or 1.0.1rc2 code? Can the latest
user-level vgscan/vgchange be used safely with the 0.9.1_beta8 kernel
code?

 Is it the case that on-disk format changes are the important
breakpoints (eg beta7 to beta8), or are there others? Is this
documented anywhere?

	- cks
