From: Piotr Kaczuba <pepe@attika.ath.cx>
Message-ID: <20031226214405.GC20221@orbiter.attika.ath.cx>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM2: Problems with "lvextend" on device with mounted filesystem
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
Date: Fri Dec 26 15:45:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: linux-lvm@sistina.com

I can confirm this problem; I'm also not able to resize online a  
reiserfs filesystem since i've upgraded to kernel 2.6 and lvm2.  
resize_reiserfs says "run reiserfsck --check first" but reiserfsck  
detects no problems. Offline resizing works without any complaints. Lvm  
and reiserfs partitions were set up with linux 2.4 and lvm1 and back  
then online resizing was no big deal, but then I migrated to 2.6 and  
lvm2 and now I have always to unmount the partition first before  
resizing the filesystem wich is really annoying. lvmextend itself seems  
to do its job well, but then again only kernel and lvm have changed  
before the trouble has started. I didn't find any hints on the web  
about this issue but this thread on linux-lvm.

Piotr Kaczuba
