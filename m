Message-ID: <3DAF2D33.3030800@homemedianetworks.com>
From: Berrie Bloem <berrie@homemedianetworks.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM 1.0.5 MDK 2.4.19 ReiserFS or Ext3 Lockup
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
Date: Thu Oct 17 16:43:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hello,

I've installed Mandrake 9.0 on an older machine (P200) with several 
smaller IDE HD's to make a volume group. var and home are mounted on the 
vg and whether I use ReiserFS or Ext3, under heavy IO (copying the 
Mandrake ISO's onto home) after a little while the whole system locks up.

I've patched the original 2.4.19 kernel with LVM 1.0.5, done a full 
rebuild of kernel, modules and LVM programs, but still the lockup remains.

Where have I gone wrong?

BB
