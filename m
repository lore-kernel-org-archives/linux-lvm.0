From: "Tomaz Beltram" <tomazb@hotmail.com>
Mime-Version: 1.0
Message-ID: <F75jCnVGx3R6Vf8xccu0002a6be@hotmail.com>
Subject: [linux-lvm] mounting ext3 snapshot occasionaly fails
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
Date: Tue Dec  3 06:35:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I have similar problems as described in this mailing list some months ago, 
regarding mounting snapshots of journaled file systems.

Mounting the snapshot fails and dmesg shows:
EXT3-fs: INFO: recovery required on readonly filesystem.
EXT3-fs: write access unavailable, cannot proceed.

I have observed that the failure is more frequent with longer delays between 
snapshot creation and mount time.

The problem was solved with the VFS-lock patch for 2.4.18 kernel. But I am 
using LVM 1.0.5 and 2.4.19-SuSE kernel (64GB-SMP). As I understand, it 
should already have the VFS-lock patch applied. If not, where can I find 
one?

Thanks in advance for your help.
Tomaz

_________________________________________________________________
The new MSN 8: advanced junk mail protection and 2 months FREE* 
http://join.msn.com/?page=features/junkmail
