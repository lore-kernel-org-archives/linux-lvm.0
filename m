From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Message-ID: <20011203150732.A10538@sistina.com>
Mime-Version: 1.0
Subject: [linux-lvm] [superkind@arrogant.de: [lvm-devel] Restore PVs/VGs]
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
Date: Mon Dec  3 08:06:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

----- Forwarded message from David 'Superkind' Roden <superkind@arrogant.de> -----

Return-path: <lvm-devel-admin@sistina.com>
Envelope-to: mauelshagen@sistina.com
Delivery-date: Mon, 03 Dec 2001 06:01:30 -0600
From: "David 'Superkind' Roden" <superkind@arrogant.de>
X-X-Sender:  <superkind@lkcc.pinuts.de>
To: lvm-devel <lvm-devel@sistina.com>
Subject: [lvm-devel] Restore PVs/VGs
Errors-To: lvm-devel-admin@sistina.com
X-BeenThere: lvm-devel@sistina.com
X-Mailman-Version: 2.0.6
Reply-To: lvm-devel@sistina.com
List-Help: <mailto:lvm-devel-request@sistina.com?subject=help>
List-Post: <mailto:lvm-devel@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/lvm-devel>,
	<mailto:lvm-devel-request@sistina.com?subject=subscribe>
List-Id: general discussion about LVM devel <lvm-devel.sistina.com>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/lvm-devel>,
	<mailto:lvm-devel-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/lvm-devel/>
X-Original-Date: Mon, 3 Dec 2001 14:01:55 +0100 (CET)
Date: Mon, 3 Dec 2001 14:01:55 +0100 (CET)


Hi.


I recently reinstalled one of the fileservers here in the office. I used
SuSE 7.1, Linux 2.4.16 and LVM 0.9.

While installing, YaST realized that I had several PVs on my system. It
asked whether it should add them to a VG. I answered "yes", but
unfortunately YaST seems to have reinitialized the PVs and created a new
VG.

I still do have the old /etc/lvmconf/*.conf file - is this of any use in
restoring the old VG? Is there any way to restore the old PV and VG
configuration, or can I wave the data good-bye?


Thanks in advance,
	David


_______________________________________________
lvm-devel mailing list
lvm-devel@sistina.com
http://lists.sistina.com/mailman/listinfo/lvm-devel

----- End forwarded message -----
