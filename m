Received: from [192.168.1.101] (vpn-248-146.boston.redhat.com [10.13.248.146])
	by pobox.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m1FL6WmV023603
	for <linux-lvm@redhat.com>; Fri, 15 Feb 2008 16:06:33 -0500
Message-Id: <1D5E8B4E-A142-4276-8D12-5EB64E2AC2E3@redhat.com>
From: Jonathan Brassow <jbrassow@redhat.com>
In-Reply-To: <F66CC8D7-624C-4090-B0D8-1A0406B384A4@ulx.hu>
Mime-Version: 1.0 (Apple Message framework v919.2)
Subject: Re: [linux-lvm] mirrored LV + cmirror problem
Date: Fri, 15 Feb 2008 15:06:31 -0600
References: <76EAFFE5-C713-42D4-B6DC-9F63F56C071C@ulx.hu>
	<2D7245F3-4FBF-4569-BBA9-22E37E22C58A@redhat.com>
	<F66CC8D7-624C-4090-B0D8-1A0406B384A4@ulx.hu>
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

If the problem is reproducible, we should be able to track it down.

When a failure happens, the kernel sends an event to userspace that =20
signals 'dmeventd' to take action.  If we take dmeventd out of the =20
picture, we can run the commands ourselves with higher verbose settings.

When you activate the volume, you can 'lvchange -ay --monitor n <vg>/=20
<lv>' - this will prevent dmeventd from monitoring the mirror.  Then =20
kill the log device.  Finally, run 'vgreduce --removemissing <VG> -=20
vvvv' to perform the recovery.  (redirecting all the output to a file =20
will give us something to look at if the failure is reproduced.)

We may need to grab debugging output from clvmd too, but that can get =20
messy, so we'll start with this.

  brassow

P.S.  It looks like you must have *.debug; in your /etc/syslog.conf, =20
yes?

On Feb 15, 2008, at 10:17 AM, Lajk=EF=BF=BD Attila wrote:

>
>
> On Feb 15, 2008, at 4:41 PM, Jonathan Brassow wrote:
>
>> Are all the packages rhel4.6 as well, or have you compiled pkgs =20
>> yourself?
>
> All the packages are binaries from rhel4.6:
> lvm2-cluster-2.02.27-2.el4_6.1
> cmirror-1.0.1-1
> cmirror-kernel-xenU-2.6.9-38.5
>
>>
>>
>> What was the load you had on the system?
>
> Very low, approx. 0.
>
>> The messages I see from dm-cmirror suggest that it is properly =20
>> shutting down in the face of the failure... However, before it has =20
>> finished, we can see "Failed to remove faulty devices in vgtest-=20
>> lvtest".  This suggests to me that clvmd is not waiting long enough =20
>> for the shutdown to complete, but I only see 3 seconds of the log.  =20
>> When was the device failure initiated?
>>
>> brassow
>>
>>
>
> The failure was initiated at the beginning of the log. I put the =20
> complete messages files from both nodes (el42 and el4) to FTP.
>
> ftp://ftp.ulx.hu/upload/clvmd/messages.el4
> ftp://ftp.ulx.hu/upload/clvmd/messages.el42
>
> Attila
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
