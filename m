Return-Path: <grobe@gmx.net>
Date: Tue, 21 Aug 2001 12:40:10 +0200 (MEST)
From: Lars Grobe <grobe@gmx.net>
MIME-Version: 1.0
Message-ID: <4755.998390410@www44.gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] restoring lvm cinfiguration
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

This is somehow a followup to my message describing the (my) resize-error.

I took a look at vgcfgrestore, and it seams to be the right tool for me now
;-) But before I apply this to the ruins of our filesystem.... Am I right if
I suppose the /etc/lvmconf/vgname.conf to be the current configuration (so,
the wrong one after my lv-shrinking)? So that vgname.conf.1 is the previous
one, that I should restore? I need lvm to allocate the same space on the pvs as
it did before, so that I can rebuild my reiserfs with fsck.

Thank You, CU, Lars.

-- 
GMX - Die Kommunikationsplattform im Internet.
http://www.gmx.net
