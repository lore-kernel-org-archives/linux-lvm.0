Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7PCXIZb029611
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2010 08:33:18 -0400
Received: from mail-gx0-f174.google.com (mail-gx0-f174.google.com
	[209.85.161.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7PCX881017973
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2010 08:33:08 -0400
Received: by gxk23 with SMTP id 23so172946gxk.33
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2010 05:33:07 -0700 (PDT)
MIME-Version: 1.0
Sender: a.skwar@gmail.com
In-Reply-To: <4C750003.1090303@redhat.com>
References: <loom.20100825T121646-219@post.gmane.org>
	<4C750003.1090303@redhat.com>
From: Alexander Skwar <alexanders.mailinglists+nospam@gmail.com>
Date: Wed, 25 Aug 2010 13:38:05 +0200
Message-ID: <AANLkTin7w_A8brOLN=JeZZaXV8Y4wpAJyUOc7v0W15_X@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Internal error: Maps lock
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
To: Milan Broz <mbroz@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi.

2010/8/25 Milan Broz <mbroz@redhat.com>:
> On 08/25/2010 12:21 PM, Alexander Skwar wrote:
>> Hello again.
>>
>> I'm now running into another problem:
>>
>> + /sbin/lvm lvcreate --permission r --snapshot /dev/Sys/Home --name
>> Home-Backup_Snapshot --extents 15%ORIGIN
>>   Internal error: Maps lock 14004224 < unlock 14266368
>>   Logical volume "Home-Backup_Snapshot" created
>>
>> What does this "Internal error" mean? Did it actually cause any harm?
>
> No, you can ignore it.

Fine.

BTW: I noticed, that I don't (seem to) get this error message,
when I set the locale to de_CH.utf8. When I set it to C or POSIX,
I get this error message.

Alexander
--
↯    Lifestream (Twitter, Blog, …) ↣ http://alexs77.soup.io/     ↯
↯ Chat (Jabber/Google Talk) ↣ a.skwar@gmail.com , AIM: alexws77  ↯
