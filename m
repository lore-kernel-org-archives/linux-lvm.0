Return-Path: <michael.burschik@postbank.de>
Message-Id: <sabefed6.028@MS106BN>
Date: Mon, 26 Mar 2001 08:29:11 +0200
From: "Michael Burschik" <michael.burschik@postbank.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: [linux-lvm] LVM on top of Software Raid
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

I have frequently read that it is possible to use lvm on top of software =
raid multiple devices. However, the descriptions of the process were =
either somewhat vague or clearly related to the old software raid =
subsystem without persistent superblocks. I have already sent mails to the =
authors of the various howtos I found, but to no avail. Maybe some kind =
soul on this mailing list can answer my questions.

Is it possible to use multiple devices as physical volumes? The problem =
here seems to be related to the "partition ID" of the multiple devices. If =
it is possible, how do I do it? If it is not, are there any plans to fix =
it?

Regards

Michael Burschik
