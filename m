From: Andre Margis <andre@sam.com.br>
Date: Wed, 26 Sep 2001 15:47:48 -0300
References: <Pine.LNX.4.33.0109261252450.23800-100000@ct41987-a.jfrvil1.in.home.com> <3BB220C3.2C96C183@divsol.com>
In-Reply-To: <3BB220C3.2C96C183@divsol.com>
MIME-Version: 1.0
Message-Id: <01092615474801.01062@dpd16>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] vgscan 1.0.1-rc2 + kernel 2.4.10
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

I'm using lvm 1.0.1-rc2 under kernel 2.4.9 and work fine.

When using with kernel 2.4.10 vgscan hang, running vgscan -d, the log is 
listed above:

<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 10
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING


I have two servers Dell 8450 and they have the same problem.


and no more messages



Thank's in advance



Andre
