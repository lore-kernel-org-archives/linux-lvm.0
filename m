Return-Path: <riel@conectiva.com.br>
Date: Mon, 16 Apr 2001 16:55:15 -0300 (BRST)
From: Rik van Riel <riel@conectiva.com.br>
Message-ID: <Pine.LNX.4.21.0104161653140.14442-100000@imladris.rielhome.conectiva>
MIME-Version: 1.0
Subject: [linux-lvm] 2.4.3-ac{6,7} LVM hang
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-lvm@sistina.com

Hi,

2.4.3-ac4 seems to work great on my test box (UP K6-2 with SCSI
disk), but 2.4.3-ac6 and 2.4.3-ac7 hang pretty hard when I try
to access any of the logical volumes on my test box.

The following changelog entry in Linus' changelog suggests me
whom to bother:   ;)
 - Jens Axboe: LVM and loop fixes

regards,

Rik
--
Virtual memory is like a game you can't win;
However, without VM there's truly nothing to lose...

		http://www.surriel.com/
http://www.conectiva.com/	http://distro.conectiva.com.br/
