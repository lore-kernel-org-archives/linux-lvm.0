Message-ID: <3BC520B7.91DDF9C8@bellatlantic.net>
Date: Thu, 11 Oct 2001 00:31:51 -0400
From: Uday Bhaskar Sarma Seetamraju <sarma@bellatlantic.net>
MIME-Version: 1.0
References: <E15rMMs-0000mK-00@hermes.sistina.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvcreate -fffff ?
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

Hi,

Since my last post, I have downloaded 1.0.1-rc4
and compiled the tools.
I can now vgcreate using /dev/md1.   Thanks.
lvm commands work well, with gcc version # 2.96 on 2.4.3-20 mandrake kernel.

But during my previous tests I had done 'e2fsck /dev/md0'.
Maybe because of that, I have the following problem.

# pvcreate -vff /dev/md0
pvcreate -- locking logical volume manager
pvcreate -- checking physical volume name "/dev/md0"
pvcreate -- getting physical volume size
pvcreate -- device "/dev/md0" has a partition table

# echo $?
7

Then I did the following :-
    dd if=/dev/zero of=/dev/md0

Didn't make any difference.
Can you please help?

Thanks
Sarma

P.S:
# cat /proc/mdstat
Personalities : [raid1]
read_ahead 1024 sectors
md1 : active raid1 hdc9[1] hda9[0]
      2097024 blocks [2/2] [UU]

md0 : active raid1 hdc6[1] hda6[0]
      2097024 blocks [2/2] [UU]

unused devices: <none>
