From: Patrick McCarty <mccartyp@apu.edu>
Message-ID: <Pine.LNX.4.33.0110221458580.12322-100000@home.apu.edu>
MIME-Version: 1.0
Subject: [linux-lvm] 2.2.13ac5 with LVM
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
Date: Mon Oct 22 17:03:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi folks,

I've currently running a 2.4.8 linus kernel with LVM rc2,
but now being forced to implement quotas, I must switch to one
of Alan's kernels. FWIW, we've been serving up well over 500GB with
multiple volumes via NFS, and it's been rock solid.

I've been struggling to compile LVM rc4, and CVS against it, but
fail due to the kiovec issue.

Let me back up a step and ask another question:

What would be the most stable configuration of LVM/ext3/quotas?
I've considered the latest 2.4.10ac kernel series as well to back up to 
before he reverted some code to further sync up with linus.

Anyone have any insight?

Thanks!

-- Patrick

Thank you sir. May I have another?
