Return-Path: <mvolaski@aecom.yu.edu>
Mime-Version: 1.0
Message-Id: <a05001923b66697749fe8@[129.98.91.150]>
Date: Wed, 20 Dec 2000 12:31:06 -0500
From: Maurice Volaski <mvolaski@aecom.yu.edu>
Subject: [linux-lvm] Can I use LVM with ReiserFS?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I'm getting ready to install a server that will use hardware RAID 5 
and I want to make a hardware RAID volume, put ReiserFS on it and 
initially make it appear as /home to my users. Then at some point 
later, I want to take another hardware RAID volume, put ReiserFS on 
it and add it to the existing /home so that users all of a sudden see 
a huge increase in the size of /home. Can this be done or will my use 
of ReiserFS make it a problem?
-- 

Maurice Volaski, mvolaski@aecom.yu.edu
Computing Support, Rose F. Kennedy Center
Albert Einstein College of Medicine of Yeshiva University
