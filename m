References: <CABWX_dqg3za8oGq9-ohoCvDiJbmLs36Jgqy2a6NSa82Gxrr8tg@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <ebead878-135f-a69c-455a-0c08e4947996@redhat.com>
Date: Tue, 29 Aug 2017 11:25:19 +0200
MIME-Version: 1.0
In-Reply-To: <CABWX_dqg3za8oGq9-ohoCvDiJbmLs36Jgqy2a6NSa82Gxrr8tg@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Distributed Locking of LVM
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Kalyana sundaram <kalyanceg@gmail.com>

Dne 28.8.2017 v 14:41 Kalyana sundaram napsal(a):
> We have a shared iscsi disk at all our boxes, with one vg. We are using clvm 
> to manage locks to create extend activate delete list.
> CLVM is tedious to manage especially especially due to reboot if locking is 
> struck somewhere. Instead we are thinking of modifying file_locking.c to get 
> lock with distributed store like zookeeper or redis and on success run the 
> above command, on failure backoff and try again
> The external ocking code will sit at _file_lock_resource, case LCK_VG.
> Do you think its risky. Is there some other way people handle it?
> 

Hi

Have you considered  usage of 'lvmlockd' and it's sanlock interface
(where locks are maintained on shared storage device).

Regards

Zdenek
