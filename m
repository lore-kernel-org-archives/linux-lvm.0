Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o04DHauE006563
	for <linux-lvm@redhat.com>; Mon, 4 Jan 2010 08:17:36 -0500
Received: from mail-fx0-f224.google.com (mail-fx0-f224.google.com
	[209.85.220.224])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o04DHPWi024820
	for <linux-lvm@redhat.com>; Mon, 4 Jan 2010 08:17:25 -0500
Received: by fxm24 with SMTP id 24so9400602fxm.11
	for <linux-lvm@redhat.com>; Mon, 04 Jan 2010 05:17:24 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1262609658.18517.3.camel@localhost>
References: <4B3B28E5.5030208@tele2.com> <4B3B2C05.1070902@tele2.com>
	<29ae894c0912300352k29bbd06dha89b7dd0045c550@mail.gmail.com>
	<1262609658.18517.3.camel@localhost>
Date: Mon, 4 Jan 2010 14:17:24 +0100
Message-ID: <29ae894c1001040517sa6bb7f9v56915a22a820d2c4@mail.gmail.com>
From: brem belguebli <brem.belguebli@gmail.com>
Subject: Re: [linux-lvm] LVM preference for multipath verses disk/by-id/scsi
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

Hi,

Never had no problem with it.

The only problem I've hit was due to the binding file being, by
default, located in /var/lib/multipath, which is in my setup on a
separate LV than /, during boot time the devices were not correctly
created.

Just had to switch the binding file to /etc and now no more problem.

extract of my /etc/multipath.conf :


defaults {
...
        flush_on_last_del       yes
        user_friendly_names     yes
        bindings_file "/etc/multipath_bindings"
}

2010/1/4 Bryn M. Reeves <bmr@redhat.com>:
> On Wed, 2009-12-30 at 12:52 +0100, brem belguebli wrote:
>> Hi,
>>
>> see man 5 lvm.conf there is an option called preferred_names which is
>> well explained
>>
>> It'll instruct lvm to use the preferred_names you configured in the
>> lvm.conf file if they exist
>>
>> ie : preferred_names = "/dev/mpath/" will use /dev/mpath/XXX instead
>> of /dev/mapper/XXX
>
> It's best not to use the symlinks in /dev/mpath - they are not always
> reliable. Use the device nodes created in /dev/mapper instead.
>
> Regards,
> Bryn.
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
