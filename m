Message-Id: <20020406183800.5697.qmail@eyou.com>
From: seaward@eyou.com
Subject: [linux-lvm] hello sir
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
Date: Sat Apr  6 04:37:02 2002
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Linux-LVM@sistina.com

dear sir:
    I am a lvm user in China. I found 2 bugs when I using it.
    One: the patches of lvm-1.0.3 for kernel-2.4.18 has a wrong definition
in
lvm-internal.h:
#define lvm_sectsize(dev) get_hardblocksize(dev)
should change to
#define lvm_sectsize(dev) get_hardsect_size(dev)

    Two:after creating /dev/hda3 and changing it to type 0x8e by fdisk,why
does pvcreate say it is a invalid partition? But pvcreate can process it after
reboot the system.However, it is ok for a existing partition(needn't create
but need change type).Is reboot a necessary step? I think there must be
something wrong with it. Can you tell me why? 
    Thanks very much!






--http://www.eyou.com
--�ȶ��ɿ�����ѵ�������  �����ʼ�  �ƶ���ǩ  ��������  ����洢...����δ��
