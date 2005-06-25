Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5PMuKu05528
	for <linux-lvm@redhat.com>; Sat, 25 Jun 2005 18:56:20 -0400
Received: from adren.mine.nu (adren.mine.nu [81.56.37.44])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5PMuDbA020994
	for <linux-lvm@redhat.com>; Sat, 25 Jun 2005 18:56:13 -0400
Received: from localhost (localhost [127.0.0.1])
	by adren.mine.nu (Postfix) with ESMTP id 87EE728082
	for <linux-lvm@redhat.com>; Sun, 26 Jun 2005 00:56:10 +0200 (CEST)
Received: from adren.mine.nu ([127.0.0.1])
	by localhost (adren [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 01139-01 for <linux-lvm@redhat.com>;
	Sun, 26 Jun 2005 00:56:09 +0200 (CEST)
Date: Sun, 26 Jun 2005 00:56:09 +0200
From: Cyril Chaboisseau <cyril.chaboisseau@free.fr>
Message-ID: <20050625225609.GA13510@adren.mine.nu>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] nbd messages
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

since a couple of months I've got the following messages at boot :

nbd0: Request when not-ready
end_request: I/O error, dev nbd0, sector 0
Buffer I/O error on device nbd0, logical block 0
Buffer I/O error on device nbd0, logical block 1
Buffer I/O error on device nbd0, logical block 2
Buffer I/O error on device nbd0, logical block 3
Buffer I/O error on device nbd0, logical block 4
Buffer I/O error on device nbd0, logical block 5
Buffer I/O error on device nbd0, logical block 6
Buffer I/O error on device nbd0, logical block 7
nbd0: Request when not-ready
end_request: I/O error, dev nbd0, sector 0
Buffer I/O error on device nbd0, logical block 0
nbd0: Request when not-ready
end_request: I/O error, dev nbd0, sector 0
nbd1: Request when not-ready
end_request: I/O error, dev nbd1, sector 0
nbd2: Request when not-ready
end_request: I/O error, dev nbd2, sector 0
nbd3: Request when not-ready
end_request: I/O error, dev nbd3, sector 0
nbd4: Request when not-ready
end_request: I/O error, dev nbd4, sector 0
nbd5: Request when not-ready
end_request: I/O error, dev nbd5, sector 0
nbd6: Request when not-ready
end_request: I/O error, dev nbd6, sector 0
nbd7: Request when not-ready
end_request: I/O error, dev nbd7, sector 0
nbd8: Request when not-ready
end_request: I/O error, dev nbd8, sector 0
nbd9: Request when not-ready
end_request: I/O error, dev nbd9, sector 0
nbd10: Request when not-ready
end_request: I/O error, dev nbd10, sector 0
nbd11: Request when not-ready
end_request: I/O error, dev nbd11, sector 0
nbd12: Request when not-ready
end_request: I/O error, dev nbd12, sector 0
nbd13: Request when not-ready
end_request: I/O error, dev nbd13, sector 0
nbd14: Request when not-ready
end_request: I/O error, dev nbd14, sector 0
nbd15: Request when not-ready
end_request: I/O error, dev nbd15, sector 0
nbd0: Request when not-ready
end_request: I/O error, dev nbd0, sector 0
nbd1: Request when not-ready
end_request: I/O error, dev nbd1, sector 0
nbd2: Request when not-ready
end_request: I/O error, dev nbd2, sector 0
nbd3: Request when not-ready
end_request: I/O error, dev nbd3, sector 0
nbd4: Request when not-ready
end_request: I/O error, dev nbd4, sector 0
nbd5: Request when not-ready
end_request: I/O error, dev nbd5, sector 0
nbd6: Request when not-ready
end_request: I/O error, dev nbd6, sector 0
nbd7: Request when not-ready
end_request: I/O error, dev nbd7, sector 0
nbd8: Request when not-ready
end_request: I/O error, dev nbd8, sector 0
nbd9: Request when not-ready
end_request: I/O error, dev nbd9, sector 0
nbd10: Request when not-ready
end_request: I/O error, dev nbd10, sector 0
nbd11: Request when not-ready
end_request: I/O error, dev nbd11, sector 0
nbd12: Request when not-ready
end_request: I/O error, dev nbd12, sector 0
nbd13: Request when not-ready
end_request: I/O error, dev nbd13, sector 0
nbd14: Request when not-ready
end_request: I/O error, dev nbd14, sector 0
nbd15: Request when not-ready
end_request: I/O error, dev nbd15, sector 0
kjournald starting.  Commit interval 5 seconds


...but also each time I do a pvscan/vgscan or lvscan :

adren:~# pvscan
  /dev/nbd0: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd0: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd1: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd2: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd3: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd4: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd5: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd6: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd7: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd8: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd9: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd10: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd11: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd12: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd13: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd14: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd15: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd16: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd16: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd17: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd18: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd19: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd20: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd21: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd22: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd23: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd24: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd25: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd26: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd27: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd28: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd29: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd30: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd31: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd32: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd32: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd33: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd34: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd35: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd36: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd37: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd38: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd39: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd40: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd41: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd42: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd43: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd44: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd45: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd46: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd47: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd48: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd48: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd49: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd50: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd51: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd52: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd53: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd54: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd55: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd56: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd57: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd58: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd59: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd60: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd61: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd62: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd63: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd64: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd64: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd65: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd66: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd67: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd68: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd69: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd70: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd71: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd72: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd73: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd74: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd75: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd76: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd77: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd78: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd79: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd80: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd80: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd81: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd82: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd83: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd84: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd85: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd86: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd87: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd88: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd89: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd90: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd91: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd92: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd93: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd94: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd95: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd96: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd96: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd97: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd98: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd99: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd100: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd101: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd102: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd103: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd104: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd105: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd106: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd107: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd108: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd109: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd110: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd111: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd112: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd112: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd113: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd114: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd115: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd116: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd117: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd118: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd119: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd120: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd121: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd122: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd123: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd124: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd125: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd126: read failed after 0 of 4096 at 0: Input/output error
  /dev/nbd127: read failed after 0 of 4096 at 0: Input/output error
  PV /dev/sda4   VG vg   lvm2 [146.01 GB / 105.01 GB free]
  Total: 1 [146.01 GB] / in use: 1 [146.01 GB] / in no VG: 0 [0   ]


but appart from that, everything's fine !



is there any reason to worry ?

how can I stop such messages ?


-- 
	Cyril Chaboisseau
