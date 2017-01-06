MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Fri, 06 Jan 2017 20:19:43 +0100
From: Xen <list@xenhideout.nl>
In-Reply-To: <20170106190432.GA22165@redhat.com>
References: <ea995d2fb8e2be94ab44e870c88a5be8@xenhideout.nl>
	<20170106190432.GA22165@redhat.com>
Message-ID: <6d536d4cfffe249eb561e6b0685ef99a@xenhideout.nl>
Subject: Re: [linux-lvm] duplicate pv change uuid
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
To: David Teigland <teigland@redhat.com>
Cc: list@xenhideout.nl, Linux lvm <linux-lvm@redhat.com>

David Teigland schreef op 06-01-2017 20:04:

>> How does one do this, again?
> 
> vgimportclone is meant to do this.  It strategically uses filters to
> isolate and modify the intended devs.

Thanks.

I thought running it in the current situation would be enough.

For some reason I am not getting my own emails though. Basically I am 
not getting list emails, only direct replies atm.

So I will CC myself I guess.


   Found duplicate PV 3U9ac3Ah5lcZUf03Iwm0cgMMaKxdflg0: using /dev/sdb4 
not /dev/sdc4
   Using duplicate PV /dev/sdb4 without holders, replacing /dev/sdc4
   Volume group containing /dev/sdb4 has active logical volumes
   Physical volume /dev/sdb4 not changed
   0 physical volumes changed / 1 physical volume not changed

This was after running vgimportclone /dev/sdc4

It immediately replaces the one I target with the one I am using, (don't 
need to change, don't need) and then says it's active, duh.

I guess I'll just need to reboot a live DVD or actually OpenSUSE DVDs 
are faster.
