Resent-Message-ID: <20031105021145.2994.qmail@tobias.wagener.nu>
From: Tobias Wagener <tobias-lvm@tobias.wagener.nu>
Message-ID: <20031105012047.A1152@wagener.nu>
Mime-Version: 1.0
Content-Disposition: inline
Resent-To: linux-lvm@sistina.com
Subject: [linux-lvm] dma_timer_expiry and pvmove problem
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
Date: Tue Nov  4 20:12:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

every time I try to "unzip", "cp" or only "cat" one special file in my lvm
the system freezes and I must reboot.

The last messages in kernel-log are:
   Nov  5 00:46:43 go kernel: hde: dma_timer_expiry: dma status == 0x61
   Nov  5 00:46:53 go kernel: hde: error waiting for DMA
   Nov  5 00:46:53 go kernel: hde: dma timeout retry: status=0x51 { DriveReady SeekComplete Error }
   Nov  5 00:46:53 go kernel: hde: dma timeout retry: error=0x40 { UncorrectableError }, LBAsect=111599988, high=6, low=1093
   Nov  5 00:46:53 go kernel: end_request: I/O error, dev 21:01 (hde), sector 111599922

Some times ago somebody had the same problems and the answer was to
"pvmove" the files of "hde" to another harddisk and remove the "hde"-drive.

The question is (I don't try it, but I think this will happend): 
"pvmove" read this special file also, and the system will freezes, too. Is there
a way to tell pvmove to leave some sectors/inodes away? Because I think there is
a defect sector on this harddrive and that is the reason for the fatal error.
Or, does someone think, if I switch off the use of DMA, this problem will be fixed?
I'm not that kind of expert, so please be patient with me ;)

If this is not possible, another question: I think I can put some new harddisks 
in my computer and copy (with "cp") the files (without the special one) to a new 
lvm. Delete the old lvm and remove the defect drive. 
My Question now is: The new lvm will be "/dev/hdg" and "/dev/hdh", but after this
action I want that this lvm is build out of "hde" and "hdf". Is there a way to
tell the lvm to use for an existing vg other partitions than the ones defined at
build time?


Please excuse my bad english, I hope you understand everything I want to tell you ;)

Greetings Tobias
