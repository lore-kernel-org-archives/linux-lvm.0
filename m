Return-Path: <terje.eggestad@scali.no>
From: Terje Eggestad <terje.eggestad@scali.no>
Content-Transfer-Encoding: 7bit
Date: 25 Jul 2001 13:51:37 +0200
Message-Id: <996061897.15463.19.camel@pc-16>
Mime-Version: 1.0
Subject: [linux-lvm] vgscan fails to find VGs
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
To: linux-lvm <linux-lvm@sistina.com>

NB: I'm using 0.9.1 B2 in case this problem is already fixed!
(also RH 7.1 with stock 2.4.3).

But since At the bottom of http://www.sistina.com/lvm/doc/KNOWN_BUGS
is says:

- there still seems to be a rare condition when vgscan(8) fails
  to find your VGs.
  Basically you only need to run vgscan if your disk
  configuration changed or your lost your /etc/lvmtab* entries.

So it still may not be fixed.

Anyway i figured out that vgscan fails if there is a CD in the CD
player, doesn't matter if's a audio or iso9660 CD.

if you run vgscan -d 
you get way down:
<333> pv_read -- going to read /dev/hdc
<333> pv_read -- LEAVING with ret: -282
<22> pv_read_all_pv -- pv_read returned: -282

I only have hda and hdc, no scsi. 

TJ

--
_________________________________________________________________________

Terje Eggestad                  terje.eggestad@scali.no
Scali Scalable Linux Systems    http://www.scali.com

Olaf Helsets Vei 6              tel:    +47 22 62 89 61 (OFFICE)
P.O.Box 70 Bogerud                      +47 975 31 574  (MOBILE)
N-0621 Oslo                     fax:    +47 22 62 89 51
NORWAY            
_________________________________________________________________________
