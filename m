Message-ID: <20031015130801.49215.qmail@web41307.mail.yahoo.com>
From: Valentine Kouznetsov <vkuznet@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] once again about 2.6 kernel
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
Date: Wed Oct 15 12:36:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,
I had a look at lvm mailing list about kernel 2.6
questions. So far I understood that in order to run
2.6 kernel with LVM2 on a system which previously run
2.4 kernel with LVM1 you need
1) patch 2.4 kernel with device-mapper patch
2) use new LVM2 tools (LVM2.2.00.07) which need to be
installed separetly on the system to allow
simulteneously use LVM1 and LVM2

Is it correct?

I have only two additional questions. Does it
necessary to patch 2.4 kernel (I found only 2.4.21
patches not 2.4.22)? Is any way to remove existing
LVM1, come back to usual situation without LVM on 2.4
system, install 2.6 and create a new LVM. 

Thanks,
Valentine.


__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com
