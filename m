Return-Path: <eike@euklid.math.uni-mannheim.de>
From: Rolf Eike Beer <eike@euklid.math.uni-mannheim.de>
Date: Thu, 26 Jul 2001 22:01:47 +0200
MIME-Version: 1.0
Message-Id: <01072622014700.00528@bilbo>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM and startup-scripts
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi!

I had some problems with lvm at startup, too. The scsi driver created the 
directories /dev/scsi/host0/bus0/targetNN/lun0, but not the entry disc in it. 
This works now, but is ugly:

    modprobe -k aic7xxx
     mknod /dev/sda b 8 0 >/dev/null 2>&1
     modprobe -k lvm-mod
     vgscan
     vgchange -a y

Any better ideas?

R.E.Beer
