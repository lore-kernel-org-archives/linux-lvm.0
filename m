Message-ID: <FED7EB450413D511ABC100B0D021173246E1A7@hal9000.hermes.si>
From: Luka Renko <luka.renko@hermes.si>
MIME-Version: 1.0
Subject: [linux-lvm] VFS lock patch - should it go to Marcelo?
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
Date: Tue Aug 13 02:28:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: evms-devel@lists.sourceforge.net, linux-lvm@sistina.com

> First things first - make sure you've added the VFS lock 
> patch to your 
> kernel. It is available in the "kernel" directory in the EVMS 
> package. You 
> will need this patch in your kernel anytime you are going to 
> use snapshots 
> with journaled filesystems.

I have one question for EVMS and LVM developers: what is the reason that VFS
lock patch does not go to Marcelo in order to be included in next 2.4
release?
This patch is out and being sucessfully used for ages. Is there any good
reasno not to merge it into 2.4.20?

Regards,
Luka
