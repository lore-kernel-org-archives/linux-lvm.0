Return-Path: <grobe@gmx.net>
Date: Tue, 21 Aug 2001 14:01:05 +0200 (MEST)
From: Lars Grobe <grobe@gmx.net>
MIME-Version: 1.0
Message-ID: <29386.998395265@www26.gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] naming conventions of vgcfg-backups?
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
To: linux-lvm@sistina.com

Hi!

After resizing, I have to restore my previous lvm configuration. I'm just
not sure about the default naming of the backups?

Am I right that <vgname>.conf is the current config (which is in use now -
and which is wrong), while <vgname>.conf.1.old is the previous (which I have
to restore) and <vgname>.[2345].old are the older backups?

CU, Lars.

-- 
GMX - Die Kommunikationsplattform im Internet.
http://www.gmx.net
