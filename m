Message-ID: <3D9A201E.8070108@lingbrae.com>
From: Dick Middleton <dick@lingbrae.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Upgrade Linux 2.2 to 2.4 problems
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
Date: Tue Oct  1 17:23:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I'm still having difficulty getting LVM to behave itself on a 2.4 kernel 
when it
works fine on a 2.2 kernel.  I'm using beta7 on both kernels - the 2.4 
kernel
is 2.4.10.ac4 which seems to have version beta7(ish) in it.  I'm booting 
through
initrd as /root is on LVM.

vgscan appears to work ok but vgchange fails with:

Error- can't get names of physical volumes - please check if /proc is 
mounted.

Well, /proc is mounted - in fact if it isn't mounted I don't this error.

What does this error message mean and what's likely to be wrong to cause it?

Many thanks

Dick
