References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<fa8b9d2e-6f1f-d201-263a-48178815a055@assyoma.it>
	<2f9c4346d4e9646ca058efdf535d435e@xenhideout.nl>
	<f934657c1724caba1c432cace2f0ca69@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5df13342-8c31-4a0b-785e-1d12f0d2d9e8@redhat.com>
Date: Fri, 14 Apr 2017 10:24:10 +0200
MIME-Version: 1.0
In-Reply-To: <f934657c1724caba1c432cace2f0ca69@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>
Cc: Xen <list@xenhideout.nl>

Dne 14.4.2017 v 09:20 Gionatan Danti napsal(a):
> Il 13-04-2017 14:41 Xen ha scritto:
>>
>> See, you only compared multiple non-thin with a single-thin.
>>
>> So my question is:
>>
>> did you consider multiple thin volumes?
>>
> 
> Hi, the multiple-thin-volume solution, while being very flexible, is not well 
> understood by libvirt and virt-manager. So I need to pass on that (for the 
> moment at least).
> 


Well since recent versions of lvm2  (>=169 , even though they are marked as 
exprimental) - do support script execution of a command for easier maintanence
of thin-pool being filled above some percentage.

So it should be 'relatively' easy to setup a solution where you can fill
your pool to i.e. 90% and if gets above - kill your surrounding libvirt,
and resolve missing resources (deleting virt machines..)

But it's currently impossible to expect you will fill the thin-pool to full 
capacity and everything will continue to run smoothly - this is not going to 
happen.

However there are many different solutions for different problems - and with 
current script execution - user may build his own solution - i.e.  call
'dmsetup remove -f' for running thin volumes - so all instances get 'error' 
device   when pool is above some threshold setting (just like old 'snapshot' 
invalidation worked) - this way user will just kill thin volume user task, but 
will still keep thin-pool usable for easy maintenance.

Regards

Zdenek
