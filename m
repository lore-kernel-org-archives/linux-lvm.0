Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3NBOArp018631
	for <linux-lvm@redhat.com>; Thu, 23 Apr 2009 07:24:10 -0400
Received: from pluto.sivell.com (z-t3.aifi.com [65.112.245.198])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3NBNB5r029232
	for <linux-lvm@redhat.com>; Thu, 23 Apr 2009 07:23:11 -0400
Message-ID: <49F04FA0.60007@sivell.com>
Date: Thu, 23 Apr 2009 06:23:12 -0500
From: Vu Pham <vu@sivell.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] re-activate lv after reboot ?
References: <49EDEA93.1090406@sivell.com>
	<4e3a31b90904222046h5419f7ceo95988fd68e749fa0@mail.gmail.com>
In-Reply-To: <4e3a31b90904222046h5419f7ceo95988fd68e749fa0@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: e@os.sg, LVM general discussion and development <linux-lvm@redhat.com>

Edward Choi wrote:
> On Tue, Apr 21, 2009 at 11:47 PM, vu pham <vu@sivell.com> wrote:
>> My server uses iscsiadm to access a remote iscsi device. VG and LV are
>> created on that device and can be accessed just fine.
>> The problem is after reboot, the LVs are in inactive mode and I have to run
>> vgchange -a y to activate the VG on the iscsi device or to put that command
>> /etc/rcd./rc.local.
>>
>> Is there any way to automatically to activate those LVs/VGs when the iscsi
>> device starts ?
>>
> 
> First make sure node.startup is set to automatic in /etc/iscsi/iscsi.conf. Then
> you can edit /etc/fstab and mount your lv using _netdev.
> 

Hi Ed, thanks for your reply. I did not say clearly in my original post. 
The server accesses this iscsi device as the back-end disk device for 
some domUs so it never mounts the LVs as system files.

Vu
