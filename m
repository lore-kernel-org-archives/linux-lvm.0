From: Daniel Savard <dsavard@videotron.ca>
MIME-Version: 1.0
Message-Id: <01111614360805.02805@dirac.cids.ca>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: root fs on a LVM cause kernel panic
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
Date: Fri Nov 16 13:42:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I just finished testing this without success.

Is there a way to get more details on what is going wrong with this?
-- 

================================
Daniel Savard
Internet: dsavard@videotron.ca
================================


> Hello,

> Be sure that you compiled the SCSI drivers into the kernel. Because when =
> you
> use lvmcreate_initrd script it doesn't load in any modules for it.
>
> Joost van der Locht
> Technisch Directeur
