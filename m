Return-Path: <penguin_master_2000@yahoo.com>
Message-ID: <20010212114109.14372.qmail@web10909.mail.yahoo.com>
Date: Mon, 12 Feb 2001 03:41:09 -0800 (PST)
From: "Mr. Penguin" <penguin_master_2000@yahoo.com>
In-Reply-To: <200102071815.f17IFtN14302@webber.adilger.net>
MIME-Version: 1.0
Subject: [linux-lvm] lv nodes in /dev ??
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi people

Just noticed that all my LVs have nodes not only in
/dev/vg00/ but also /dev !

So I have /dev/vg00/lvol1 and also /dev/lvol1 with the
same major and minor numbers. I don't like to think
what will happen if I create a new VG called vg01 also
with an lvol1...

This seems to be occuring in beta3 and beta4. I'm
using 2.4.1 / reiserfs (root on LVM)

James

__________________________________________________
Do You Yahoo!?
Get personalized email addresses from Yahoo! Mail - only $35 
a year!  http://personal.mail.yahoo.com/
