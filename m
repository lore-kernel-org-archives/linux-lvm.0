Return-Path: <jorg.de.jong@ida.xs4all.nl>
Message-ID: <3AD8AC12.8BC26F0E@ida.xs4all.nl>
Date: Sat, 14 Apr 2001 21:59:14 +0200
From: Jorg de Jong <jorg.de.jong@ida.xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Strange message in /var/log/messages
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
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

Hi,

I am seeing the following message in /var/log/messages:

Apr 14 21:46:38 ida kernel: lvm - lvm_map: ll_rw_blk for inactive LV /dev/dd/678
Apr 14 21:49:37 ida last message repeated 32 times
Apr 14 21:49:37 ida last message repeated 31 times

should I be worried or can I ignore them ?

I am running kernel 2.4.3 with lvm_0.9.1_beta7 kernel patches applied. 

-- 
Jorg de Jong
Work : jorg.de.jong@ict.nl 
Play : jorg.de.jong@ida.xs4all.nl
