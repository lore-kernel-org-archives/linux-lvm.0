From: Daniel Savard <dsavard@videotron.ca>
MIME-Version: 1.0
Message-Id: <01111911040602.01226@dirac.cids.ca>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] root fs on a LVM cause kernel panic
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
Date: Mon Nov 19 10:10:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: joost@e-cube.nl

No, the /boot is on a ext2 filesystem and JFS is built-in the kernel. I
followed the instructions from the IBM web site for JFS. However, I am not
finished with my setup and I cannot confirm you if it is working as expected.
But, the procedure makes sense.

> Does Lilo support JFS? I use XFS instead of EXT2 but for that I needed to
> patch lilo with XFS support.
>
>
> Joost van der Locht
> Technisch Directeur

-- 

================================
Daniel Savard
Internet: dsavard@videotron.ca
================================
