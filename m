Message-ID: <3C17D4D2.5020204@kenamea.com>
From: Kenny Gorman <kenny@kenamea.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Continued error with snapshots (unable to init journal)
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
Date: Wed Dec 12 16:25:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I posted before, but since I have upgraded my SuSE 2.4.7-64GB system to 
include reiserfs-3.x.0k_pre9-43 and lvm-1.0.0.2_rc2-27.  I am still 
getting the below error in /var/log/messages every once in a while 
during mount of the snapshot volume.

Does anyone know what this is about?

Dec 11 18:20:02 ino kernel: reiserfs: checking transaction log (device 
3a:01) ...
Dec 11 18:20:02 ino kernel: clm-2076: device is readonly, unable to 
replay log
Dec 11 18:20:02 ino kernel: Replay Failure, unable to mount
Dec 11 18:20:02 ino kernel: reiserfs_read_super: unable to initialize 
journal space

Thanks,
Kenny Gorman
DBA
Kenamea
