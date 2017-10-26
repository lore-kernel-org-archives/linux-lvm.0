From: "Zhangyanfei (YF)" <yanfei.zhang@huawei.com>
Date: Thu, 26 Oct 2017 08:07:01 +0000
Message-ID: <97CEEE909D5FE84999281EA4585EB0ED0165DE36@DGGEMA505-MBS.china.huawei.com>
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_97CEEE909D5FE84999281EA4585EB0ED0165DE36DGGEMA505MBSchi_"
MIME-Version: 1.0
Subject: [linux-lvm] dmsetup hangs forever
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: "agk@redhat.com" <agk@redhat.com>, "christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>, guijianfeng <guijianfeng@huawei.com>, "Zhangyanfei (YF)" <yanfei.zhang@huawei.com>, Fengtiantian <fengtiantian@huawei.com>, "linux-lvm@redhat.com" <linux-lvm@redhat.com>

--_000_97CEEE909D5FE84999281EA4585EB0ED0165DE36DGGEMA505MBSchi_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello

I find an issue when use  dmsetup in the situation udev event timeout.

Dmsetup use the dm_udev_wait function sync with udev event.When use the dms=
etup generate a new dm-disk, if the raw disk is abnormal(for example ,a ips=
an disk hung IO request), the udevd daemon handle the dm-disk udev event ma=
ybe timeout, and will not notify the dmsetup  by semaphore. And because the=
  dm_udev_wait use the semop to sync with udevd, if udevd event timeout, th=
e dmsetup will hung forever even when the raw disk be recovery.

I wonder if we could use the semtimedop instead semop to add the timeout in=
 function  dm_udev_wait. If the udevd daemon timeout when handle the dm eve=
nt, the dm_udev_wait could timeout too, and the dmsetup could return error.

This is my patch base lvm2-2.02.115-3:
--_000_97CEEE909D5FE84999281EA4585EB0ED0165DE36DGGEMA505MBSchi_--
