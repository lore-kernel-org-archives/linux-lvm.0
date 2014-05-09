Message-ID: <536CE288.90608@redhat.com>
Date: Fri, 09 May 2014 16:13:28 +0200
From: Marian Csontos <mcsontos@redhat.com>
MIME-Version: 1.0
References: <20140508104546.GA610@feynman.spatium.org>	<536CC710.4030708@redhat.com>
	<20140509124040.GA686@feynman.spatium.org>
In-Reply-To: <20140509124040.GA686@feynman.spatium.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] No device found for PV but is actually fine
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
To: LVM general discussion and development <linux-lvm@redhat.com>, lvm@spatium.org
Cc: Peter Rajnoha <prajnoha@redhat.com>

On 05/09/2014 02:40 PM, Michal Svoboda wrote:
> Marian Csontos wrote:
>> Michal(-e), I suggest modifying global_filter to accept only the
>> devices you want in the VG.
>
> Hi,
>
> I've tried playing with filter and global_filter in lvm.conf, but it did
> not help - as if the conf file was ignored. I tried blacklisting and
> whitelisting. Does something need to be restarted/rebooted for these
> settings to take effect?

Oh yes, you would need to restart lvmetad (on Fedora/RHEL/CentOS 
systemctl restart lvm2-lvmetad.service, not sure it is the same on Arch.)

You may want to scrub the RAID as there may be data not written to both 
legs.

IMO it would be the best to take over udev rules and systemd units from 
Fedora as Peter spends lot of time to keep them up to date and working.

I have seen some threads on Arch forum yesterday related to boot 
problems with LVM on mdadm after upgrading from lvm2-2.02.105 to .106 - 
I think people there will appreciate if you add a comment...

-- Martian

>
> I then did some more experiments and eventually solved the issue.
>
> First I tried pvscan --cache /dev/md0, at which point md0 was "accepted"
> as existing PV, and the "system" VG would show up in vgdisplay. I was
> even able to resize one of the LVs. However, after running pvscan --cache
> with no extra agruments, I would receive the duplicate PV errors as in
> previous e-mail and the "system" VG would disappear from vgdisplay. :-o
>
> Finally I solved the issue by changing initcpio hook from "mdadm_udev"
> to "mdadm". This is arch-linux specific thing that changes stuff that is
> exported to the initial ramdisk used for boot. User-wise, that change
> would stop using udev auto-magic for assembling md arrays, but use
> /etc/mdadm.conf directly instead. I don't know the implementation details.
>
> After that I receive *no more errors* about either missing or duplicate
> PV and all VGs/LVs are displayed by the respective display commands. So
> for me issue is solved but if anyone wants to get to the bottom I am
> open to do some more experiments.
>
>
> Michal Svoboda
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
