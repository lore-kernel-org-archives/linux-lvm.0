Return-Path: <jorg.de.jong@ida.xs4all.nl>
Message-ID: <3AD358DD.E3ABEC3D@ida.xs4all.nl>
Date: Tue, 10 Apr 2001 21:02:53 +0200
From: Jorg de Jong <jorg.de.jong@ida.xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vcreate and manpage are not consistent.
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

-- Hi,

the manpage of the lvcreate command states 'StripeSize must be 2^n (n = 0 to 7)'
or in other words: 1 2 4 8 16 32 64 128. 
But when I try to create a striped lv with stripe size of 1 or 2 I get error messages.

regards

ps I am using a patched 2.4.3 kernel and 0.9.1.beta7 user tools.
-- 
Jorg de Jong
Work : jorg.de.jong@ict.nl 
Play : jorg.de.jong@ida.xs4all.nl
