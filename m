Message-ID: <000e01c36bf9$e5f82720$6402000a@gasaraki>
From: "Henric Andersson" <ha@thedudes.nu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Poor performance with LVM 1.0.7
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
Date: Tue Aug 26 12:47:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi all!

I've recently upgraded my poor little fileserver from an old P120 Classic to
a brandspanking new Celeron 2Ghz with 512MB DDR memory. By doing this, I
expected the performance of my fileserver to increase, giving me a total of
9,5MB/s when using samba.

And it did. But not when LVM is concerned :(

I have a VG setup with 3 drives (120GB each, not striped) which contains one
LV running an ext3 filesystem.
At first, I blamed my promise controllers (PDC 20269, ATA/133) but after
some serious testing, I found that whenever I didn't access files that was
stored on the LV, my speed was about 9.5MB/s, but when I transfered the same
file from the LV, I only got about half of it (4.2MB/s). The file I
transfered was roughly about 700-800MB big (same file used in all tests).

After scouring the net for suggestions on how to improve the speed, I came
up empty, and thus, I'm writing this email :)

Some more facts (more available if needed ;)) about the server:

All drives are tuned with 32bit transfers and DMA enabled. I'm running
kernel 2.4.22pre2 (gentoo).
CPU usage is low (around 10-25%) when transfering files, so it does not seem
to be the bottleneck.

Any suggestions and/or ideas are welcomed...

/Henric
