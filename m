Received: from [10.34.131.9] (dhcp131-9.brq.redhat.com [10.34.131.9])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4N8XCYY029015
	for <linux-lvm@redhat.com>; Mon, 23 May 2016 04:33:12 -0400
References: <1953f85f68fef3b30d5efeef85aec94d@dds.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <b4b9104b-2755-71d1-333e-c097721274dc@redhat.com>
Date: Mon, 23 May 2016 10:33:11 +0200
MIME-Version: 1.0
In-Reply-To: <1953f85f68fef3b30d5efeef85aec94d@dds.nl>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] separate vg create, or merge?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 21.5.2016 17:38, Xen wrote:
> If I can ask.
>
> Can you separately create two PVs, put a VG to them, and fill them with LVs,
> when these VGs would have the same name, and then at some later point, in that
> sense, you would combine them?
>
> I guess in practice if that happens you would have the ability to just use
> vgextend.
>
> But what if you allowed two pre-existing PVs/VGs when the VGs had the same
> name, in the same system? I believe it wouldn't work very well?
>
> Currently I just gave them different names and plan on merging them.


Hi

Not sure what's your concern this time - however are not allowed to 'create' 
same VG for 2nd. time in running system (vgname is name of lock)

If you happen to do a  'dd'  copy -  lvm2 will loudly announce duplicate 
device and will either stop processing and tell user which device it has 
selected to use.

If you insist on having same 'VG' in one system - you have to use 'filter'
to select which devices individual commands may use  (typically you have
a 'Host' system with number of  'Guesses' and you want to 'sneak view' what's 
in the guest disk - so you run 'lvm2' command with filter to only see a single 
disk.


vgsplit & vgmerge have their validation.

vgrename  allows you to rename VG if they have same name but different UUID.

and finaly -

use 'vgimportclone'  utility when you do a PV device duplication...


Regards

Zdenek
