Message-ID: <40196F7D.4070601@skyraven.pcnet.ro>
From: Mihai Tanasescu <Mihai.Tanasescu@skyraven.pcnet.ro>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM integration problem
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
Date: Thu Jan 29 15:41:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hello,

I've recently installed a gentoo system...building from scratch with lvm 
support (as it comes with the gentoo live cd 2.4 kernel..so the lvm 
created is version 1.0).
But I've built my system with a 2.6 kernel and lvm2 in it....
After finishing the install I've rebooted the system only to see some 
error messages like no volume groups detected ...but 2 PV's detected or 
something like that..
As a consequence of this I can't access /usr  /var /tmp ..
I've tried first using the old lvm 1.0 user utils ..with no succes. 
...then removed them..compiled the lvm 2.0 user utils and I got the 
error described above upon booting the new system.

I've tried google but didn't have any luck..

Can anyone point me in the right direction to look ?
