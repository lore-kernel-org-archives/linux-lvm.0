Message-ID: <3BF8BC32.C09C64A7@datis.cdrail.cz>
From: Petr Sretr <sretr@datis.cdrail.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] problem with raw device
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
Date: Mon Nov 19 01:59:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I use lvm 0.9 on my server about one year without any problem.
On lvm I have reiserfs filesystem and raw device for informix database.
Now I need upgrade kernel from version 2.2.17 ( lvm 0.9 ) to 2.2.20 (
lvm 0.9.7 ),
but when I read data from raw device on lvm, than I getting wrong data.
When
I read data from the same blockdevice than I getting properly data.
I found that last version which return properly data from raw device is
0.9.4.
What is changing in lvm 0.9.5, that raw device dosen't return the same
data
like block device?

Thanks,

 Petr
