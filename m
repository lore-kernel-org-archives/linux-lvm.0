Return-Path: <emmanuel.blot@ireland.sun.com>
Message-ID: <03b201c0fff4$aa4007c0$01e6a8c0@oulx>
From: "Emmanuel Blot" <emmanuel.blot@ireland.sun.com>
Date: Thu, 28 Jun 2001 18:06:25 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] HowTo: EIDE/ATA-100 + RAID 1 + LVM
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

Hi,

I don't know much about RAID and LVM.

I have to set up a server, and I'd like to know if it's possible -and =
reliable- to setup a server
with RAID 1 (mirrored disk) with a pure software solution (not RAID =
controller) and LVM

* disks: two 40 GB IBM 60GXP (ATA-100).
* motherboard: Asus with AMD760 + DDR (Athlon Thunderbird)
* distribution: SuSE 7.2, with Linux kernel 2.4.4

- Are there some known issues/bugs with this configuration ?
- Where can I start (documentation URL I should know, ...)
- What is the installation order to follow (between software =
installation, RAID setup, LVM setup, ...)
- Any other suggestion

As the server has to be mostly remote-administrated (from other =
countries...), reliability is a key.
Is LVM stable enough with RAID-1 and Linux 2.4.x ?

Thanks in advance,
Emmanuel.
