References: <97CEEE909D5FE84999281EA4585EB0ED0165DE36@DGGEMA505-MBS.china.huawei.com>
	<62d9bc5f-01c7-6109-eff5-8d5cc0ddfed0@redhat.com>
	<97CEEE909D5FE84999281EA4585EB0ED0165EFCA@DGGEMA505-MBS.china.huawei.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <47282d76-c136-d950-fe3e-5f0e56cf69a8@redhat.com>
Date: Fri, 27 Oct 2017 14:28:08 +0200
MIME-Version: 1.0
In-Reply-To: <97CEEE909D5FE84999281EA4585EB0ED0165EFCA@DGGEMA505-MBS.china.huawei.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] =?utf-8?b?562U5aSNOiBbZG0tZGV2ZWxdIGRtc2V0dXAgaGFu?=
	=?utf-8?q?gs_forever?=
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: "Zhangyanfei (YF)" <yanfei.zhang@huawei.com>, "agk@redhat.com" <agk@redhat.com>, "christophe.varoqui@opensvc.com" <christophe.varoqui@opensvc.com>
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>, Fengtiantian <fengtiantian@huawei.com>, "linux-lvm@redhat.com" <linux-lvm@redhat.com>, guijianfeng <guijianfeng@huawei.com>

Dne 27.10.2017 v 10:00 Zhangyanfei (YF) napsal(a):
> Hello
> 
> If the udevd daemon would not timeout, I think dmsetup mandatory wait udev finalizing any timeouts is good idea.
> But udevd would timeout in 180 sencond and kill the event process( systemd-udevd[39029]: timeout: killing). In this situation, I think 

The point here is - udev should not be 'randomly' killing workers - and if it 
needs so - it should provide a 'recovery' path mechanism, where such path
after killing worker is supported.

If this mechanism is missing - you end-up with a device which is NOT present 
in udev DB - yet - there is some 'esoteric' dm device which is there
and you don't know if it's usable or not.

mandatory wait udev finalizing is useless, because udev has been killed and 
can't coordination dmsetup forever. So I think it's better to tell the one who 
call the dmsetup, the process error return, than let the process wait forever.
> 
> If not add the dmsetup timeout mechanism, which strategy to solve this issue better?

You can always use i.e. cron job and every 15 minutes run:

'dmsetup udevcomplete_all 15'

To complete any blocked dmsetup/lvm command on a cookie...

The keypoint here is - you have system with broken device list - so any next 
i.e. lvm2 command may 'freeze'  while it would try to read a device that can 
freeze the reading task - this is certainly bad case.

> 1、guarantee the udev never timeout.(but I think it is difficult to make sure any udev event will finish in 180 sencond in any abnormal situation)
> 2、modify the udev daemon, if udev event timeout，also notify the dmsetup it's done.
> 3、the one who call the command dmsetup needed timeout itself.

In principle timeouts are BAD when we talk about storage.
There needs to be some clear 'state-machine' mechanism.

It doesn't make much sense to kill worker which actually might not even be 
possible if the worker freezes inside kernel.


And then there is even 2nd. category of 'kills' of workers - this happens on 
overloaded machines running gazillion 'virtual guest' instances without any 
resource check mechanism with assumption "OOM" killer is beautiful resource 
manager in kernel - however such systems are destined for a near-time reboot - 
  anyone who tries to 'recover' from  an OOM doesn't realize how complex that 
would be - so this case is not worth dmsetup timeout either.


Regards

Zdenek
