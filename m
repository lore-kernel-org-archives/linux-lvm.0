Return-Path: <penguin_master_2000@yahoo.com>
Message-ID: <20010119161251.16298.qmail@web1703.mail.yahoo.com>
Date: Fri, 19 Jan 2001 08:12:51 -0800 (PST)
From: "Mr. Penguin" <penguin_master_2000@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] More probs 2.4.0 / 0.9.1beta2
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

I'm still having problems with this! I've built a
standard RH6.2 system and upgraded it to 2.4.0 with
LVM. As well as not finding any of my existing VGs,
pvcreate also fails when I use /dev/loop/0:

pvcreate -- device "/dev/loop/0" doesn't exist

I can't get anything from the system so I can't attach
a debug log, but the last thing it says is:

<1> pv_get_size -- leaving with ret -236

Please help :)

James

PS lvmdiskscan doesn't see the "loop" device. And yes
the loop device really is there and configured!


__________________________________________________
Do You Yahoo!?
Get email at your own domain with Yahoo! Mail. 
http://personal.mail.yahoo.com/
