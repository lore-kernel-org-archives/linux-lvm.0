From: Kai Weber <lists@glorybox.de>
Message-ID: <20031130185807.GF7634@glorybox.de>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] vgscan messages regarding read-only cdrom
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
Date: Sun Nov 30 12:59:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

when starting lvm2 I get the following annoying messages from vgscan:

$ vgscan
  Reading all physical volumes.  This may take a while...
  /dev/cdrom: open failed: Read-only file system
cdrom: open failed.
cdrom: open failed.
[...]
  Found volume group "datavg" using metadata type lvm1
  Found volume group "systemvg" using metadata type lvm1

The line "cdrom: open failed." is repeated about 50 times. I believe I can
ingore this message. But

* why is vgscan reading /dev/cdrom (a link to my first IDE
CD-ROM /dev/hdc)?

* how can I disable this message?

Kai
-- 
* mail kai.weber@glorybox.de . icq 102024972
  web http://www.glorybox.de . pgp 0x594D4132
