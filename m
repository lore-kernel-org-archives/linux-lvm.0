From: Christophe Zwecker <doc@zwecker.de>
Content-Transfer-Encoding: 7bit
Message-Id: <1017872898.18631.8.camel@dumbo.zwecker.de>
MIME-Version: 1.0
Subject: [linux-lvm] XFS crash on lvm
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
Date: Wed Apr  3 16:28:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

I use 2.4.18-xfs with lvm-tools-1.0.1rc4_iop10-fr2
lvm-base-1.2-fr1

I havw a 200GB lv. I had 2.4.16 running after fiddling with usb the
whole machine crashed, reboot, the fs was corrupt. I had to zerosize the
journal log, xfs_repair, everything in lost+found.

Reformating the fs didnt do the trick (ext3 or xfs) I got told when
mounting the empty fs, the superblock was not found. Ok I did another
xfs_repair, after I could reformat again and mount the empty xfs fs.

Put some data, after 10 hours I got this in kernel log:

Apr  2 18:07:33 dumbo Corruption of in-memory data detected.  Shutting
down filesystem: lvm(58,1)
Apr  2 18:07:33 dumbo Please umount the filesystem, and rectify the
problem(s)

again the fs is corrupt. I searched google for this error and found
somthing in sgi's mailinglist archive. Too bad oss.sgi.com is down since
about 2 days :-(

thats why I ask here, anyone has an idea whats wrong here ? sofar I had
only the best experience with lvm and xfs! all my other volumes seem
intact....

Anyone got an Idea what I should do ?

sofar im waiting for oss.sgi.com to come back online to check what I can
find about this error my kernel throws...

thx alot for any help.

regards,

Christophe
-- 
Christophe Zwecker                     mail: doc@zwecker.de
Hamburg, Germany                        fon: +49 179 3994867
http://www.zwecker.de

"Who is General Failure ?  And why is he reading my disk ??"
