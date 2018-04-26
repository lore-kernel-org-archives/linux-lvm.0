Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C992173B3
	for <linux-lvm@redhat.com>; Thu, 26 Apr 2018 06:16:44 +0000 (UTC)
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 50EB681DE6
	for <linux-lvm@redhat.com>; Thu, 26 Apr 2018 06:16:33 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id b130-v6so4254862oif.12
	for <linux-lvm@redhat.com>; Wed, 25 Apr 2018 23:16:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180425150056.GA29775@redhat.com>
References: <CABZYMH6KQhrnONfFxO0ky0O=nFHzJqP1ibLaOy-vxQ_yNkqfNg@mail.gmail.com>
	<20180425150056.GA29775@redhat.com>
From: Damon Wang <damon.devops@gmail.com>
Date: Thu, 26 Apr 2018 14:16:31 +0800
Message-ID: <CABZYMH4mi0dyNvArRcYnPF1jNU5-Tyas-4zwMLAcH_p_WHCsYg@mail.gmail.com>
Subject: Re: [linux-lvm] [lvmlockd] Reload configuration while lvmlockd and
 sanlock running
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

tried and worked, really thanks :-D

besides if only change host id, it seems can take effect immediately
on a new vg or stop and change a exists vg as you said:

[root@dev1-2 ~]# vgs
  WARNING: Not using lvmetad because config setting use_lvmetad=0.
  WARNING: To avoid corruption, rescan devices to make changes visible
(pvscan --cache).
  Reading VG pool2 without a lock.
  Reading VG pool4 without a lock.
  VG                               #PV #LV #SN Attr   VSize    VFree
  ff35ecc8217543e0a5be9cbe935ffc84   1  55   0 wz--ns <198.00g 147.48g
  pool2                              1   0   0 wz--ns  <10.00g  <9.75g
  pool4                              1   6   0 wz--ns  <39.75g <12.17g

# lock of pool4 not start yet

[root@dev1-2 ~]# sanlock client status
daemon aa68f03c-ab45-484a-ae45-61ac147e939b.dev1-2
p -1 helper
p -1 listener
p 43884 lvmlockd
p -1 status
s lvm_ff35ecc8217543e0a5be9cbe935ffc84:49:/dev/mapper/ff35ecc8217543e0a5be9cbe935ffc84-lvmlock:0

# the host id used for ff35ecc8217543e0a5be9cbe935ffc84 is 49

[root@dev1-2 ~]# lvmconfig --type diff
local {
host_id=49
}
global {
use_lvmetad=0
use_lvmlockd=1
}
devices {
issue_discards=1
}

# it is same as our lvm config is 49

[root@dev1-2 ~]# sed -i 's/.*host_id.*/host_id=94/g' /etc/lvm/lvmlocal.conf
[root@dev1-2 ~]# lvmconfig --type diff
local {
host_id=94
}
global {
use_lvmetad=0
use_lvmlockd=1
}
devices {
issue_discards=1
}

# now we change host id to 94

[root@dev1-2 ~]# vgchange --lock-start pool4
  WARNING: Not using lvmetad because config setting use_lvmetad=0.
  WARNING: To avoid corruption, rescan devices to make changes visible
(pvscan --cache).
  VG pool4 starting sanlock lockspace
  Starting locking.  Waiting for sanlock may take 20 sec to 3 min...

# start lock for pool4

[root@dev1-2 ~]# vgs
  WARNING: Not using lvmetad because config setting use_lvmetad=0.
  WARNING: To avoid corruption, rescan devices to make changes visible
(pvscan --cache).
  Reading VG pool2 without a lock.
  VG                               #PV #LV #SN Attr   VSize    VFree
  ff35ecc8217543e0a5be9cbe935ffc84   1  55   0 wz--ns <198.00g 147.48g
  pool2                              1   0   0 wz--ns  <10.00g  <9.75g
  pool4                              1   6   0 wz--ns  <39.75g <12.17g

[root@dev1-2 ~]# sanlock client status
daemon aa68f03c-ab45-484a-ae45-61ac147e939b.dev1-2
p -1 helper
p -1 listener
p 43884 lvmlockd
p 43884 lvmlockd
p -1 status
s lvm_pool4:94:/dev/mapper/pool4-lvmlock:0
s lvm_ff35ecc8217543e0a5be9cbe935ffc84:49:/dev/mapper/ff35ecc8217543e0a5be9cbe935ffc84-lvmlock:0
You have new mail in /var/spool/mail/root

# as above, host id for pool4 is 94 while host id for
ff35ecc8217543e0a5be9cbe935ffc84 is still 49

if we stop lock of ff35ecc8217543e0a5be9cbe935ffc84 and then start,
its host id also will change to 94

2018-04-25 23:00 GMT+08:00 David Teigland <teigland@redhat.com>:
>> afaik we can't restart lvmlockd or sanlock without side effects -- all
>> locks must be released before sanlock shutdown, and if wdmd enabled,
>> the host maybe reboot after a while...
>>
>> So if there any way to reload configuration of sanlock and lvmlockd? I
>> don't want to reboot my host...
>
> Deactivate LVs in shared VGs, stop the shared VGs (vgchange --lockstop),
> stop lvmlockd, stop sanlock, stop wdmd, make config changes, then start
> everything again.  Dave
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
