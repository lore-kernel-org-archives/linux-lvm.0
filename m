Date: Tue, 29 Aug 2017 11:23:40 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20170829162340.GB12503@redhat.com>
References: <CABWX_dqg3za8oGq9-ohoCvDiJbmLs36Jgqy2a6NSa82Gxrr8tg@mail.gmail.com>
	<ebead878-135f-a69c-455a-0c08e4947996@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ebead878-135f-a69c-455a-0c08e4947996@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Kalyana sundaram <kalyanceg@gmail.com>

On Tue, Aug 29, 2017 at 11:25:19AM +0200, Zdenek Kabelac wrote:
> Dne 28.8.2017 v 14:41 Kalyana sundaram napsal(a):
> > We have a shared iscsi disk at all our boxes, with one vg. We are using
> > clvm to manage locks to create extend activate delete list.
> > CLVM is tedious to manage especially especially due to reboot if locking
> > is struck somewhere. Instead we are thinking of modifying file_locking.c
> > to get lock with distributed store like zookeeper or redis and on
> > success run the above command, on failure backoff and try again
> > The external ocking code will sit at _file_lock_resource, case LCK_VG.
> > Do you think its risky. Is there some other way people handle it?
> > 
> 
> Hi
> 
> Have you considered  usage of 'lvmlockd' and it's sanlock interface
> (where locks are maintained on shared storage device).

And lvmlockd can use different lock managers.  Currently it supports
sanlock (where the locks are kept in the VG's storage and networking is
not used), or the dlm (which uses the network and requires corosync).  You
also could try adding another lock manager option to lvmlockd.

See here for more info:
http://man7.org/linux/man-pages/man8/lvmlockd.8.html

I think people will find lvmlockd works much better than clvm.
https://www.redhat.com/archives/linux-lvm/2016-November/msg00022.html
