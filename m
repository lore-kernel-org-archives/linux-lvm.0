Message-ID: <3D7E4050.B3BEEE@storix.com>
From: Anthony Johnson <anthony@storix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Quorums / VGDAs
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
Date: Tue Sep 10 13:54:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I'm trying to find information on the availability factors of LVM. As I
understand it, a quorum is required for a volume group to be available.
I have some questions in this regard:

1) What defines a quorum - over 50% of the PVs in the VG, or over 50% 
   of the VGDAs?
2) How many VGDAs are stored on each physical volume. From AIX 
   experience, this varied depending on the number of PVs in the VG.
3) If quorum is lost on an active VG, is the entire VG automatically 
   varied off?
4) Can a VG without quorum be forcefully varied on?
5) Can quorum checking be disabled?

Thanks,
Anthony
