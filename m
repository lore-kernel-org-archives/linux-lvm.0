Return-Path: <bruck@suse.de>
Date: Fri, 20 Apr 2001 19:00:10 +0200 (CEST)
From: Jens Bruckmann <bruck@suse.de>
Message-ID: <Pine.LNX.4.31.0104201858090.1159-100000@dgently.hh.suse.de>
MIME-Version: 1.0
Subject: [linux-lvm] Does LVM support alternate links?
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
To: linux-lvm@sistina.com

Hallo everybody,

I would like to know if the LVM supports alternate-links to the same
physical device over two fiber-channel links, so if one link fails, LVM
automatically uses the second link as it does under its "original" HP-UX.

Has anyone ever connected an EMC-Symmetrix with redundant fiber-channel
links with LVM and Linux?

Then I was very pleased if he/she could tell me about the experiences.

Thanks a lot,

        Jens

-----------------------------------------------------------------------
Jens Bruckmann              .-.       Mail:    jens.bruckmann@suse.de
SuSE Linux Solutions AG     /v\       Phone:   +49 - 40 - 89 69 82 18
Friesenweg 5F              // \\      Fax:     +49 - 40 - 85 40 04 35
D-22763 Hamburg           /(   )\
                           ^^-^^
-----------------------------------------------------------------------
