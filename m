Return-Path: <penguin_master_2000@yahoo.com>
Message-ID: <20010119124633.13769.qmail@web1703.mail.yahoo.com>
Date: Fri, 19 Jan 2001 04:46:33 -0800 (PST)
From: "Mr. Penguin" <penguin_master_2000@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] 2.4.0
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

Hi

I'm currently running LVM 0.8i on 2.2.17 with devfs
and reiserfs. I'm trying to upgrade to 2.4.0.

I'm a little confused as to what patches I need to
apply to the base 2.4.0 tree for LVM 0.9.1-beta2. The
README specifies lvm-0.9.1_beta1-2.4.0.patch but I
can't find this file. The only file I can see that
looks relevant is lvm-0.8final-2.4.0.patch but I dont
want 0.8!

I tried applying this file anyway but sure enough I
got an invalid IOP error on vgscan.

I also tried applying no patches to the base 2.4.0
kernel and vgscan found no volume groups.

Do I have to re-init my VG's to upgrade?

Please help!

James

__________________________________________________
Do You Yahoo!?
Get email at your own domain with Yahoo! Mail. 
http://personal.mail.yahoo.com/
