Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oBEGb1hS020451
	for <linux-lvm@redhat.com>; Tue, 14 Dec 2010 11:37:01 -0500
Received: from mail-qy0-f181.google.com (mail-qy0-f181.google.com
	[209.85.216.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oBEGaqQZ010208
	for <linux-lvm@redhat.com>; Tue, 14 Dec 2010 11:36:52 -0500
Received: by qyk12 with SMTP id 12so885177qyk.12
	for <linux-lvm@redhat.com>; Tue, 14 Dec 2010 08:36:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20101214161505.GA29811@esri.com>
References: <AANLkTi=zsNTng5n6gnEro_Dsb8_m+dszDUgxovRAX+LT@mail.gmail.com>
	<20101214161505.GA29811@esri.com>
From: Paolo Smiraglia <paolo.smiraglia@gmail.com>
Date: Tue, 14 Dec 2010 17:29:51 +0100
Message-ID: <AANLkTimUpPyJYwU9PD9FQCAYetowittFHvgpE=9EsmM4@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Shared LVM questions
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

2010/12/14 Ray Van Dolson <rvandolson@esri.com>:
> On Tue, Dec 14, 2010 at 07:59:19AM -0800, Paolo Smiraglia wrote:
>> Hi to every ones...
>>
>>
>> I would to setup a LVM build on top of an iSCSI disk shared between
>> some nodes which is managed by a Master Node (MN) that sents commands
>> to other nodes (N1, N2,...) through SSH.
>>
>> I think the cluster extension is not required because a particular
>> Logical Volume (LV) is accessed exclusively by one node, and because
>> LVM metadata cannot be modified at the same time by multiple nodes.
>>
>> One issue is that once a LV is created by a node it cannot be
>> activated by another node by executing the command
>>
>> � $> lvchange -aey vg/lv01
>>
>> and the LV created is a snapshot. The error displayed is
>>
>> � Can't change logical volume "lv01"
>>
>>
>> 1. In this scenario is CLVMD required?
>> 2. Is it possible to activate a LV in another node?
>>
>>
>> Thanks in advance for all replies.
>
> I haven't tried this, but you probably would need to release the LVM
> from use by node B for node A to activate and use it.
>
> Ray

Hi Ray, thanks for the faster reply...

The problem is that node B is unable to deactivate the Snapshot LV,
because the command

   $> lvchange -aen vg/lv01

fails with the message posted above (Can't change logical volume "lv01").

What is the correct way to deactivate the Snapshot LV in this scenario?

Thanks!


-- 
PAOLO SMIRAGLIA
http://portale.isf.polito.it/paolo-smiraglia
