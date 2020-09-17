Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E570117DB18
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2020 16:26:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55EAC80121C
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2020 16:26:56 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id x69so2855205lff.3
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2020 09:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAJHv+s7m=Ad=mK-QpuSDKVsa8fOyGV4Ex9LnaiDkhsStud35mQ@mail.gmail.com>
	<CAAMCDefd+ugu-Myx0wAfmfRs+1TnTjX-yQSMjLkjtLPNx2tnyw@mail.gmail.com>
	<CAJHv+s6TmtZFxRTZW1Yo-2gFee4x5XPa1dpFnP_+EMxtr80DAw@mail.gmail.com>
	<CAAMCDefcYsODUt=fv5u1t=gGKXPtcPMYh8xzH1ztb7R9N0QSHQ@mail.gmail.com>
	<CAJHv+s7vjQmboxJWH73M8ZiemU+FnwcV7+rwtMhNnVStyvqc3g@mail.gmail.com>
	<CAJHv+s6nVrDT7evT+c4GgCDCy5VbfqnvjKBxq4AYKpvymU0peA@mail.gmail.com>
In-Reply-To: <CAJHv+s6nVrDT7evT+c4GgCDCy5VbfqnvjKBxq4AYKpvymU0peA@mail.gmail.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Thu, 17 Sep 2020 11:26:32 -0500
Message-ID: <CAAMCDef_EpbXZOw+j6G1zUqUAhKF5_+9p=19hp4BCbuNzrM0gQ@mail.gmail.com>
Subject: Re: [linux-lvm] Issue after upgrading the LVM2 package from
 2.02.176 to 2.02.180
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

There is only a reject, there are no included devices.  Once you add a
filter it overrides the default filter including all I believe.

The fixes may have been fixing filtering as once you specify a filter
then there is no implied include (anymore). You should probably look
at the list of fixes that happened between those 2 versions.


On Thu, Sep 17, 2020 at 2:25 AM KrishnaMurali Chennuboina
<krishchennu414@gmail.com> wrote:
>
> Hi Roger,
>
> Missed to add my comment in the earlier mail.
> From the filter it should not exclude /dev/sda*. But not sure why it is being excluded while executing pvcreate command.
>
> Thanks.
>
> On Tue, 15 Sep 2020 at 18:28, KrishnaMurali Chennuboina <krishchennu414@gmail.com> wrote:
>>
>> Hi Roger,
>>
>> Thanks for the information shared.
>> Filter which we used in our conf file was,
>>         # Accept every block device:
>>           filter = [ "r|^/dev/drbd.*|" ]
>>
>>
>> Thanks.
>>
>> On Tue, 15 Sep 2020 at 16:36, Roger Heflin <rogerheflin@gmail.com> wrote:
>>>
>>> #1:
>>> Device /dev/sda3 excluded by a filter.)
>>> Failed to execute command: pvcreate -ffy /dev/sda3
>>> ec=0
>>>
>>> excluded by filter is likely the issue, I think there was a bug were
>>> it allowed that pvcreate to work when it should have blocked it
>>> because of the filter.  It should not allow a pvcreate against
>>> something blocked by a filter.
>>>
>>> #2: Read-only locking type set. Write locks are prohibited.
>>> I am going to guess either / is not mounted rw, or you don't have the
>>> directory mounted rw that is needed to create the locks (/var/run/lvm
>>> usually).
>>>
>>> On Tue, Sep 15, 2020 at 1:42 AM KrishnaMurali Chennuboina
>>> <krishchennu414@gmail.com> wrote:
>>> >
>>> > Hi Roger,
>>> >
>>> > I have tried this with the older LVM package(.176) and this issue was not seen. Issue was seen with .180 version every time.
>>> > # executing command: vgchange -ay
>>> > (status, output): (0,   WARNING: Failed to connect to lvmetad. Falling back to device scanning.)
>>> >   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
>>> > # executing command: pvcreate -ffy /dev/sda3
>>> > (status, output): (5,   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
>>> >   Error reading device /dev/sda3 at 0 length 4096.
>>> >   Error reading device /dev/ram0 at 0 length 4096.
>>> >   Error reading device /dev/loop0 at 0 length 4096.
>>> >   Error reading device /dev/sda at 0 length 512.
>>> >   Error reading device /dev/sda at 0 length 4096.
>>> >   Error reading device /dev/ram1 at 0 length 4096.
>>> >   Error reading device /dev/sda1 at 0 length 4096.
>>> >   Error reading device /dev/ram2 at 0 length 4096.
>>> >   Error reading device /dev/sda2 at 0 length 4096.
>>> >   Error reading device /dev/ram3 at 0 length 4096.
>>> >   Error reading device /dev/ram4 at 0 length 4096.
>>> >   Error reading device /dev/ram5 at 0 length 4096.
>>> >   Error reading device /dev/ram6 at 0 length 4096.
>>> >   Error reading device /dev/ram7 at 0 length 4096.
>>> >   Error reading device /dev/ram8 at 0 length 4096.
>>> >   Error reading device /dev/ram9 at 0 length 4096.
>>> >   Error reading device /dev/ram10 at 0 length 4096.
>>> >   Error reading device /dev/ram11 at 0 length 4096.
>>> >   Error reading device /dev/ram12 at 0 length 4096.
>>> >   Error reading device /dev/ram13 at 0 length 4096.
>>> >   Error reading device /dev/ram14 at 0 length 4096.
>>> >   Error reading device /dev/ram15 at 0 length 4096.
>>> >   Device /dev/sda3 excluded by a filter.)
>>> > Failed to execute command: pvcreate -ffy /dev/sda3
>>> > ec=0
>>> >
>>> > I have tried with different options of pvcreate but didnt helped much. After the system got halted with the above error, i tried to executing pvs command but got the below error.
>>> > bash-4.4# pvs
>>> >   Error reading device /dev/ram0 at 0 length 4096.
>>> >   Error reading device /dev/loop0 at 0 length 4096.
>>> >   Error reading device /dev/sda at 0 length 512.
>>> >   Error reading device /dev/sda at 0 length 4096.
>>> >   Error reading device /dev/ram1 at 0 length 4096.
>>> >   Error reading device /dev/sda1 at 0 length 4096.
>>> >   Error reading device /dev/ram2 at 0 length 4096.
>>> >   Error reading device /dev/sda2 at 0 length 4096.
>>> >   Error reading device /dev/ram3 at 0 length 4096.
>>> >   Error reading device /dev/sda3 at 0 length 4096.
>>> >   Error reading device /dev/ram4 at 0 length 4096.
>>> >   Error reading device /dev/sda4 at 0 length 4096.
>>> >   Error reading device /dev/ram5 at 0 length 4096.
>>> >   Error reading device /dev/ram6 at 0 length 4096.
>>> >   Error reading device /dev/ram7 at 0 length 4096.
>>> >   Error reading device /dev/ram8 at 0 length 4096.
>>> >   Error reading device /dev/ram9 at 0 length 4096.
>>> >   Error reading device /dev/ram10 at 0 length 4096.
>>> >   Error reading device /dev/ram11 at 0 length 4096.
>>> >   Error reading device /dev/ram12 at 0 length 4096.
>>> >   Error reading device /dev/ram13 at 0 length 4096.
>>> >   Error reading device /dev/ram14 at 0 length 4096.
>>> >   Error reading device /dev/ram15 at 0 length 4096.
>>> >   Error reading device /dev/sdb at 0 length 512.
>>> >   Error reading device /dev/sdb at 0 length 4096.
>>> >   Error reading device /dev/sdb1 at 0 length 4096.
>>> >   Error reading device /dev/sdb2 at 0 length 4096.
>>> >   Error reading device /dev/sdb3 at 0 length 4096.
>>> >   Read-only locking type set. Write locks are prohibited.
>>> >   Recovery of standalone physical volumes failed.
>>> >   Cannot process standalone physical volumes
>>> > bash-4.4#
>>> >
>>> > Attached the complete log in initial mail.
>>> >
>>> > Thanks.
>>> >
>>> > On Mon, 14 Sep 2020 at 20:29, Roger Heflin <rogerheflin@gmail.com> wrote:
>>> >>
>>> >> In general I would suggest fully disabling lvmetad from the config
>>> >> files and from being started up.
>>> >>
>>> >> Issues around it not answering (like above) and answering but somehow
>>> >> having stale/wrong info have burned me too many times to trust it.  It
>>> >> may be a lvmetad bug, or be udevd weirdness.
>>> >>
>>> >> The only significant improvement it makes is it reduces the lvm
>>> >> command time on installs with significant numbers of devices, but
>>> >> given that the info has been wrong often enough that is not worth the
>>> >> risk.
>>> >>
>>> >> On Mon, Sep 14, 2020 at 2:25 AM KrishnaMurali Chennuboina
>>> >> <krishchennu414@gmail.com> wrote:
>>> >> >
>>> >> > Hi Team,
>>> >> >
>>> >> > While trying to analyze one the issue, we felt that upgrading the current LVM2 package in our repository will be the best approach.
>>> >> > As part of that, we have updated the respective package from  2.02.176 to 2.02.180. We have verified the same and booted x86_64 hardware without any issues.
>>> >> >
>>> >> > But while trying to boot mips64 hardware we have started observing the below issue.  Providing the snippet of the log,
>>> >> >
>>> >> > # executing command: vgchange -an
>>> >> > (status, output): (0,   WARNING: Failed to connect to lvmetad. Falling back to device scanning.)
>>> >> >   WARNING: Failed to connect to lvmetad. Falling back to device scanning.
>>> >> >
>>> >> > Attached the detailed log for reference. There is no other change included other than the LVM2 update.
>>> >> >
>>> >> > LVM2 Version: 2.02.176
>>> >> > Updated LVM2 version: 2.02.180
>>> >> >
>>> >> > Please share inputs on why this issue is being observed with .180 version?
>>> >> > Please let me know if i can share any other information.
>>> >> >
>>> >> > Thanks.
>>> >> >
>>> >> > _______________________________________________
>>> >> > linux-lvm mailing list
>>> >> > linux-lvm@redhat.com
>>> >> > https://www.redhat.com/mailman/listinfo/linux-lvm
>>> >> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>> >>
>>> >> _______________________________________________
>>> >> linux-lvm mailing list
>>> >> linux-lvm@redhat.com
>>> >> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> >> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>> >>
>>> > _______________________________________________
>>> > linux-lvm mailing list
>>> > linux-lvm@redhat.com
>>> > https://www.redhat.com/mailman/listinfo/linux-lvm
>>> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
